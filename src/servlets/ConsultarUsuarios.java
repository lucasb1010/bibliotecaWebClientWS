package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.StringArray;
import javax.xml.ws.BindingProvider;
import java.util.Map;

public class ConsultarUsuarios extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta 'action'");
            return;
        }

        try {
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            // Establecer timeouts para evitar cuelgues si el backend no responde
            BindingProvider bp = (BindingProvider) port;
            Map<String, Object> ctx = bp.getRequestContext();
            ctx.put("com.sun.xml.ws.connect.timeout", 5000);
            ctx.put("com.sun.xml.ws.request.timeout", 5000);
            ctx.put("com.sun.xml.internal.ws.connect.timeout", 5000);
            ctx.put("com.sun.xml.internal.ws.request.timeout", 5000);

            if ("suspender".equalsIgnoreCase(action)) {
                String correo = req.getParameter("correo");
                if (correo == null || correo.trim().isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Correo es requerido");
                    return;
                }
                port.suspenderUsuario(correo);
                resp.setContentType("application/json;charset=UTF-8");
                resp.getWriter().write("{\"ok\":true,\"accion\":\"toggle\"}");
                return;
            }

            if ("activar".equalsIgnoreCase(action)) {
                String correo = req.getParameter("correo");
                if (correo == null || correo.trim().isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Correo es requerido");
                    return;
                }
                // la misma operación alterna el estado
                port.suspenderUsuario(correo);
                resp.setContentType("application/json;charset=UTF-8");
                resp.getWriter().write("{\"ok\":true,\"accion\":\"toggle\"}");
                return;
            }

            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no soportada");
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.setContentType("application/json;charset=UTF-8");
            String msg = e.getMessage() == null ? "Error desconocido" : e.getMessage();
            resp.getWriter().write("{\"ok\":false,\"error\":\"" + msg.replace("\"", "\\\"") + "\"}");
        }
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Usar cliente JAX-WS generado por wsimport
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener lectores y bibliotecarios
            StringArray lectoresRes = port.listarLectores();
            StringArray bibliotecariosRes = port.listarBibliotecarios();
            
            String[] lectores = lectoresRes == null ? new String[0] : lectoresRes.getItem().toArray(new String[0]);
            String[] bibliotecarios = bibliotecariosRes == null ? new String[0] : bibliotecariosRes.getItem().toArray(new String[0]);
            
            // Pasar datos a la JSP
            req.setAttribute("lectores", lectores);
            req.setAttribute("bibliotecarios", bibliotecarios);
            req.getRequestDispatcher("/usuarios.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al consultar usuarios: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}
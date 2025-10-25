package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
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

            if ("cambiarZona".equalsIgnoreCase(action)) {
                String correo = req.getParameter("correo");
                String nuevaZona = req.getParameter("zona");
                if (correo == null || correo.trim().isEmpty() || nuevaZona == null || nuevaZona.trim().isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Correo y zona son requeridos");
                    return;
                }
                port.cambiarZona(correo, nuevaZona);
                resp.setContentType("application/json;charset=UTF-8");
                resp.getWriter().write("{\"ok\":true,\"accion\":\"cambiarZona\"}");
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
        String action = req.getParameter("action");
        
        // Si la acción es obtenerZonas, devolver JSON
        if ("obtenerZonas".equalsIgnoreCase(action)) {
            try {
                ControladorPublishService service = new ControladorPublishService();
                ControladorPublish port = service.getControladorPublishPort();
                
                List<String> zonas = port.obtenerTodasLasZonas();
                if (zonas == null) zonas = new java.util.ArrayList<>();
                resp.setContentType("application/json;charset=UTF-8");
                StringBuilder json = new StringBuilder("{\"ok\":true,\"zonas\":[");
                for (int i = 0; i < zonas.size(); i++) {
                    if (i > 0) json.append(",");
                    json.append("\"").append(zonas.get(i).replace("\"", "\\\"")).append("\"");
                }
                json.append("]}");
                resp.getWriter().write(json.toString());
                return;
            } catch (Exception e) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.setContentType("application/json;charset=UTF-8");
                String msg = e.getMessage() == null ? "Error desconocido" : e.getMessage();
                resp.getWriter().write("{\"ok\":false,\"error\":\"" + msg.replace("\"", "\\\"") + "\"}");
                return;
            }
        }
        
        try {
            // Usar cliente JAX-WS generado por wsimport
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener lectores, bibliotecarios y lectores suspendidos
            List<String> lectores = port.listarLectores();
            List<String> bibliotecarios = port.listarBibliotecarios();
            List<String> lectoresSuspendidos = port.listarLectoresSuspendidos();
            
            // Convertir a arrays si son null
            String[] lectoresArray = lectores == null ? new String[0] : lectores.toArray(new String[0]);
            String[] bibliotecariosArray = bibliotecarios == null ? new String[0] : bibliotecarios.toArray(new String[0]);
            String[] lectoresSuspendidosArray = lectoresSuspendidos == null ? new String[0] : lectoresSuspendidos.toArray(new String[0]);
            
            // Pasar datos a la JSP
            req.setAttribute("lectores", lectoresArray);
            req.setAttribute("bibliotecarios", bibliotecariosArray);
            req.setAttribute("lectoresSuspendidos", lectoresSuspendidosArray);
            req.getRequestDispatcher("/usuarios.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al consultar usuarios: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}
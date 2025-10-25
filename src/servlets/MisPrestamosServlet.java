package servlets;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class MisPrestamosServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener el correo del usuario logueado
            HttpSession session = req.getSession(false);
            if (session == null) {
                resp.sendRedirect("login.jsp");
                return;
            }
            
            String email = (String) session.getAttribute("email");
            if (email == null) {
                resp.sendRedirect("login.jsp");
                return;
            }
            
            // Usar cliente JAX-WS para obtener préstamos del lector
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener todos los préstamos (por ahora, luego filtraremos por lector)
            List<String> prestamosList = port.listarPrestamosString();
            
            // Filtrar préstamos del lector actual y agrupar por estado
            Map<String, List<String>> prestamosPorEstado = new HashMap<>();
            prestamosPorEstado.put("PENDIENTE", new ArrayList<>());
            prestamosPorEstado.put("EN_CURSO", new ArrayList<>());
            prestamosPorEstado.put("DEVUELTO", new ArrayList<>());
            
            if (prestamosList != null) {
                for (String prestamo : prestamosList) {
                    // Verificar si el préstamo pertenece al lector actual
                    if (prestamo.contains("Lector: " + email)) {
                        // Extraer el estado del préstamo
                        String estado = extraerEstado(prestamo);
                        if (estado != null && prestamosPorEstado.containsKey(estado)) {
                            prestamosPorEstado.get(estado).add(prestamo);
                        }
                    }
                }
            }
            
            // Pasar datos a la JSP
            req.setAttribute("prestamosPorEstado", prestamosPorEstado);
            req.setAttribute("emailLector", email);
            req.getRequestDispatcher("/misPrestamos.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al consultar préstamos: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
    
    private String extraerEstado(String prestamo) {
        try {
            // Formato: "Préstamo - Lector: correo, Bibliotecario: correo, Material: id, Estado: ESTADO"
            int estadoIndex = prestamo.indexOf("Estado: ");
            if (estadoIndex != -1) {
                return prestamo.substring(estadoIndex + 8).trim();
            }
        } catch (Exception e) {
            System.out.println("Error al extraer estado: " + e.getMessage());
        }
        return null;
    }
}

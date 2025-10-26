package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class PrestamosPorZonaServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener la sesión del usuario logueado
            HttpSession session = req.getSession(false);
            if (session == null) {
                resp.sendRedirect("login.jsp");
                return;
            }
            
            String tipoUsuario = (String) session.getAttribute("tipoUsuario");
            
            // Verificar que sea bibliotecario
            if (!"DtBibliotecario".equals(tipoUsuario)) {
                req.setAttribute("error", "Acceso denegado. Solo los bibliotecarios pueden acceder a esta página.");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            // Conectar al web service
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener todas las zonas disponibles
            List<String> zonasList = port.obtenerTodasLasZonas();
            String[] zonasArray = zonasList.toArray(new String[0]);
            
            // Obtener la zona seleccionada del parámetro
            String zonaSeleccionada = req.getParameter("zona");
            
            if (zonaSeleccionada != null && !zonaSeleccionada.isEmpty()) {
                // Obtener préstamos de la zona seleccionada
                // Note: This method needs to be regenerated from the WSDL
                // For now, we'll get all loans - once WSDL is regenerated, use:
                 List<String> prestamosList = port.obtenerPrestamosDeZona(zonaSeleccionada);
                 String[] prestamosZona = prestamosList.toArray(new String[0]);
                
                
                // Pasar datos a la JSP
                req.setAttribute("prestamos", prestamosZona);
                req.setAttribute("zonaSeleccionada", zonaSeleccionada);
                req.setAttribute("totalPrestamos", prestamosZona != null ? prestamosZona.length : 0);
            }
            
            // Pasar las zonas disponibles al JSP
            req.setAttribute("zonas", zonasArray);
            
            req.getRequestDispatcher("/prestamosPorZona.jsp").forward(req, resp);
            
        } catch (Exception e) {
            System.err.println("Error en PrestamosPorZonaServlet: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Error al obtener los préstamos por zona: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}


package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtPrestamo;
import java.util.List;
import java.util.ArrayList;

public class ConsultarHistorialLectorServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Verificar que el usuario esté logueado y sea bibliotecario
            HttpSession session = req.getSession(false);
            if (session == null) {
                resp.sendRedirect("login.jsp");
                return;
            }
            
            String tipoUsuario = (String) session.getAttribute("tipoUsuario");
            if (!"DtBibliotecario".equals(tipoUsuario)) {
                req.setAttribute("error", "Acceso denegado. Solo los bibliotecarios pueden acceder a esta función.");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            // Obtener el lector a consultar desde parámetros
            String lectorCorreo = req.getParameter("lectorCorreo");
            if (lectorCorreo == null || lectorCorreo.trim().isEmpty()) {
                // Si no se especifica lector, mostrar formulario de selección
                mostrarSelectorLector(req, resp);
                return;
            }
            
            // Usar cliente JAX-WS para obtener préstamos del lector
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener todos los préstamos y filtrar por lector
            List<String> todosPrestamos = port.listarPrestamos();
            List<String> prestamosLector = new ArrayList<>();
            
            if (todosPrestamos != null) {
                for (String prestamo : todosPrestamos) {
                    // El formato es: "Material X | Lector correo | Bibliotecario correo | Estado ESTADO | Solicitud DD/MM/YYYY | Devolución DD/MM/YYYY"
                    if (prestamo.contains("Lector " + lectorCorreo)) {
                        prestamosLector.add(prestamo);
                    }
                }
            }
            
            req.setAttribute("prestamos", prestamosLector);
            req.setAttribute("lectorCorreo", lectorCorreo);
            req.getRequestDispatcher("/consultarHistorialLector.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al consultar historial: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
    
    private void mostrarSelectorLector(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Cargar lista de lectores para el selector
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            List<String> lectores = port.listarLectores();
            if (lectores == null) lectores = new ArrayList<>();
            
            req.setAttribute("lectores", lectores);
            req.getRequestDispatcher("/selectorLector.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al cargar lista de lectores: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}

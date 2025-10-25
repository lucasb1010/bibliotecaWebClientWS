package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class HistorialPrestamosBibliotecario extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener la sesión del usuario logueado
            HttpSession session = req.getSession(false);
            if (session == null) {
                resp.sendRedirect("login.jsp");
                return;
            }
            
            String correoBibliotecario = (String) session.getAttribute("email");
            String tipoUsuario = (String) session.getAttribute("tipoUsuario");
            
            // Debug: imprimir información de la sesión
            System.out.println("DEBUG - Correo bibliotecario: " + correoBibliotecario);
            System.out.println("DEBUG - Tipo usuario: " + tipoUsuario);
            
            // Verificar que sea bibliotecario
            if (!"DtBibliotecario".equals(tipoUsuario)) {
                req.setAttribute("error", "Acceso denegado. Solo los bibliotecarios pueden acceder a esta página.");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            if (correoBibliotecario == null || correoBibliotecario.trim().isEmpty()) {
                req.setAttribute("error", "No se pudo identificar al bibliotecario.");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            // Conectar al web service
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener préstamos específicos del bibliotecario
            // Usar el método específico para bibliotecarios
            List<String> prestamosDelBibliotecario = new java.util.ArrayList<>();
            
            try {
                // Intentar usar el método específico para bibliotecarios
                // Primero obtenemos todos los préstamos y filtramos
                List<String> todosLosPrestamos = port.listarPrestamos();
                
                System.out.println("DEBUG - Total préstamos encontrados: " + (todosLosPrestamos != null ? todosLosPrestamos.size() : 0));
                
                if (todosLosPrestamos != null) {
                    for (String prestamo : todosLosPrestamos) {
                        System.out.println("DEBUG - Préstamo: " + prestamo);
                        // Buscar el correo del bibliotecario en la información del préstamo
                        if (prestamo.contains(correoBibliotecario)) {
                            prestamosDelBibliotecario.add(prestamo);
                            System.out.println("DEBUG - Préstamo del bibliotecario encontrado: " + prestamo);
                        }
                    }
                }
            } catch (Exception e) {
                System.err.println("Error al obtener préstamos: " + e.getMessage());
                e.printStackTrace();
            }
            
            // Pasar datos a la JSP
            req.setAttribute("prestamos", prestamosDelBibliotecario);
            req.setAttribute("correoBibliotecario", correoBibliotecario);
            req.setAttribute("totalPrestamos", prestamosDelBibliotecario.size());
            
            req.getRequestDispatcher("/historialPrestamosBibliotecario.jsp").forward(req, resp);
            
        } catch (Exception e) {
            System.err.println("Error en HistorialPrestamosBibliotecario: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Error al obtener el historial de préstamos: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}

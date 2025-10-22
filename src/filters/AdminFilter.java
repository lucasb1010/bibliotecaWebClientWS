package filters;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminFilter implements Filter {
    
    public void init(FilterConfig config) throws ServletException {
        // Inicialización del filtro
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        // Obtener la sesión
        HttpSession session = req.getSession(false);
        
        // Verificar si el usuario está logueado
        String nombreUsuario = (String) session.getAttribute("nombreUsuario");
        String tipoUsuario = (String) session.getAttribute("tipoUsuario");
        
        if (nombreUsuario == null) {
            // Usuario no logueado - redirigir a login
            resp.sendRedirect("login.jsp");
            return;
        }
        
        // Verificar si es bibliotecario
        if (!"DtBibliotecario".equals(tipoUsuario)) {
            // No es bibliotecario - mostrar error de acceso
            req.setAttribute("error", "Acceso denegado. Solo los bibliotecarios pueden acceder a esta página administrativa.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        
        // Usuario es bibliotecario - permitir acceso
        chain.doFilter(request, response);
    }
    
    public void destroy() {
        // Limpieza del filtro
    }
}

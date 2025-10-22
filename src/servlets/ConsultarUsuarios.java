package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class ConsultarUsuarios extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Usar cliente JAX-WS generado por wsimport
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener lectores y bibliotecarios
            List<String> lectoresRes = port.listarLectores();
            List<String> bibliotecariosRes = port.listarBibliotecarios();
            
            String[] lectores = lectoresRes == null ? new String[0] : lectoresRes.toArray(new String[0]);
            String[] bibliotecarios = bibliotecariosRes == null ? new String[0] : bibliotecariosRes.toArray(new String[0]);
            
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
package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.StringArray;

public class ConsultarUsuarios extends HttpServlet {
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
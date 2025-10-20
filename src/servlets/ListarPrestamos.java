package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class ListarPrestamos extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            // Llamar al método real ahora disponible en el WSDL
            List<String> prestamos = port.listarPrestamos();
            req.setAttribute("prestamos", prestamos);
            req.getRequestDispatcher("/prestamos.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error al listar préstamos: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}

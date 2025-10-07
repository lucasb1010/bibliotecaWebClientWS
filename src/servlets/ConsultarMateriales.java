package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.*;

public class ConsultarMateriales extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ControladorPublishProxy proxy = new ControladorPublishProxy();
		proxy.setEndpoint("http://localhost:9129/controlador"); // endpoint del WS

		String[] materiales = proxy.listarMateriales();
		req.setAttribute("materiales", materiales);
		req.getRequestDispatcher("/consultas.jsp").forward(req, resp);
	}
}
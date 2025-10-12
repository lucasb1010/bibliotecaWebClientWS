package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.StringArray;

public class ConsultarMateriales extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Usar cliente JAX-WS generado por wsimport (ControladorPublishService)
		ControladorPublishService service = new ControladorPublishService();
		ControladorPublish port = service.getControladorPublishPort();
		StringArray res = port.listarMateriales();
		String[] materiales = res == null ? new String[0] : res.getItem().toArray(new String[0]);
		req.setAttribute("materiales", materiales);
		req.getRequestDispatcher("/consultas.jsp").forward(req, resp);
	}
}
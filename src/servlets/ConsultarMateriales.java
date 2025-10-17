package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class ConsultarMateriales extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Usar cliente JAX-WS generado por wsimport (ControladorPublishService)
			ControladorPublishService service = new ControladorPublishService();
			ControladorPublish port = service.getControladorPublishPort();
			
			// Intentar obtener materiales
			List<String> res = port.listarMateriales();
			
			// Manejar caso cuando no hay materiales o la lista es null
			String[] materiales;
			if (res == null || res.isEmpty()) {
				materiales = new String[0];
				req.setAttribute("mensaje", "No hay materiales registrados en la biblioteca. Puedes agregar algunos usando el formulario de agregar materiales.");
			} else {
				materiales = res.toArray(new String[0]);
			}
			
			req.setAttribute("materiales", materiales);
			req.getRequestDispatcher("/consultas.jsp").forward(req, resp);
			
		} catch (Exception e) {
			// Log del error para debugging
			System.err.println("Error en ConsultarMateriales: " + e.getMessage());
			e.printStackTrace();
			
			// Mensaje de error más específico
			String errorMessage = "Error al consultar materiales: " + e.getMessage();
			if (e.getMessage() != null && e.getMessage().contains("NullPointerException")) {
				errorMessage = "No se pudieron obtener los materiales. Es posible que no haya materiales registrados o que haya un problema con la base de datos.";
			}
			
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}
}
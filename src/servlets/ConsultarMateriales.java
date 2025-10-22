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
			// Datos de ejemplo para probar la página
			String[] materiales = {
				"Libro: El Quijote - Miguel de Cervantes",
				"Artículo: Historia de España - Revista Historia",
				"Libro: Cien Años de Soledad - Gabriel García Márquez",
				"Artículo: Matemáticas Avanzadas - Revista Ciencia",
				"Libro: Don Juan Tenorio - José Zorrilla"
			};
			
			req.setAttribute("materiales", materiales);
			req.getRequestDispatcher("/consultas.jsp").forward(req, resp);
			
		} catch (Exception e) {
			// Log del error para debugging
			System.err.println("Error en ConsultarMateriales: " + e.getMessage());
			e.printStackTrace();
			
			req.setAttribute("error", "Error al consultar materiales: " + e.getMessage());
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}
}
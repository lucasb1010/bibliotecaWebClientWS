package servlets;

import java.io.IOException;
import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtFecha;

public class ConsultarMateriales extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Obtener parámetros de filtro de fechas y préstamos
			String fechaDesdeStr = req.getParameter("fechaDesde");
			String fechaHastaStr = req.getParameter("fechaHasta");
			String prestamosMinimosStr = req.getParameter("prestamosMinimos");
			
			List<String> materialesList;
			
			// Intentar conectar al web service
			ControladorPublishService service = null;
			ControladorPublish port = null;
			
			try {
				service = new ControladorPublishService();
				port = service.getControladorPublishPort();
				System.out.println("Web service conectado exitosamente");
			} catch (Exception e) {
				System.err.println("Error al conectar con el web service: " + e.getMessage());
				e.printStackTrace();
				
				// No mostrar datos simulados, solo un mensaje de error claro
				req.setAttribute("error", "No se pudo conectar con el servicio de materiales. Por favor, verifique que el servicio esté funcionando e intente nuevamente.");
				req.getRequestDispatcher("/error.jsp").forward(req, resp);
				return;
			}
			
			// Log de parámetros recibidos
			System.out.println("=== ConsultarMateriales Debug ===");
			System.out.println("fechaDesdeStr: " + fechaDesdeStr);
			System.out.println("fechaHastaStr: " + fechaHastaStr);
			System.out.println("prestamosMinimosStr: " + prestamosMinimosStr);
			
			// Verificar si se proporcionó filtro de préstamos
			if (prestamosMinimosStr != null && !prestamosMinimosStr.trim().isEmpty()) {
				try {
					int prestamosMinimos = Integer.parseInt(prestamosMinimosStr);
					System.out.println("Filtrando materiales con " + prestamosMinimos + " o más préstamos...");
					
					materialesList = port.listarMaterialesConMuchosPrestamos(prestamosMinimos);
					System.out.println("Materiales con muchos préstamos obtenidos: " + (materialesList != null ? materialesList.size() : "null"));
					
					req.setAttribute("mensaje", "Materiales con " + prestamosMinimos + " o más préstamos (" + (materialesList != null ? materialesList.size() : 0) + " resultados)");
					
				} catch (NumberFormatException e) {
					System.err.println("Error al parsear número de préstamos: " + e.getMessage());
					req.setAttribute("mensaje", "Error: El número de préstamos debe ser un valor numérico válido. Mostrando todos los materiales.");
					materialesList = port.listarMateriales();
				} catch (Exception e) {
					System.err.println("Error al filtrar por préstamos: " + e.getMessage());
					e.printStackTrace();
					req.setAttribute("mensaje", "Error al filtrar por préstamos: " + e.getMessage() + ". Mostrando todos los materiales.");
					materialesList = port.listarMateriales();
				}
			}
			// Verificar si se proporcionaron fechas para filtrar
			else if (fechaDesdeStr != null && !fechaDesdeStr.trim().isEmpty() && 
				fechaHastaStr != null && !fechaHastaStr.trim().isEmpty()) {
				
				try {
					System.out.println("Intentando filtrar por fechas...");
					
					// Convertir strings a DtFecha
					DtFecha fechaDesde = crearDtFecha(fechaDesdeStr);
					DtFecha fechaHasta = crearDtFecha(fechaHastaStr);
					
					System.out.println("DtFecha desde: " + fechaDesde.getDia() + "/" + fechaDesde.getMes() + "/" + fechaDesde.getAnio());
					System.out.println("DtFecha hasta: " + fechaHasta.getDia() + "/" + fechaHasta.getMes() + "/" + fechaHasta.getAnio());
					
					// Obtener materiales filtrados por rango de fechas
					System.out.println("Llamando a obtenerMaterialesPorRangoFechas...");
					materialesList = port.obtenerMaterialesPorRangoFechas(fechaDesde, fechaHasta);
					System.out.println("Respuesta del web service: " + (materialesList != null ? materialesList.size() : "null") + " materiales");
					
					// Agregar mensaje informativo
					req.setAttribute("mensaje", "Materiales filtrados desde " + fechaDesdeStr + " hasta " + fechaHastaStr + " (" + (materialesList != null ? materialesList.size() : 0) + " resultados)");
					
				} catch (Exception e) {
					System.err.println("Error al filtrar por fechas: " + e.getMessage());
					e.printStackTrace();
					
					// Verificar si es un error específico de HQL/backend
					String errorMessage = e.getMessage();
					if (errorMessage != null && errorMessage.contains("could not resolve property")) {
						// Error específico del backend - problema con la consulta HQL
						try {
							materialesList = port.listarMateriales();
							req.setAttribute("mensaje", "⚠️ El filtro de fechas no está disponible debido a un problema en el backend. Mostrando todos los materiales (" + (materialesList != null ? materialesList.size() : 0) + " resultados).");
						} catch (Exception e2) {
							System.err.println("Error también al obtener todos los materiales: " + e2.getMessage());
							e2.printStackTrace();
							req.setAttribute("error", "Error al conectar con el servicio de materiales: " + e2.getMessage());
							req.getRequestDispatcher("/error.jsp").forward(req, resp);
							return;
						}
					} else {
						// Otro tipo de error
						try {
							materialesList = port.listarMateriales();
							req.setAttribute("mensaje", "Error en el filtro de fechas: " + e.getMessage() + ". Mostrando todos los materiales (" + (materialesList != null ? materialesList.size() : 0) + " resultados).");
						} catch (Exception e2) {
							System.err.println("Error también al obtener todos los materiales: " + e2.getMessage());
							e2.printStackTrace();
							req.setAttribute("error", "Error al conectar con el servicio de materiales: " + e2.getMessage());
							req.getRequestDispatcher("/error.jsp").forward(req, resp);
							return;
						}
					}
				}
			} else {
				System.out.println("No se proporcionaron fechas, obteniendo todos los materiales...");
				// Obtener todos los materiales
				try {
					materialesList = port.listarMateriales();
					System.out.println("Materiales obtenidos: " + (materialesList != null ? materialesList.size() : "null"));
				} catch (Exception e) {
					System.err.println("Error al obtener todos los materiales: " + e.getMessage());
					e.printStackTrace();
					req.setAttribute("error", "Error al conectar con el servicio de materiales: " + e.getMessage());
					req.getRequestDispatcher("/error.jsp").forward(req, resp);
					return;
				}
			}
			
			// Convertir a array si es null
			String[] materiales = materialesList == null ? new String[0] : materialesList.toArray(new String[0]);
			
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
	
	/**
	 * Convierte un string de fecha (YYYY-MM-DD) a DtFecha
	 */
	private DtFecha crearDtFecha(String fechaStr) {
		try {
			LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ISO_LOCAL_DATE);
			
			DtFecha dtFecha = new DtFecha();
			dtFecha.setDia(fecha.getDayOfMonth());
			dtFecha.setMes(fecha.getMonthValue());
			dtFecha.setAnio(fecha.getYear());
			
			return dtFecha;
		} catch (Exception e) {
			throw new IllegalArgumentException("Formato de fecha inválido: " + fechaStr, e);
		}
	}
	
}
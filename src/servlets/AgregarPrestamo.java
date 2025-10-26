package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtFecha;
import publicadores.DtPrestamo;
import publicadores.EstadoPrestamo;

public class AgregarPrestamo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Verificar si hay un usuario logueado
			String emailUsuario = (String) req.getSession().getAttribute("email");
			String tipoUsuario = (String) req.getSession().getAttribute("tipoUsuario");
			
			if (emailUsuario == null) {
				req.setAttribute("error", "Debe iniciar sesión para acceder a esta página.");
				req.getRequestDispatcher("/error.jsp").forward(req, resp);
				return;
			}
			
			// Si es un lector, verificar si está suspendido
			if (tipoUsuario != null && tipoUsuario.equals("DtLector")) {
				ControladorPublishService service = new ControladorPublishService();
				ControladorPublish port = service.getControladorPublishPort();
				
				List<String> lectoresSuspendidos = port.listarLectoresSuspendidos();
				if (lectoresSuspendidos != null && lectoresSuspendidos.contains(emailUsuario)) {
					req.setAttribute("error", "Acceso denegado: Estás suspendido y no puedes solicitar préstamos.");
					req.getRequestDispatcher("/error.jsp").forward(req, resp);
					return;
				}
			}
			
			ControladorPublishService service = new ControladorPublishService();
			ControladorPublish port = service.getControladorPublishPort();

			List<String> materialesIds = port.listarIdsMateriales();
			List<String> lectores = port.listarLectores();
			List<String> bibliotecarios = port.listarBibliotecarios();

			req.setAttribute("materialesIds", materialesIds);
			req.setAttribute("lectores", lectores);
			req.setAttribute("bibliotecarios", bibliotecarios);
			req.getRequestDispatcher("/agregarPrestamo.jsp").forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("error", "Error cargando datos para préstamo: " + e.getMessage());
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String materialIdStr = req.getParameter("materialId");
			String lectorCorreo = req.getParameter("lectorCorreo");
			String bibliotecarioCorreo = req.getParameter("bibliotecarioCorreo");
			String fechaSolicitud = req.getParameter("fechaSolicitud");
			String fechaDevolucion = req.getParameter("fechaDevolucion");

			System.out.println("[AgregarPrestamo] POST -> materialId=" + materialIdStr + ", lector=" + lectorCorreo + ", bibliotecario=" + bibliotecarioCorreo + ", fechaSol=" + fechaSolicitud + ", fechaDev=" + fechaDevolucion);

			if (materialIdStr == null || materialIdStr.isEmpty() || lectorCorreo == null || lectorCorreo.isEmpty() || bibliotecarioCorreo == null || bibliotecarioCorreo.isEmpty()) {
				req.setAttribute("error", "Todos los campos marcados como obligatorios son requeridos.");
				doGet(req, resp);
				return;
			}

			ControladorPublishService service = new ControladorPublishService();
			ControladorPublish port = service.getControladorPublishPort();

			Long materialId = Long.parseLong(materialIdStr);

			DtPrestamo dt = new DtPrestamo();
			dt.setMaterialId(materialId);
			dt.setLectorCorreo(lectorCorreo);
			dt.setBibliotecarioCorreo(bibliotecarioCorreo);
			dt.setEstado(EstadoPrestamo.PENDIENTE);

			if (fechaSolicitud != null && !fechaSolicitud.trim().isEmpty()) {
				DtFecha fs = parseFechaIso(fechaSolicitud);
				if (fs != null) dt.setFechaSolicitud(fs);
			}
			if (fechaDevolucion != null && !fechaDevolucion.trim().isEmpty()) {
				DtFecha fd = parseFechaIso(fechaDevolucion);
				if (fd != null) dt.setFechaDevolucion(fd);
			}

			port.agregarPrestamo(dt);

			req.setAttribute("mensaje", "Préstamo creado exitosamente.");
			doGet(req, resp);
		} catch (javax.xml.ws.soap.SOAPFaultException sfe) {
			String detail = "SOAPFault: " + (sfe.getFault() != null ? sfe.getFault().getFaultString() : sfe.getMessage());
			Throwable cause = sfe;
			while (cause != null) {
				detail += " | causa=" + cause.getClass().getSimpleName() + ": " + (cause.getMessage() != null ? cause.getMessage() : "");
				cause = cause.getCause();
			}
			System.err.println("[AgregarPrestamo] Error SOAP: " + detail);
			req.setAttribute("error", "Error al crear el préstamo: " + detail);
			doGet(req, resp);
		} catch (Exception e) {
			String detail = e.getClass().getSimpleName() + ": " + (e.getMessage() != null ? e.getMessage() : "");
			Throwable cause = e.getCause();
			while (cause != null) {
				detail += " | causa=" + cause.getClass().getSimpleName() + ": " + (cause.getMessage() != null ? cause.getMessage() : "");
				cause = cause.getCause();
			}
			System.err.println("[AgregarPrestamo] Error general: " + detail);
			req.setAttribute("error", "Error al crear el préstamo: " + detail);
			doGet(req, resp);
		}
	}

	private DtFecha parseFechaIso(String isoDate) {
		try {
			String[] parts = isoDate.split("-");
			if (parts.length != 3) return null;
			DtFecha fecha = new DtFecha();
			fecha.setAnio(Integer.parseInt(parts[0]));
			fecha.setMes(Integer.parseInt(parts[1]));
			fecha.setDia(Integer.parseInt(parts[2]));
			return fecha;
		} catch (Exception ex) {
			return null;
		}
	}
}

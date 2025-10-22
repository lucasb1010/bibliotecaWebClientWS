package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import java.util.List;
import java.util.ArrayList;

public class ListarPrestamos extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Usar cliente JAX-WS generado por wsimport
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener préstamos reales de la base de datos
            List<String> prestamosList = port.listarPrestamosString();
            List<String> prestamos = new ArrayList<>();
            if (prestamosList != null) {
                prestamos.addAll(prestamosList);
            }
            
            // Pasar datos a la JSP
            req.setAttribute("prestamos", prestamos);
            req.getRequestDispatcher("/prestamos.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al consultar préstamos: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener parámetros del formulario
            String lectorCorreo = req.getParameter("lectorCorreo");
            String bibliotecarioCorreo = req.getParameter("bibliotecarioCorreo");
            String materialIdStr = req.getParameter("materialId");
            String nuevoEstado = req.getParameter("nuevoEstado");
            
            if (lectorCorreo == null || bibliotecarioCorreo == null || materialIdStr == null || nuevoEstado == null) {
                req.setAttribute("error", "Parámetros faltantes");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            Long materialId = Long.parseLong(materialIdStr);
            
            // Usar cliente JAX-WS para cambiar el estado
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            port.cambiarEstadoPrestamo(lectorCorreo, bibliotecarioCorreo, materialId, nuevoEstado);
            
            // Redirigir de vuelta a la lista de préstamos
            resp.sendRedirect("listarPrestamos");
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al cambiar estado del préstamo: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}
package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtPrestamo;
import publicadores.DtFecha;
import publicadores.EstadoPrestamo;
import java.util.List;
import java.util.ArrayList;

public class ActualizarPrestamoServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener parámetros del préstamo a actualizar
            String lectorCorreo = req.getParameter("lectorCorreo");
            String bibliotecarioCorreo = req.getParameter("bibliotecarioCorreo");
            String materialIdStr = req.getParameter("materialId");
            
            if (lectorCorreo == null || bibliotecarioCorreo == null || materialIdStr == null) {
                req.setAttribute("error", "Parámetros faltantes para actualizar préstamo");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            Long materialId = Long.parseLong(materialIdStr);
            
            // Usar cliente JAX-WS para obtener información del préstamo
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Obtener lista de préstamos para encontrar el específico
            List<String> prestamosList = port.listarPrestamosString();
            String prestamoInfo = null;
            
            for (String p : prestamosList) {
                if (p.contains("Lector: " + lectorCorreo) && 
                    p.contains("Bibliotecario: " + bibliotecarioCorreo) && 
                    p.contains("Material: " + materialId)) {
                    prestamoInfo = p;
                    break;
                }
            }
            
            if (prestamoInfo == null) {
                req.setAttribute("error", "Préstamo no encontrado");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            // Cargar listas para los selectores
            List<String> lectores = port.listarLectores();
            List<String> bibliotecarios = port.listarBibliotecarios();
            List<String> materiales = port.listarMateriales();
            
            // Asegurar que las listas no sean null
            if (lectores == null) lectores = new ArrayList<>();
            if (bibliotecarios == null) bibliotecarios = new ArrayList<>();
            if (materiales == null) materiales = new ArrayList<>();
            
            // Pasar datos a la JSP
            req.setAttribute("prestamoInfo", prestamoInfo);
            req.setAttribute("lectorCorreo", lectorCorreo);
            req.setAttribute("bibliotecarioCorreo", bibliotecarioCorreo);
            req.setAttribute("materialId", materialId.toString());
            req.setAttribute("lectores", lectores);
            req.setAttribute("bibliotecarios", bibliotecarios);
            req.setAttribute("materiales", materiales);
            req.getRequestDispatcher("/actualizarPrestamo.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al cargar préstamo: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Obtener parámetros originales (para identificar el préstamo)
            String lectorCorreoOriginal = req.getParameter("lectorCorreoOriginal");
            String bibliotecarioCorreoOriginal = req.getParameter("bibliotecarioCorreoOriginal");
            String materialIdOriginalStr = req.getParameter("materialIdOriginal");
            
            // Obtener nuevos valores
            String nuevoLector = req.getParameter("nuevoLector");
            String nuevoBibliotecario = req.getParameter("nuevoBibliotecario");
            String nuevoMaterial = req.getParameter("nuevoMaterial");
            String diaSolicitud = req.getParameter("diaSolicitud");
            String mesSolicitud = req.getParameter("mesSolicitud");
            String anioSolicitud = req.getParameter("anioSolicitud");
            String diaDevolucion = req.getParameter("diaDevolucion");
            String mesDevolucion = req.getParameter("mesDevolucion");
            String anioDevolucion = req.getParameter("anioDevolucion");
            String estado = req.getParameter("estado");
            
            // Validar parámetros
            if (lectorCorreoOriginal == null || bibliotecarioCorreoOriginal == null || materialIdOriginalStr == null ||
                nuevoLector == null || nuevoBibliotecario == null || nuevoMaterial == null ||
                diaSolicitud == null || mesSolicitud == null || anioSolicitud == null ||
                diaDevolucion == null || mesDevolucion == null || anioDevolucion == null ||
                estado == null) {
                req.setAttribute("error", "Todos los campos son obligatorios");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            
            Long materialIdOriginal = Long.parseLong(materialIdOriginalStr);
            
            // Extraer ID del material del string seleccionado
            Long nuevoMaterialId = null;
            if (nuevoMaterial != null) {
                try {
                    String materialIdStr = nuevoMaterial.trim();
                    System.out.println("DEBUG: Material recibido: '" + materialIdStr + "'");
                    
                    // El formato recibido es: "ID: 2 | Tipo: ARTÍCULO | Descripción: mesa | Fecha Ingreso: 02/02/0222"
                    if (materialIdStr.startsWith("ID: ")) {
                        // Extraer solo el número después de "ID: " y antes del " |"
                        materialIdStr = materialIdStr.substring(4); // Quitar "ID: "
                        System.out.println("DEBUG: Después de quitar 'ID: ': '" + materialIdStr + "'");
                        
                        if (materialIdStr.contains(" |")) {
                            materialIdStr = materialIdStr.substring(0, materialIdStr.indexOf(" |"));
                            System.out.println("DEBUG: Después de quitar ' |': '" + materialIdStr + "'");
                        }
                        materialIdStr = materialIdStr.trim();
                        System.out.println("DEBUG: ID final a parsear: '" + materialIdStr + "'");
                    }
                    
                    nuevoMaterialId = Long.parseLong(materialIdStr);
                    System.out.println("DEBUG: ID parseado exitosamente: " + nuevoMaterialId);
                } catch (Exception e) {
                    req.setAttribute("error", "Error al procesar el material seleccionado: " + e.getMessage() + 
                        " (Material recibido: '" + nuevoMaterial + "')");
                    req.getRequestDispatcher("/error.jsp").forward(req, resp);
                    return;
                }
            }
            
            // Crear objetos DtFecha
            DtFecha fechaSolicitud = new DtFecha();
            fechaSolicitud.setDia(Integer.parseInt(diaSolicitud));
            fechaSolicitud.setMes(Integer.parseInt(mesSolicitud));
            fechaSolicitud.setAnio(Integer.parseInt(anioSolicitud));
            
            DtFecha fechaDevolucion = new DtFecha();
            fechaDevolucion.setDia(Integer.parseInt(diaDevolucion));
            fechaDevolucion.setMes(Integer.parseInt(mesDevolucion));
            fechaDevolucion.setAnio(Integer.parseInt(anioDevolucion));
            
            // Crear DtPrestamo con los datos actualizados
            DtPrestamo dtPrestamo = new DtPrestamo();
            dtPrestamo.setLectorCorreo(nuevoLector);
            dtPrestamo.setBibliotecarioCorreo(nuevoBibliotecario);
            dtPrestamo.setMaterialId(nuevoMaterialId);
            dtPrestamo.setFechaSolicitud(fechaSolicitud);
            dtPrestamo.setFechaDevolucion(fechaDevolucion);
            dtPrestamo.setEstado(EstadoPrestamo.fromValue(estado));
            
            // Usar cliente JAX-WS para actualizar el préstamo
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Verificar si se cambiaron los identificadores principales
            boolean cambioIdentificadores = !lectorCorreoOriginal.equals(nuevoLector) || 
                                          !bibliotecarioCorreoOriginal.equals(nuevoBibliotecario) || 
                                          !materialIdOriginal.equals(nuevoMaterialId);
            
            if (cambioIdentificadores) {
                // Si se cambiaron identificadores, necesitamos eliminar el préstamo original y crear uno nuevo
                // Por ahora, solo actualizamos el estado del préstamo original
                // TODO: Implementar lógica completa de cambio de identificadores
                port.cambiarEstadoPrestamo(lectorCorreoOriginal, bibliotecarioCorreoOriginal, materialIdOriginal, estado);
            } else {
                // Si no se cambiaron identificadores, intentar actualización completa
                try {
                    // Este método estará disponible después de regenerar los clientes
                    port.actualizarPrestamo(dtPrestamo);
                } catch (Exception e) {
                    // Fallback: solo cambiar estado si el método completo no está disponible
                    port.cambiarEstadoPrestamo(lectorCorreoOriginal, bibliotecarioCorreoOriginal, materialIdOriginal, estado);
                }
            }
            
            // Redirigir de vuelta a la lista de préstamos
            resp.sendRedirect("listarPrestamos");
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al actualizar préstamo: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}

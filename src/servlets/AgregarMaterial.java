package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtArticulo;
import publicadores.DtLibro;
import publicadores.DtFecha;

public class AgregarMaterial extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Mostrar el formulario de agregar material
        req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String tipo = req.getParameter("tipo");
            
            // Log para debugging
            System.out.println("Intentando agregar material de tipo: " + tipo);
            
            // Validaciones básicas
            if (tipo == null || tipo.trim().isEmpty()) {
                req.setAttribute("error", "El tipo de material es obligatorio");
                req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
                return;
            }
            
            // Usar cliente JAX-WS generado por wsimport
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            System.out.println("Web service conectado exitosamente");
            
            if ("libro".equals(tipo)) {
                // Crear libro
                DtLibro libro = new DtLibro();
                
                // Campos específicos del libro
                String titulo = req.getParameter("titulo");
                String cantidadPaginas = req.getParameter("cantidadPaginas");
                
                System.out.println("Datos del libro - Título: " + titulo + ", Páginas: " + cantidadPaginas);
                
                if (titulo != null && !titulo.trim().isEmpty()) {
                    libro.setTitulo(titulo);
                }
                
                if (cantidadPaginas != null && !cantidadPaginas.trim().isEmpty()) {
                    libro.setCantidadPaginas(cantidadPaginas);
                }
                
                // El ID se genera automáticamente en la base de datos
                // No necesitamos establecerlo manualmente
                
                // Fecha de ingreso (opcional)
                String fechaIngreso = req.getParameter("fechaIngreso");
                if (fechaIngreso != null && !fechaIngreso.trim().isEmpty()) {
                    try {
                        // Parsear fecha del formato YYYY-MM-DD
                        String[] partes = fechaIngreso.split("-");
                        if (partes.length == 3) {
                            DtFecha fecha = new DtFecha();
                            fecha.setAnio(Integer.parseInt(partes[0]));
                            fecha.setMes(Integer.parseInt(partes[1]));
                            fecha.setDia(Integer.parseInt(partes[2]));
                            libro.setFechaIngreso(fecha);
                            System.out.println("Fecha de ingreso establecida: " + fechaIngreso + " -> " + fecha.getDia() + "/" + fecha.getMes() + "/" + fecha.getAnio());
                        }
                    } catch (Exception e) {
                        System.out.println("Error parseando fecha: " + e.getMessage());
                        // Continuar sin fecha si hay error
                    }
                }
                
                System.out.println("Llamando a port.agregarLibro()...");
                port.agregarLibro(libro);
                System.out.println("Libro agregado exitosamente");
                
            } else if ("articulo".equals(tipo)) {
                // Crear artículo
                DtArticulo articulo = new DtArticulo();
                
                // Campos específicos del artículo
                String descripcion = req.getParameter("descripcion");
                String pesoKgStr = req.getParameter("pesoKg");
                String dimensiones = req.getParameter("dimensiones");
                
                System.out.println("Datos del artículo - Descripción: " + descripcion + ", Peso: " + pesoKgStr + ", Dimensiones: " + dimensiones);
                
                if (descripcion != null && !descripcion.trim().isEmpty()) {
                    articulo.setDescripcion(descripcion);
                }
                
                if (pesoKgStr != null && !pesoKgStr.trim().isEmpty()) {
                    try {
                        float pesoKg = Float.parseFloat(pesoKgStr);
                        articulo.setPesoKg(pesoKg);
                        System.out.println("Peso convertido: " + pesoKg);
                    } catch (NumberFormatException e) {
                        req.setAttribute("error", "El peso debe ser un número válido");
                        req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
                        return;
                    }
                }
                
                if (dimensiones != null && !dimensiones.trim().isEmpty()) {
                    articulo.setDimensiones(dimensiones);
                }
                
                // El ID se genera automáticamente en la base de datos
                // No necesitamos establecerlo manualmente
                
                // Fecha de ingreso (opcional)
                String fechaIngreso = req.getParameter("fechaIngreso");
                if (fechaIngreso != null && !fechaIngreso.trim().isEmpty()) {
                    try {
                        // Parsear fecha del formato YYYY-MM-DD
                        String[] partes = fechaIngreso.split("-");
                        if (partes.length == 3) {
                            DtFecha fecha = new DtFecha();
                            fecha.setAnio(Integer.parseInt(partes[0]));
                            fecha.setMes(Integer.parseInt(partes[1]));
                            fecha.setDia(Integer.parseInt(partes[2]));
                            articulo.setFechaIngreso(fecha);
                            System.out.println("Fecha de ingreso establecida: " + fechaIngreso + " -> " + fecha.getDia() + "/" + fecha.getMes() + "/" + fecha.getAnio());
                        }
                    } catch (Exception e) {
                        System.out.println("Error parseando fecha: " + e.getMessage());
                        // Continuar sin fecha si hay error
                    }
                }
                
                System.out.println("Llamando a port.agregarArticulo()...");
                port.agregarArticulo(articulo);
                System.out.println("Artículo agregado exitosamente");
            } else {
                req.setAttribute("error", "Tipo de material no válido");
                req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
                return;
            }
            
            // Éxito - mostrar mensaje de éxito y redirigir al formulario
            req.setAttribute("mensaje", "Material agregado exitosamente");
            req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
            
        } catch (Exception e) {
            req.setAttribute("error", "Error al agregar material: " + e.getMessage());
            req.getRequestDispatcher("/agregarMaterial.jsp").forward(req, resp);
        }
    }
}


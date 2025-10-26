package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;

public class ConsultarMaterialesPorPrestamosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String umbralStr = req.getParameter("umbral");
            int umbral = 3; // valor por defecto
            if (umbralStr != null && !umbralStr.trim().isEmpty()) {
                try {
                    umbral = Integer.parseInt(umbralStr);
                    if (umbral < 0) umbral = 0;
                } catch (NumberFormatException e) {
                    // dejar el valor por defecto si no es válido
                }
            }

            ControladorPublishService service = null;
            ControladorPublish port = null;
            try {
                service = new ControladorPublishService();
                port = service.getControladorPublishPort();
            } catch (Exception e) {
                req.setAttribute("error", "No se pudo conectar con el servicio: " + e.getMessage());
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }

            // El stub del webservice del cliente puede no contener listarMaterialesConMuchosPrestamos
            // por eso usamos obtenerMaterialesConPrestamosPendientes() y filtramos en el cliente.
            String[] materiales = new String[0];
            try {
                java.util.List<String> lista = port.obtenerMaterialesConPrestamosPendientes();
                if (lista != null) {
                    java.util.List<String> filtrados = new java.util.ArrayList<>();
                    for (String linea : lista) {
                        if (linea == null) continue;
                        // Buscamos el número al final: "Préstamos Pendientes: N"
                        int contador = -1;
                        try {
                            int idx = linea.lastIndexOf("Préstamos Pendientes:");
                            if (idx >= 0) {
                                String after = linea.substring(idx + "Préstamos Pendientes:".length()).trim();
                                // tomar hasta primer espacio o fin
                                String numStr = after.split("\\s+")[0].replaceAll("[^0-9]", "");
                                if (!numStr.isEmpty()) contador = Integer.parseInt(numStr);
                            }
                        } catch (Exception ex) {
                            // ignore parse error, contador queda -1
                        }
                        if (contador >= 0 && contador >= umbral) {
                            filtrados.add(linea);
                        }
                    }
                    materiales = filtrados.toArray(new String[0]);
                }
            } catch (Exception e) {
                System.err.println("Error al llamar obtenerMaterialesConPrestamosPendientes: " + e.getMessage());
                e.printStackTrace();
                req.setAttribute("error", "Error al obtener materiales: " + e.getMessage());
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }

            req.setAttribute("materialesCriticos", materiales == null ? new String[0] : materiales);
            req.setAttribute("umbral", umbral);
            req.getRequestDispatcher("/materialesCriticos.jsp").forward(req, resp);

        } catch (Exception e) {
            System.err.println("Error en ConsultarMaterialesPorPrestamosServlet: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Error inesperado: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}

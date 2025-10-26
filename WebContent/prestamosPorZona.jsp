<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Préstamos por Zona</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesPrestamosPorZona.css">
</head>
<body>
    <div class="report-container">
        <h1>📍 Reporte de Préstamos por Zona</h1>

        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="agregarPrestamo">Agregar Préstamo</a>
            <a href="listarPrestamos">Ver Todos los Préstamos</a>
            <a href="historialPrestamosBibliotecario">Mi Historial</a>
            <a href="prestamosPorZona">Préstamos por Zona</a>
            <a href="logout">Cerrar Sesión</a>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } else { %>
            
            <!-- Selector de zona -->
            <div class="zone-selector">
                <h2>🔍 Seleccionar Zona</h2>
                <form method="GET" action="prestamosPorZona" class="zone-form">
                    <label for="zona">Zona:</label>
                    <select name="zona" id="zona" required>
                        <option value="">-- Seleccione una zona --</option>
                        <% 
                        String[] zonas = (String[]) request.getAttribute("zonas");
                        String zonaSeleccionada = (String) request.getAttribute("zonaSeleccionada");
                        if (zonas != null) {
                            for (String zona : zonas) {
                                String selected = zona.equals(zonaSeleccionada) ? "selected" : "";
                        %>
                        <option value="<%= zona %>" <%= selected %>><%= zona %></option>
                        <% 
                            }
                        }
                        %>
                    </select>
                    <button type="submit" class="btn-search">Buscar</button>
                </form>
            </div>
            
            <% if (zonaSeleccionada != null && !zonaSeleccionada.isEmpty()) { %>
                <!-- Estadísticas de la zona seccionada -->
                <div class="stats-section">
                    <h2>📊 Estadísticas - Zona: <%= zonaSeleccionada %></h2>
                    <div class="stats">
                        <div class="stat-card">
                            <div class="stat-number"><%= request.getAttribute("totalPrestamos") %></div>
                            <div class="stat-label">Total de Préstamos</div>
                        </div>
                    </div>
                </div>
                
                <!-- Lista de obtenerPrestamosDeZona -->
                <div class="loans-section">
                    <h2>📚 Préstamos en <%= zonaSeleccionada %></h2>
                    <ul class="loans-list">
                        <% 
                        String[] prestamos = (String[]) request.getAttribute("prestamos");
                        if (prestamos != null && prestamos.length > 0) {
                            for (String prestamo : prestamos) {
                                // Parsear información del préstamo
                                String[] partes = prestamo.split(" \\| ");
                                String material = "", lector = "", bibliotecario = "", estado = "", fechaSolicitud = "", fechaDevolucion = "";
                                
                                for (String parte : partes) {
                                    if (parte.startsWith("Material ")) {
                                        material = parte.replace("Material ", "").trim();
                                    } else if (parte.startsWith("Lector ")) {
                                        lector = parte.replace("Lector ", "").trim();
                                    } else if (parte.startsWith("Bibliotecario ")) {
                                        bibliotecario = parte.replace("Bibliotecario ", "").trim();
                                    } else if (parte.startsWith("Estado ")) {
                                        estado = parte.replace("Estado ", "").trim();
                                    } else if (parte.startsWith("Solicitud ")) {
                                        fechaSolicitud = parte.replace("Solicitud ", "").trim();
                                    } else if (parte.startsWith("Devolución ")) {
                                        fechaDevolucion = parte.replace("Devolución ", "").trim();
                                    }
                                }
                                
                                String statusClass = "status-pendiente";
                                if (estado.toLowerCase().contains("activo")) {
                                    statusClass = "status-activo";
                                } else if (estado.toLowerCase().contains("devuelto")) {
                                    statusClass = "status-devuelto";
                                }
                        %>
                            <li class="loan-item">
                                <div class="loan-header">
                                    <div class="loan-id">Material #<%= material %></div>
                                    <div class="loan-status <%= statusClass %>"><%= estado %></div>
                                </div>
                                
                                <div class="loan-details">
                                    <div class="detail-item">
                                        <div class="detail-label">👤 Lector</div>
                                        <div class="detail-value"><%= lector %></div>
                                    </div>
                                    
                                    <div class="detail-item">
                                        <div class="detail-label">📚 Material</div>
                                        <div class="detail-value"><%= material %></div>
                                    </div>
                                    
                                    <div class="detail-item">
                                        <div class="detail-label">👨‍💼 Bibliotecario</div>
                                        <div class="detail-value"><%= bibliotecario %></div>
                                    </div>
                                    
                                    <% if (!fechaSolicitud.isEmpty()) { %>
                                    <div class="detail-item">
                                        <div class="detail-label">📅 Fecha Solicitud</div>
                                        <div class="detail-value"><%= fechaSolicitud %></div>
                                    </div>
                                    <% } %>
                                    
                                    <% if (!fechaDevolucion.isEmpty()) { %>
                                    <div class="detail-item">
                                        <div class="detail-label">📅 Fecha Devolución</div>
                                        <div class="detail-value"><%= fechaDevolucion %></div>
                                    </div>
                                    <% } %>
                                </div>
                            </li>
                        <% 
                            }
                        } else {
                        %>
                            <li class="no-loans">
                                <h3>📭 No hay préstamos registrados</h3>
                                <p>No se encontraron préstamos en la zona seleccionada.</p>
                            </li>
                        <% } %>
                    </ul>
                </div>
            <% } else { %>
                <div class="help-text">
                    <p>👆 Seleccione una zona del menú desplegable y haga clic en "Buscar" para ver los préstamos de esa zona.</p>
                </div>
            <% } %>
        <% } %>
    </div>
</body>
</html>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    String emailLector = (String) request.getAttribute("emailLector");
    Map<String, List<String>> prestamosPorEstado = (Map<String, List<String>>) request.getAttribute("prestamosPorEstado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Préstamos - Biblioteca Web</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesMisPrestamos.css">
</head>
<body>
    <div class="container">
        <div class="user-info">
            <h1>📋 Mis Préstamos</h1>
            <p>Gestión de tus préstamos personales</p>
        </div>

        <div class="navigation">
            <a href="consultarMateriales">📚 Ver Materiales</a>
            <a href="misPrestamos">📋 Mis Préstamos</a>
            <a id="logout" href="logout">🚪 Cerrar Sesión</a>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <!-- Estadísticas -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("PENDIENTE").size() %></div>
                <div class="stat-label">Pendientes</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("EN_CURSO").size() %></div>
                <div class="stat-label">En Curso</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("DEVUELTO").size() %></div>
                <div class="stat-label">Devueltos</div>
            </div>
        </div>
        
        <!-- Préstamos Pendientes -->
        <div class="estado-section">
            <div class="estado-header estado-pendiente">
                <span>⏳ Préstamos Pendientes</span>
                <span class="estado-count"><%= prestamosPorEstado.get("PENDIENTE").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("PENDIENTE").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos pendientes</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("PENDIENTE")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: Pendiente de aprobación</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
        
        <!-- Préstamos En Curso -->
        <div class="estado-section">
            <div class="estado-header estado-en-curso">
                <span>📖 Préstamos En Curso</span>
                <span class="estado-count"><%= prestamosPorEstado.get("EN_CURSO").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("EN_CURSO").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos en curso</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("EN_CURSO")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: En curso - Material prestado</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
        
        <!-- Préstamos Devueltos -->
        <div class="estado-section">
            <div class="estado-header estado-devuelto">
                <span>✅ Préstamos Devueltos</span>
                <span class="estado-count"><%= prestamosPorEstado.get("DEVUELTO").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("DEVUELTO").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos devueltos</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("DEVUELTO")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: Devuelto - Préstamo completado</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>

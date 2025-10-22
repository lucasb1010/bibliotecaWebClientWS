<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios de la Biblioteca</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesUsuarios.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>👥 Usuarios de la Biblioteca</h1>
            <nav class="nav">
                <a href="consultarMateriales" class="nav-link">📚 Ver Materiales</a>
                <a href="agregarMaterial" class="nav-link">➕ Agregar Material</a>
                <a href="listarPrestamos" class="nav-link">📋 Ver Préstamos</a>
                <a href="logout" class="nav-link" style="color: #f44336;">🚪 Cerrar Sesión</a>
            </nav>
        </header>
        
        <!-- Información de acceso -->
        <div style="background: #e8f5e8; padding: 15px; border-radius: 8px; margin-bottom: 20px; text-align: center;">
            <p style="margin: 0; color: #2e7d32; font-weight: bold;">
                👨‍💼 <strong>Acceso de Bibliotecario</strong> - Gestión de usuarios
            </p>
        </div>

        <main class="main-content">
            <div class="stats-container">
                <div class="stat-card">
                    <h3 id="total-lectores">0</h3>
                    <p>Lectores</p>
                </div>
                <div class="stat-card">
                    <h3 id="total-bibliotecarios">0</h3>
                    <p>Bibliotecarios</p>
                </div>
                <div class="stat-card">
                    <h3 id="total-usuarios">0</h3>
                    <p>Total Usuarios</p>
                </div>
            </div>

            <div class="users-container">
                <section class="users-section">
                    <h2>📖 Lectores</h2>
                    <div class="search-container">
                        <input type="text" id="search-lectores" placeholder="Buscar lectores..." class="search-input">
                        <button onclick="clearSearch('lectores')" class="clear-btn">Limpiar</button>
                    </div>
                    <div class="users-list" id="lectores-list">
                        <%
                            String[] lectores = (String[]) request.getAttribute("lectores");
                            String[] lectoresSuspendidos = (String[]) request.getAttribute("lectoresSuspendidos");
                            
                            // Crear un Set para verificar rápidamente si un lector está suspendido
                            Set<String> suspendidos = new HashSet<>();
                            if (lectoresSuspendidos != null) {
                                for (String lectorSuspendido : lectoresSuspendidos) {
                                    suspendidos.add(lectorSuspendido);
                                }
                            }
                            
                            if (lectores != null && lectores.length > 0) {
                                for (String lector : lectores) {
                                    boolean estaSuspendido = suspendidos.contains(lector);
                                    String estadoClase = estaSuspendido ? "inactive" : "active";
                                    String estadoTexto = estaSuspendido ? "Inactivo" : "Activo";
                                    String botonTexto = estaSuspendido ? "Activar" : "Suspender";
                                    String botonClase = estaSuspendido ? "btn-success" : "btn-warning";
                                    String cardStyle = estaSuspendido ? "style=\"opacity: 0.6;\"" : "";
                        %>
                            <div class="user-card" data-name="<%= lector.toLowerCase() %>" <%= cardStyle %>>
                                <div class="user-info">
                                    <h4><%= lector %></h4>
                                    <span class="user-type">Lector</span>
                                    <span class="user-status <%= estadoClase %>"><%= estadoTexto %></span>
                                </div>
                                <div class="user-actions">
                                    <button class="btn btn-info" onclick="verDetalles('<%= lector %>', 'lector')">Ver Detalles</button>
                                    <button class="btn btn-primary" onclick="cambiarZonaLector('<%= lector %>')">Cambiar Zona</button>
                                    <button class="btn <%= botonClase %> btn-toggle" onclick="toggleUsuario('<%= lector %>')"><%= botonTexto %></button>
                                </div>
                            </div>
                        <% 
                                }
                            } else {
                        %>
                            <div class="no-data">
                                <p>No hay lectores registrados</p>
                            </div>
                        <% } %>
                    </div>
                </section>

                <section class="users-section">
                    <h2>👨‍💼 Bibliotecarios</h2>
                    <div class="search-container">
                        <input type="text" id="search-bibliotecarios" placeholder="Buscar bibliotecarios..." class="search-input">
                        <button onclick="clearSearch('bibliotecarios')" class="clear-btn">Limpiar</button>
                    </div>
                    <div class="users-list" id="bibliotecarios-list">
                        <%
                            String[] bibliotecarios = (String[]) request.getAttribute("bibliotecarios");
                            if (bibliotecarios != null && bibliotecarios.length > 0) {
                                for (String bibliotecario : bibliotecarios) { 
                        %>
                            <div class="user-card" data-name="<%= bibliotecario.toLowerCase() %>">
                                <div class="user-info">
                                    <h4><%= bibliotecario %></h4>
                                    <span class="user-type bibliotecario">Bibliotecario</span>
                                </div>
                                <div class="user-actions">
                                    <button class="btn btn-info" onclick="verDetalles('<%= bibliotecario %>', 'bibliotecario')">Ver Detalles</button>
                                </div>
                            </div>
                        <% 
                                }
                            } else {
                        %>
                            <div class="no-data">
                                <p>No hay bibliotecarios registrados</p>
                            </div>
                        <% } %>
                    </div>
                </section>
            </div>
        </main>
    </div>

    <script src="JS/scriptsUsuarios.js"></script>
    <!-- Modal para cambiar zona -->
    <div id="modalCambiarZona" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarModalZona()">&times;</span>
            <h2>Cambiar Zona</h2>
            <p id="modalUsuarioNombre"></p>
            <div id="zonasContainer" class="zonas-container"></div>
            <div class="modal-actions">
                <button class="btn btn-secondary" onclick="cerrarModalZona()">Cancelar</button>
            </div>
        </div>
    </div>

    <!-- Contenedor de notificaciones toast -->
    <div id="toast-container"></div>

    <script>
        var APP_CTX = '<%= request.getContextPath() %>';
    </script>
    <script src="JS/scripts.js"></script>
    <script src="JS/usuarios.js"></script>
</body>
</html>
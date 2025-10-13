<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios de la Biblioteca</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/usuarios.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>👥 Usuarios de la Biblioteca</h1>
            <nav class="nav">
                <a href="index.jsp" class="nav-link">🏠 Inicio</a>
                <a href="consultar-materiales" class="nav-link">📚 Materiales</a>
            </nav>
        </header>

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
                            if (lectores != null && lectores.length > 0) {
                                for (String lector : lectores) { 
                        %>
                            <div class="user-card" data-name="<%= lector.toLowerCase() %>">
                                <div class="user-info">
                                    <h4><%= lector %></h4>
                                    <span class="user-type">Lector</span>
                                </div>
                                <div class="user-actions">
                                    <button class="btn btn-info" onclick="verDetalles('<%= lector %>', 'lector')">Ver Detalles</button>
                                    <button class="btn btn-warning" onclick="suspenderUsuario('<%= lector %>')">Suspender</button>
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
                                    <button class="btn btn-warning" onclick="suspenderUsuario('<%= bibliotecario %>')">Suspender</button>
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

    <script src="JS/scripts.js"></script>
    <script src="JS/usuarios.js"></script>
</body>
</html>
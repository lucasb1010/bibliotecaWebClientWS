<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  // Declarar variables una sola vez al inicio
  String nombreUsuario = (String) session.getAttribute("nombreUsuario");
  String tipoUsuario = (String) session.getAttribute("tipoUsuario");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="nombreUsuario" content="<%= nombreUsuario != null ? nombreUsuario : "" %>">
    <meta name="tipoUsuario" content="<%= session.getAttribute("tipoUsuario") != null ? session.getAttribute("tipoUsuario") : "" %>">
    <link rel="icon" type="image/ico" href="IMG/"/> <!-- Para agreagar icono -->
    <title>Biblioteca Web</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesLogin.css">
</head>
<body>
    <nav class="nav">
        <div class="nav__logo__container">
            <!-- category: Document tags: [read, dictionary, magazine, library, booklet, novel] version: "1.50" unicode: "efc5" -->
            <svg class="nav__logo__container__svg" xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="0.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M19 4v16h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12z" />
                <path d="M19 16h-12a2 2 0 0 0 -2 2" />
                <path d="M9 8h6" />
            </svg>

            <h1 class="nav__logo__container__h1">
                Biblioteca WEB
            </h1>
        </div>
        <div class="nav__acces__container" id="abrirLogin">
            <svg class="nav__acces__container__svg" xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="0.7" stroke-linecap="round" stroke-linejoin="round">
                <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" />
                <path d="M12 10m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                <path d="M6.168 18.849a4 4 0 0 1 3.832 -2.849h4a4 4 0 0 1 3.834 2.855" />
            </svg>

            <p class="nav__acces__container__p" style="<% 
                  if (nombreUsuario != null) {
                %>color: #4CAF50; font-weight: bold;<% } %>">
                <% 
                  if (nombreUsuario != null) {
                %>
                    👋 ¡Hola <%= nombreUsuario %>!
                <% } else { %>
                    Acceder
                <% } %>
            </p>
            <!-- tags: [account, avatar, profile, role] version: "1.44" unicode: "ef68" category: System -->
        </div>
    </nav>

    <main class="main">
        <% 
          if (nombreUsuario != null) {
        %>
            <h2 class="main__h2"> <span>📗 ¡Bienvenido de vuelta, </span> <span class="sup"><%= nombreUsuario %>!</span></h2>
            <p class="main__p">Explora nuestra colección de libros y recursos digitales.</p>
            
            <div style="text-align: center; margin-top: 30px;">
                <a href="consultarMateriales" style="background: #4CAF50; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">📚 Ver Materiales</a>
                <% if (tipoUsuario != null && tipoUsuario.equals("DtBibliotecario")) { %>
                    <a href="consultar-usuarios" style="background: #9C27B0; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">👥 Gestionar Usuarios</a>
                    <a href="listarPrestamos" style="background: #2196F3; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">📋 Ver Préstamos</a>
                    <a href="historialPrestamosBibliotecario" style="background: #E91E63; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">📚 Mi Historial</a>
                    <a href="consultarHistorialLector" style="background: #9C27B0; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">🔍 Consultar Historial de Lector</a>
                    <a href="agregarMaterial" style="background: #FF9800; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">➕ Agregar Material</a>
                <% } else { %>
                    <a href="misPrestamos" style="background: #2196F3; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">📋 Mis Préstamos</a>
                <% } %>
                <a href="logout" style="background: #f44336; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 0 10px; display: inline-block;">🚪 Cerrar Sesión</a>
            </div>
            
            <div style="text-align: center; margin-top: 20px; padding: 15px; background: #f8f9fa; border-radius: 8px;">
                <p style="margin: 0; color: #666;">
                    <% if (tipoUsuario != null && tipoUsuario.equals("DtBibliotecario")) { %>
                        👨‍💼 <strong>Bibliotecario</strong> - Acceso completo al sistema
                    <% } else { %>
                        📖 <strong>Lector</strong> - Acceso a materiales y préstamos
                    <% } %>
                </p>
            </div>
        <% } else { %>
            <h2 class="main__h2"> <span>📗 Bienvenido </span> <span class="sup"> a </span> <span class="sub"> la </span> <span class="uppercase"> Biblioteca <span class="sup">W</span><span>e</span><span class="sub">b</span></span></h2>
            <p class="main__p">Para explorar nuestra colección de libros y recursos digitales inicia sesión.</p>
        <% } %>
    </main>

    <!-- Popup -->
    <div class="overlay" id="overlay">
        <div class="overlay__popup">
            <button class="overlay__popup__close-btn" id="cerrar">&times;</button>
            <h2 id="popup-title">Inicio de sesión</h2>
            <form id="login-form">
                <input type="email" id="login-email" placeholder="Correo" required><br>
                <input type="password" id="login-password" placeholder="Contraseña" required><br>
                <button type="submit">Ingresar</button>
            </form>
            <p id="popup-message" style="color:red;"></p>
        </div>
    </div>

</body>

<script src="JS/scriptsLogin.js"></script>
</html>
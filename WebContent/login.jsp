<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/ico" href="IMG/"/> <!-- Para agreagar icono -->
    <title>Biblioteca Web</title>
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

            <p class="nav__acces__container__p">
                Acceder
            </p>
            <!-- tags: [account, avatar, profile, role] version: "1.44" unicode: "ef68" category: System -->
        </div>
    </nav>

    <main class="main">
        <h2 class="main__h2"> <span>📗 Bienvenido </span> <span class="sup"> a </span> <span class="sub"> la </span> <span class="uppercase"> Biblioteca <span class="sup">W</span><span>e</span><span class="sub">b</span></span></h2>
        <p class="main__p">Para explorar nuestra colección de libros y recursos digitales inicia sesión.</p>
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
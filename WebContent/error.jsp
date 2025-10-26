<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");
    if (error == null) {
        error = "Ha ocurrido un error inesperado.";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Biblioteca Web</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesError.css">
</head>
<body>
    <div class="error-container">
        <div class="error-icon">🚫</div>
        <h1 class="error-title uppercase">Acceso Denegado</h1>
        <p class="error-message"><%= error %></p>
        
        <div class="error-actions">
            <a href="login.jsp" class="btn btn-primary">🏠 Ir al Inicio</a>
            <a href="consultarMateriales" class="btn btn-secondary">📚 Ver Materiales</a>
            <a href="logout" class="btn btn-danger">🚪 Cerrar Sesión</a>
        </div>
    </div>
</body>
</html>
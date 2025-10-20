<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Biblioteca</title>
    <link rel="stylesheet" href="CSS/stylesError.css">
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        <h1 class="error-title">Error</h1>
        
        <div class="error-message">
            <% if (request.getAttribute("error") != null) { %>
                <%= request.getAttribute("error") %>
            <% } else { %>
                Ha ocurrido un error inesperado. Por favor, inténtelo nuevamente.
            <% } %>
        </div>
        
        <div>
            <a href="agregarMaterial" class="btn btn-primary">Intentar Nuevamente</a>
            <a href="consultarMateriales" class="btn btn-secondary">Ver Materiales</a>
        </div>
    </div>
</body>
</html>


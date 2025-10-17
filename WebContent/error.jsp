<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Biblioteca</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        .error-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .error-icon {
            font-size: 64px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
        
        .error-title {
            color: #e74c3c;
            font-size: 24px;
            margin-bottom: 15px;
        }
        
        .error-message {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            border-left: 4px solid #e74c3c;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #45a049;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
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


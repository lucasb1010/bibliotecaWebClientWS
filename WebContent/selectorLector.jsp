<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Consultar Historial de Lector</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <style>
    .container { max-width: 600px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
    .navigation { text-align: center; margin-bottom: 20px; }
    .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
    h1 { text-align: center; color: #333; margin-bottom: 30px; }
    
    .form-group { margin-bottom: 20px; }
    .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
    .form-group select { 
      width: 100%; 
      padding: 10px; 
      border: 1px solid #ddd; 
      border-radius: 4px; 
      font-size: 14px;
    }
    
    .btn { 
      padding: 12px 24px; 
      border: none; 
      border-radius: 4px; 
      cursor: pointer; 
      font-size: 14px; 
      font-weight: 500; 
      transition: all 0.3s ease;
      text-decoration: none;
      display: inline-block;
      text-align: center;
    }
    .btn-primary { 
      background: #007bff; 
      color: white; 
    }
    .btn-primary:hover { 
      background: #0056b3; 
    }
    .btn-secondary { 
      background: #6c757d; 
      color: white; 
    }
    .btn-secondary:hover { 
      background: #545b62; 
    }
    
    .button-group { 
      text-align: center; 
      margin-top: 30px; 
    }
    .button-group .btn { 
      margin: 0 10px; 
    }
    
    .info-box {
      background: #e8f4fd;
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      border-left: 4px solid #007bff;
    }
    
    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .navigation { display: flex; flex-direction: column; gap: 8px; }
      .button-group .btn { 
        display: block; 
        margin: 10px auto; 
        width: 200px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="navigation">
      <a href="consultarMateriales">Ver Materiales</a>
      <a href="agregarMaterial">Agregar Material</a>
      <a href="agregarPrestamo">Agregar Préstamo</a>
      <a href="listarPrestamos">Ver Préstamos</a>
      <a href="historialLector">Consultar Historial</a>
      <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <h1>Consultar Historial de Lector</h1>
    
    <div class="info-box">
      <strong>👨‍💼 Función de Bibliotecario</strong><br>
      Selecciona un lector para consultar su historial completo de préstamos.
    </div>
    
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <form method="get" action="consultarHistorialLector">
      <div class="form-group">
        <label for="lectorCorreo">Seleccionar Lector:</label>
        <select id="lectorCorreo" name="lectorCorreo" required>
          <option value="">-- Selecciona un lector --</option>
          <%
            java.util.List<String> lectores = (java.util.List<String>) request.getAttribute("lectores");
            if (lectores != null) {
              for (String lector : lectores) {
          %>
            <option value="<%= lector %>"><%= lector %></option>
          <%
              }
            }
          %>
        </select>
      </div>
      
      <div class="button-group">
        <button type="submit" class="btn btn-primary">Consultar Historial</button>
        <a href="listarPrestamos" class="btn btn-secondary">Cancelar</a>
      </div>
    </form>
  </div>
</body>
</html>

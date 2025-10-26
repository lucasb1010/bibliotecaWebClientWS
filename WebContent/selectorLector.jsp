<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Consultar Historial de Lector</title>
  <link rel="stylesheet" href="CSS/styles.css"/>
  <link rel="stylesheet" href="CSS/stylesSelectorLector.css"/>
</head>
<body>
  <div class="container">

    <h1>Consultar Historial de Lector</h1>

    <div class="navigation">
      <a href="consultarMateriales">Ver Materiales</a>
      <a href="agregarMaterial">Agregar Material</a>
      <a href="agregarPrestamo">Agregar Préstamo</a>
      <a href="listarPrestamos">Ver Préstamos</a>
      <a href="historialLector">Consultar Historial</a>
      <a href="prestamosPorZona">📊 Préstamos por Zona</a>
      <a id="logout" href="logout">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
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
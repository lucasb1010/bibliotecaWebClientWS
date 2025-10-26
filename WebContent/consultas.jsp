<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  // Declarar variables al inicio para evitar conflictos con includes
  String tipoUsuario = (String) session.getAttribute("tipoUsuario");
%>
<!DOCTYPE html>
<html lang="es">
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiales</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesConsultas.css">
  </head>
  <body>
    <div class="materials-container">
      <h1>Materiales de la Biblioteca</h1>
      <div class="navigation">
        <a href="consultarMateriales">Ver Materiales</a>
        <% 
          if (tipoUsuario != null && tipoUsuario.equals("DtBibliotecario")) {
        %>
            <a href="consultar-usuarios">Ver Usuarios</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="listarPrestamos">Ver Préstamos</a>
            <a href="consultarMaterialesPorPrestamos">Materiales Críticos</a>
        <% } else { %>
            <a href="misPrestamos">Mis Préstamos</a>
        <% } %>
        <a id="logout" href="logout">Cerrar Sesión</a>
      </div>
      
      <%@ include file="includes/userGreeting.jsp" %>
      
      <!-- Filtro de fechas -->
      <div class="filter-container">
        <h3>🔍 Filtrar por Fecha de Ingreso</h3>
        <div class="filter-info">
          <p><strong>Nota:</strong> El filtro de fechas requiere que el backend tenga configurada correctamente la entidad Material con la propiedad fechaIngreso.</p>
        </div>
        <form method="get" action="consultarMateriales" class="date-filter-form">
          <div class="filter-row">
            <div class="filter-group">
              <label for="fechaDesde">Fecha Desde:</label>
              <input type="date" id="fechaDesde" name="fechaDesde" value="<%= request.getParameter("fechaDesde") != null ? request.getParameter("fechaDesde") : "" %>">
            </div>
            <div class="filter-group">
              <label for="fechaHasta">Fecha Hasta:</label>
              <input type="date" id="fechaHasta" name="fechaHasta" value="<%= request.getParameter("fechaHasta") != null ? request.getParameter("fechaHasta") : "" %>">
            </div>
            <div class="filter-actions">
              <button type="submit" class="btn-filter">🔍 Filtrar</button>
              <a href="consultarMateriales" class="btn-clear">🗑️ Limpiar</a>
            </div>
          </div>
        </form>
      </div>
      
      <a href="agregarMaterial" class="add-button">➕ Agregar Nuevo Material</a>
      
      <% if (request.getAttribute("mensaje") != null) { %>
        <div class="div">
          <%= request.getAttribute("mensaje") %>
        </div>
      <% } %>
      
    <ul>
      <%
        String[] materiales = (String[]) request.getAttribute("materiales");
        if (materiales != null && materiales.length > 0) {
          for (String m : materiales) { out.println("<li>" + m + "</li>"); }
        } else {
          out.println("<li style='color: #666; font-style: italic; font-weight: bold; font-size: 12px;'>No hay materiales registrados en la biblioteca</li>");
        }
      %>
    </ul>
    </div>

  <script src="JS/scriptsConsultas.js"></script>
  </body>
</html>
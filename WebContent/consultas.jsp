<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Materiales</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesConsultas.css">
  </head>
  <body>
    <div class="materials-container">
      <div class="navigation">
        <a href="consultarMateriales">Ver Materiales</a>
        <a href="consultar-usuarios">Ver Usuarios</a>
        <a href="agregarMaterial">Agregar Material</a>
      </div>
      
      <h2>Materiales de la Biblioteca</h2>
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
          out.println("<li style='color: #666; font-style: italic;'>No hay materiales registrados en la biblioteca</li>");
        }
      %>
    </ul>
    </div>
  </body>
</html>

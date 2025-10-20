<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Préstamos</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <style>
    .container { max-width: 900px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
    .navigation { text-align: center; margin-bottom: 20px; }
    .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
    h1 { text-align: center; }
    ul { list-style: none; padding-left: 0; }
    li { background: #f8f9fa; margin-bottom: 10px; padding: 12px 14px; border-radius: 6px; }
    .empty { color: #666; font-style: italic; text-align: center; }

    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .navigation { display: flex; flex-direction: column; gap: 8px; }
      li { font-size: 14px; }
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
    </div>
    <h1>Préstamos</h1>

    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <ul>
      <%
        java.util.List<String> prestamos = (java.util.List<String>) request.getAttribute("prestamos");
        if (prestamos != null && !prestamos.isEmpty()) {
          for (String p : prestamos) {
      %>
            <li><%= p %></li>
      <%
          }
        } else {
      %>
          <li class="empty">No hay préstamos registrados.</li>
      <%
        }
      %>
    </ul>
  </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Préstamos</title>
  <link rel="stylesheet" href="CSS/styles.css"/>
  <link rel="stylesheet" href="CSS/stylesPrestamos.css"/>

</head>
<body>
  <div class="container">
        <div class="navigation">
          <a href="consultarMateriales">Ver Materiales</a>
          <a href="agregarMaterial">Agregar Material</a>
          <a href="agregarPrestamo">Agregar Préstamo</a>
          <a href="listarPrestamos">Ver Préstamos</a>
          <a id="logout" href="logout">Cerrar Sesión</a>
        </div>
        
        <%@ include file="includes/userGreeting.jsp" %>
        
    <h1>Préstamos</h1>

    <% if (request.getAttribute("error") != null) { %>
      <div class="alert error"><%= request.getAttribute("error") %></div>
    <% } %>

    <ul>
      <%
        java.util.List<String> prestamos = (java.util.List<String>) request.getAttribute("prestamos");
        if (prestamos != null && !prestamos.isEmpty()) {
          for (String p : prestamos) {
            // Extraer información del préstamo para los botones
            // Formato: "Préstamo - Lector: correo, Bibliotecario: correo, Material: id, Estado: ESTADO"
            String lectorCorreo = p.substring(p.indexOf("Lector: ") + 8, p.indexOf(", Bibliotecario:"));
            String bibliotecarioCorreo = p.substring(p.indexOf("Bibliotecario: ") + 15, p.indexOf(", Material:"));
            String materialId = p.substring(p.indexOf("Material: ") + 10, p.indexOf(", Estado:"));
            String estadoActual = p.substring(p.indexOf("Estado: ") + 8);
      %>
            <li class="prestamo-item">
              <div class="prestamo-info">
                <strong><%= p %></strong>
              </div>
              <div class="prestamo-actions">
                <% if (!estadoActual.equals("PENDIENTE")) { %>
                  <form method="post" action="listarPrestamos" style="display: inline;">
                    <input type="hidden" name="lectorCorreo" value="<%= lectorCorreo %>">
                    <input type="hidden" name="bibliotecarioCorreo" value="<%= bibliotecarioCorreo %>">
                    <input type="hidden" name="materialId" value="<%= materialId %>">
                    <input type="hidden" name="nuevoEstado" value="PENDIENTE">
                    <button type="submit" class="btn btn-info">Marcar como Pendiente</button>
                  </form>
                <% } %>
                <% if (!estadoActual.equals("EN_CURSO")) { %>
                  <form method="post" action="listarPrestamos" style="display: inline;">
                    <input type="hidden" name="lectorCorreo" value="<%= lectorCorreo %>">
                    <input type="hidden" name="bibliotecarioCorreo" value="<%= bibliotecarioCorreo %>">
                    <input type="hidden" name="materialId" value="<%= materialId %>">
                    <input type="hidden" name="nuevoEstado" value="EN_CURSO">
                    <button type="submit" class="btn btn-success">Marcar como En Curso</button>
                  </form>
                <% } %>
                <% if (!estadoActual.equals("DEVUELTO")) { %>
                  <form method="post" action="listarPrestamos" style="display: inline;">
                    <input type="hidden" name="lectorCorreo" value="<%= lectorCorreo %>">
                    <input type="hidden" name="bibliotecarioCorreo" value="<%= bibliotecarioCorreo %>">
                    <input type="hidden" name="materialId" value="<%= materialId %>">
                    <input type="hidden" name="nuevoEstado" value="DEVUELTO">
                    <button type="submit" class="btn btn-warning">Marcar como Devuelto</button>
                  </form>
                <% } %>
              </div>
            </li>
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
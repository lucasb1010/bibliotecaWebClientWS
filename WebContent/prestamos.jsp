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
    
    /* Estilos para préstamos con botones */
    .prestamo-item { 
      display: flex; 
      justify-content: space-between; 
      align-items: center; 
      background: #f8f9fa; 
      margin-bottom: 10px; 
      padding: 15px; 
      border-radius: 8px; 
      border-left: 4px solid #4CAF50;
    }
    .prestamo-info { flex: 1; }
    .prestamo-actions { display: flex; gap: 8px; }
    .btn { 
      padding: 8px 16px; 
      border: none; 
      border-radius: 4px; 
      cursor: pointer; 
      font-size: 12px; 
      font-weight: 500; 
      transition: all 0.3s ease;
    }
    .btn-success { 
      background: #28a745; 
      color: white; 
    }
    .btn-success:hover { 
      background: #218838; 
    }
    .btn-warning { 
      background: #ffc107; 
      color: #212529; 
    }
    .btn-warning:hover { 
      background: #e0a800; 
    }
    .btn-info { 
      background: #17a2b8; 
      color: white; 
    }
    .btn-info:hover { 
      background: #138496; 
    }

    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .navigation { display: flex; flex-direction: column; gap: 8px; }
      .prestamo-item { 
        flex-direction: column; 
        gap: 10px; 
        text-align: center; 
      }
      .prestamo-actions { 
        justify-content: center; 
        flex-wrap: wrap; 
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

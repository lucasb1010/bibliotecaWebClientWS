<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Mi Historial de Préstamos</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <link rel="stylesheet" href="CSS/stylesHistorialLector.css" />
</head>
<body>
  <div class="container">

    <h1>Historial de Préstamos del Lector</h1>

    <div class="navigation">
      <a href="consultarMateriales">Ver Materiales</a>
      <a href="agregarPrestamo">Solicitar Préstamo</a>
      <a href="historialLector">Mi Historial</a>
      <a id="logout" href="logout">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <div class="lector-info">
      <strong>👨‍💼 Consultando historial de:</strong> <%= request.getAttribute("lectorCorreo") %>
    </div>
    
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div>
      <%
        java.util.List<String> prestamos = (java.util.List<String>) request.getAttribute("prestamos");
        if (prestamos != null && !prestamos.isEmpty()) {
          for (String p : prestamos) {
            // Extraer información del préstamo
            String lectorCorreo = "";
            String bibliotecarioCorreo = "";
            String materialId = "";
            String estado = "";
            String fechaSolicitud = "";
            String fechaDevolucion = "";
            
            try {
              // Formato: "Préstamo - Lector: correo, Bibliotecario: correo, Material: id, Estado: ESTADO"
              if (p.contains("Lector: ")) {
                lectorCorreo = p.substring(p.indexOf("Lector: ") + 8, p.indexOf(", Bibliotecario:"));
              }
              if (p.contains("Bibliotecario: ")) {
                bibliotecarioCorreo = p.substring(p.indexOf("Bibliotecario: ") + 15, p.indexOf(", Material:"));
              }
              if (p.contains("Material: ")) {
                materialId = p.substring(p.indexOf("Material: ") + 10, p.indexOf(", Estado:"));
              }
              if (p.contains("Estado: ")) {
                estado = p.substring(p.indexOf("Estado: ") + 8);
              }
              if (p.contains("Solicitud ")) {
                fechaSolicitud = p.substring(p.indexOf("Solicitud ") + 10, p.indexOf(" | Devolución"));
              }
              if (p.contains("Devolución ")) {
                fechaDevolucion = p.substring(p.indexOf("Devolución ") + 11);
              }
            } catch (Exception e) {
              // Si hay error en el parsing, usar el string completo
            }
      %>
            <div class="prestamo-item">
              <div class="prestamo-info">
                <strong>Préstamo #<%= materialId %></strong>
                <span class="estado estado-<%= estado.toLowerCase() %>"><%= estado %></span>
              </div>
              
              <div class="prestamo-details">
                <div class="detail-item">
                  <div class="detail-label">Bibliotecario</div>
                  <div class="detail-value"><%= bibliotecarioCorreo %></div>
                </div>
                
                <div class="detail-item">
                  <div class="detail-label">Material ID</div>
                  <div class="detail-value"><%= materialId %></div>
                </div>
                
                <div class="detail-item">
                  <div class="detail-label">Fecha Solicitud</div>
                  <div class="detail-value"><%= fechaSolicitud.isEmpty() ? "No disponible" : fechaSolicitud %></div>
                </div>
                
                <div class="detail-item">
                  <div class="detail-label">Fecha Devolución</div>
                  <div class="detail-value"><%= fechaDevolucion.isEmpty() ? "No disponible" : fechaDevolucion %></div>
                </div>
              </div>
            </div>
      <%
          }
        } else {
      %>
          <div class="empty">
            <h3>No tienes préstamos registrados</h3>
            <p>Cuando solicites un préstamo, aparecerá aquí tu historial.</p>
            <a href="agregarPrestamo" class="btn-volver">Solicitar Préstamo</a>
          </div>
      <%
        }
      %>
    </div>
    
    <div class="align-center">
      <a href="consultarMateriales" class="btn-volver">Volver a Materiales</a>
    </div>
  </div>
</body>
</html>
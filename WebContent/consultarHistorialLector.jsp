<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Historial de Lector - Consulta Bibliotecario</title>
  <link rel="stylesheet" href="CSS/styles.css"/>
  <link rel="stylesheet" href="CSS/stylesConsultarHistorialLector.css"/>
</head>
<body>
  <div class="container">

    <h1>🔍 Historial de Préstamos del Lector</h1>

    <div class="navigation">
      <a href="consultarMateriales">Ver Materiales</a>
      <a href="agregarMaterial">Agregar Material</a>
      <a href="agregarPrestamo">Agregar Préstamo</a>
      <a href="listarPrestamos">Ver Préstamos</a>
      <a href="consultarHistorialLector">Consultar Historial</a>
      <a href="prestamosPorZona">📊 Préstamos por Zona</a>
      <a id="logout" href="logout">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <a href="consultarHistorialLector" class="btn-back">← Volver a Seleccionar Lector</a>
    
    <div class="lector-info">
      <strong>👨‍💼 Consultando historial de:</strong> <%= request.getAttribute("lectorCorreo") %>
    </div>
    
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <ul class="prestamos-list">
      <%
        java.util.List<String> prestamos = (java.util.List<String>) request.getAttribute("prestamos");
        if (prestamos != null && !prestamos.isEmpty()) {
          for (String p : prestamos) {
            // El formato del préstamo es: "Material X | Lector correo | Bibliotecario correo | Estado ESTADO | Solicitud DD/MM/YYYY | Devolución DD/MM/YYYY"
            String[] partes = p.split(" \\| ");
            String materialId = partes[0].replace("Material ", "");
            String lectorCorreo = partes[1].replace("Lector ", "");
            String bibliotecarioCorreo = partes[2].replace("Bibliotecario ", "");
            String estadoActual = partes[3].replace("Estado ", "");
            String fechaSolicitud = partes[4].replace("Solicitud ", "");
            String fechaDevolucion = partes[5].replace("Devolución ", "");
            
            String estadoClass = "";
            if (estadoActual.equals("PENDIENTE")) {
                estadoClass = "estado-pendiente";
            } else if (estadoActual.equals("EN_CURSO")) {
                estadoClass = "estado-en-curso";
            } else if (estadoActual.equals("DEVUELTO")) {
                estadoClass = "estado-devuelto";
            }
      %>
            <li class="prestamo-item">
              <div class="prestamo-info">
                <strong>Estado: <span class="<%= estadoClass %>"><%= estadoActual %></span></strong><br>
                Bibliotecario: <%= bibliotecarioCorreo %><br>
                Material ID: <%= materialId %><br>
                Fecha Solicitud: <%= fechaSolicitud %><br>
                Fecha Devolución: <%= fechaDevolucion %>
              </div>
            </li>
      <%
          }
        } else {
      %>
          <li class="empty">El lector seleccionado no tiene préstamos registrados.</li>
      <%
        }
      %>
    </ul>
  </div>
</body>
</html>

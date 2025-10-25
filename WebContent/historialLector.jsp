<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Mi Historial de Préstamos</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <style>
    .container { max-width: 1000px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
    .navigation { text-align: center; margin-bottom: 20px; }
    .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
    h1 { text-align: center; color: #333; margin-bottom: 30px; }
    
    .lector-info {
      background: #e8f5e8;
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      border-left: 4px solid #4CAF50;
    }
    
    .prestamo-item { 
      background: #f8f9fa; 
      margin-bottom: 15px; 
      padding: 20px; 
      border-radius: 8px; 
      border-left: 4px solid #4CAF50;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .prestamo-info { 
      margin-bottom: 10px; 
    }
    
    .prestamo-details {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 10px;
      margin-top: 10px;
    }
    
    .detail-item {
      background: #fff;
      padding: 8px 12px;
      border-radius: 4px;
      border: 1px solid #e0e0e0;
    }
    
    .detail-label {
      font-weight: bold;
      color: #555;
      font-size: 12px;
      text-transform: uppercase;
    }
    
    .detail-value {
      color: #333;
      font-size: 14px;
    }
    
    .estado {
      display: inline-block;
      padding: 4px 8px;
      border-radius: 12px;
      font-size: 12px;
      font-weight: bold;
      text-transform: uppercase;
    }
    
    .estado-pendiente { background: #fff3cd; color: #856404; }
    .estado-en_curso { background: #d4edda; color: #155724; }
    .estado-devuelto { background: #f8d7da; color: #721c24; }
    
    .empty { 
      text-align: center; 
      color: #666; 
      font-style: italic; 
      padding: 40px;
      background: #f8f9fa;
      border-radius: 8px;
    }
    
    .btn-volver {
      display: inline-block;
      background: #6c757d;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 4px;
      margin-top: 20px;
    }
    
    .btn-volver:hover {
      background: #545b62;
    }
    
    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .navigation { display: flex; flex-direction: column; gap: 8px; }
      .prestamo-details { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="navigation">
      <a href="consultarMateriales">Ver Materiales</a>
      <a href="agregarPrestamo">Solicitar Préstamo</a>
      <a href="historialLector">Mi Historial</a>
      <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <h1>Historial de Préstamos del Lector</h1>
    
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
    
    <div style="text-align: center; margin-top: 30px;">
      <a href="consultarMateriales" class="btn-volver">Volver a Materiales</a>
    </div>
  </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Historial de Lector - Consulta Bibliotecario</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <style>
    .container { max-width: 1000px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
    .navigation { text-align: center; margin-bottom: 20px; }
    .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
    h1 { text-align: center; color: #333; margin-bottom: 30px; }
    
    .lector-info {
      background: #e8f4fd;
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      border-left: 4px solid #007bff;
      text-align: center;
    }
    
    .prestamos-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    
    .prestamo-item {
      background: #f8f9fa;
      border: 1px solid #e9ecef;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 15px;
      transition: all 0.3s ease;
    }
    
    .prestamo-item:hover {
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transform: translateY(-2px);
    }
    
    .prestamo-info {
      line-height: 1.6;
    }
    
    .prestamo-info strong {
      color: #495057;
      font-weight: 600;
    }
    
    .estado-pendiente {
      background: #fff3cd;
      color: #856404;
      padding: 4px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
    }
    
    .estado-en-curso {
      background: #d1ecf1;
      color: #0c5460;
      padding: 4px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
    }
    
    .estado-devuelto {
      background: #d4edda;
      color: #155724;
      padding: 4px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
    }
    
    .empty {
      text-align: center;
      color: #6c757d;
      font-style: italic;
      padding: 40px;
      background: #f8f9fa;
      border-radius: 8px;
    }
    
    .alert {
      padding: 12px 16px;
      border-radius: 4px;
      margin-bottom: 20px;
    }
    
    .alert-error {
      background: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
    
    .btn-back {
      display: inline-block;
      background: #6c757d;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 4px;
      margin-bottom: 20px;
      transition: background 0.3s ease;
    }
    
    .btn-back:hover {
      background: #545b62;
      color: white;
    }
    
    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .navigation { display: flex; flex-direction: column; gap: 8px; }
      .prestamo-item { padding: 15px; }
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
      <a href="consultarHistorialLector">Consultar Historial</a>
      <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <a href="consultarHistorialLector" class="btn-back">← Volver a Seleccionar Lector</a>
    
    <h1>🔍 Historial de Préstamos del Lector</h1>
    
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

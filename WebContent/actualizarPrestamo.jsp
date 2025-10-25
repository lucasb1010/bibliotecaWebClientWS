<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Actualizar Préstamo</title>
  <link rel="stylesheet" href="CSS/styles.css" />
  <style>
    .container { max-width: 800px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
    .navigation { text-align: center; margin-bottom: 20px; }
    .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
    h1 { text-align: center; color: #333; margin-bottom: 30px; }
    
    .form-group { margin-bottom: 20px; }
    .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
    .form-group input, .form-group select { 
      width: 100%; 
      padding: 10px; 
      border: 1px solid #ddd; 
      border-radius: 4px; 
      font-size: 14px;
    }
    .form-row { display: flex; gap: 15px; }
    .form-row .form-group { flex: 1; }
    
    .btn { 
      padding: 12px 24px; 
      border: none; 
      border-radius: 4px; 
      cursor: pointer; 
      font-size: 14px; 
      font-weight: 500; 
      transition: all 0.3s ease;
      text-decoration: none;
      display: inline-block;
      text-align: center;
    }
    .btn-primary { 
      background: #007bff; 
      color: white; 
    }
    .btn-primary:hover { 
      background: #0056b3; 
    }
    .btn-secondary { 
      background: #6c757d; 
      color: white; 
    }
    .btn-secondary:hover { 
      background: #545b62; 
    }
    .btn-success { 
      background: #28a745; 
      color: white; 
    }
    .btn-success:hover { 
      background: #1e7e34; 
    }
    
    .button-group { 
      text-align: center; 
      margin-top: 30px; 
    }
    .button-group .btn { 
      margin: 0 10px; 
    }
    
    .prestamo-info {
      background: #f8f9fa;
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      border-left: 4px solid #007bff;
    }
    
    @media (max-width: 768px) {
      .container { margin: 10px; padding: 16px; }
      .form-row { flex-direction: column; gap: 0; }
      .button-group .btn { 
        display: block; 
        margin: 10px auto; 
        width: 200px;
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
      <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
    </div>
    
    <%@ include file="includes/userGreeting.jsp" %>
    
    <h1>Actualizar Préstamo</h1>
    
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <div class="prestamo-info">
      <strong>Información del Préstamo:</strong><br>
      <%= request.getAttribute("prestamoInfo") %>
    </div>
    
    <form method="post" action="actualizarPrestamo">
      <input type="hidden" name="lectorCorreoOriginal" value="<%= request.getAttribute("lectorCorreo") %>">
      <input type="hidden" name="bibliotecarioCorreoOriginal" value="<%= request.getAttribute("bibliotecarioCorreo") %>">
      <input type="hidden" name="materialIdOriginal" value="<%= request.getAttribute("materialId") %>">
      
      <!-- Campos de selección para cambiar usuarios y material -->
      <div class="form-row">
        <div class="form-group">
          <label for="nuevoLector">Lector:</label>
          <select id="nuevoLector" name="nuevoLector" required>
            <%
              java.util.List<String> lectores = (java.util.List<String>) request.getAttribute("lectores");
              String lectorActual = (String) request.getAttribute("lectorCorreo");
              if (lectores != null) {
                for (String lector : lectores) {
                  boolean selected = false;
                  if (lectorActual != null && !lectorActual.isEmpty()) {
                    selected = lector.equals(lectorActual);
                  }
            %>
              <option value="<%= lector %>" <%= selected ? "selected" : "" %>><%= lector %></option>
            <%
                }
              }
            %>
          </select>
        </div>
        <div class="form-group">
          <label for="nuevoBibliotecario">Bibliotecario:</label>
          <select id="nuevoBibliotecario" name="nuevoBibliotecario" required>
            <%
              java.util.List<String> bibliotecarios = (java.util.List<String>) request.getAttribute("bibliotecarios");
              String bibliotecarioActual = (String) request.getAttribute("bibliotecarioCorreo");
              if (bibliotecarios != null) {
                for (String bibliotecario : bibliotecarios) {
                  boolean selected = false;
                  if (bibliotecarioActual != null && !bibliotecarioActual.isEmpty()) {
                    selected = bibliotecario.equals(bibliotecarioActual);
                  }
            %>
              <option value="<%= bibliotecario %>" <%= selected ? "selected" : "" %>><%= bibliotecario %></option>
            <%
                }
              }
            %>
          </select>
        </div>
        <div class="form-group">
          <label for="nuevoMaterial">Material:</label>
          <select id="nuevoMaterial" name="nuevoMaterial" required>
            <%
              java.util.List<String> materiales = (java.util.List<String>) request.getAttribute("materiales");
              String materialActual = (String) request.getAttribute("materialId");
              if (materiales != null) {
                for (String material : materiales) {
                  boolean selected = false;
                  if (materialActual != null && !materialActual.isEmpty()) {
                    // El formato del material es: "ID: 2 | Tipo: ARTÍCULO | Descripción: mesa | Fecha Ingreso: 02/02/0222"
                    // Comparar si el material empieza con "ID: " + materialActual
                    if (material.startsWith("ID: " + materialActual + " |")) {
                      selected = true;
                    }
                  }
            %>
              <option value="<%= material %>" <%= selected ? "selected" : "" %>><%= material %></option>
            <%
                }
              }
            %>
          </select>
        </div>
      </div>
      
      <div class="form-row">
        <div class="form-group">
          <label for="diaSolicitud">Día de Solicitud:</label>
          <input type="number" id="diaSolicitud" name="diaSolicitud" min="1" max="31" required>
        </div>
        <div class="form-group">
          <label for="mesSolicitud">Mes de Solicitud:</label>
          <input type="number" id="mesSolicitud" name="mesSolicitud" min="1" max="12" required>
        </div>
        <div class="form-group">
          <label for="anioSolicitud">Año de Solicitud:</label>
          <input type="number" id="anioSolicitud" name="anioSolicitud" min="2000" max="2030" required>
        </div>
      </div>
      
      <div class="form-row">
        <div class="form-group">
          <label for="diaDevolucion">Día de Devolución:</label>
          <input type="number" id="diaDevolucion" name="diaDevolucion" min="1" max="31" required>
        </div>
        <div class="form-group">
          <label for="mesDevolucion">Mes de Devolución:</label>
          <input type="number" id="mesDevolucion" name="mesDevolucion" min="1" max="12" required>
        </div>
        <div class="form-group">
          <label for="anioDevolucion">Año de Devolución:</label>
          <input type="number" id="anioDevolucion" name="anioDevolucion" min="2000" max="2030" required>
        </div>
      </div>
      
      <div class="form-group">
        <label for="estado">Estado del Préstamo:</label>
        <select id="estado" name="estado" required>
          <option value="PENDIENTE">Pendiente</option>
          <option value="EN_CURSO">En Curso</option>
          <option value="DEVUELTO">Devuelto</option>
        </select>
      </div>
      
      <div class="button-group">
        <button type="submit" class="btn btn-success">Actualizar Préstamo</button>
        <a href="listarPrestamos" class="btn btn-secondary">Cancelar</a>
      </div>
    </form>
  </div>
  
  <script>
    // Cargar datos actuales del préstamo si están disponibles
    window.onload = function() {
      // Extraer datos del préstamo desde la información mostrada
      const prestamoInfo = '<%= request.getAttribute("prestamoInfo") %>';
      
      if (prestamoInfo && prestamoInfo !== 'null') {
        // Extraer fechas del formato: "Préstamo - Lector: correo, Bibliotecario: correo, Material: id, Estado: ESTADO"
        // Buscar fechas en formato DD/MM/YYYY
        const fechaSolicitudMatch = prestamoInfo.match(/Solicitud (\d{2}\/\d{2}\/\d{4})/);
        const fechaDevolucionMatch = prestamoInfo.match(/Devolución (\d{2}\/\d{2}\/\d{4})/);
        const estadoMatch = prestamoInfo.match(/Estado (\w+)/);
        
        if (fechaSolicitudMatch) {
          const fecha = fechaSolicitudMatch[1].split('/');
          document.getElementById('diaSolicitud').value = fecha[0];
          document.getElementById('mesSolicitud').value = fecha[1];
          document.getElementById('anioSolicitud').value = fecha[2];
        }
        
        if (fechaDevolucionMatch) {
          const fecha = fechaDevolucionMatch[1].split('/');
          document.getElementById('diaDevolucion').value = fecha[0];
          document.getElementById('mesDevolucion').value = fecha[1];
          document.getElementById('anioDevolucion').value = fecha[2];
        }
        
        if (estadoMatch) {
          document.getElementById('estado').value = estadoMatch[1];
        }
        
        // Los campos de selección ya están pre-seleccionados por el servidor
        // No necesitamos JavaScript adicional para estos campos
      }
    };
  </script>
</body>
</html>

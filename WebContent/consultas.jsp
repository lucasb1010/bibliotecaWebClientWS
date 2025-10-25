<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  // Declarar variables al inicio para evitar conflictos con includes
  String tipoUsuario = (String) session.getAttribute("tipoUsuario");
%>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiales</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesConsultas.css">
    <style>
      .navigation {
        text-align: center;
        margin-bottom: 30px;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 5px;
      }
      .navigation a {
        color: #4CAF50;
        text-decoration: none;
        margin: 0 15px;
        font-weight: bold;
        padding: 8px 16px;
        border-radius: 4px;
        transition: background-color 0.3s;
      }
      .navigation a:hover {
        background-color: #e8f5e8;
      }
      .add-button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        display: inline-block;
        margin-bottom: 20px;
      }
      .add-button:hover {
        background-color: #45a049;
      }
      .materials-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
      }
      
      /* Estilos para el filtro de fechas */
      .filter-container {
        background: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }
      
      .filter-container h3 {
        margin: 0 0 15px 0;
        color: #495057;
        font-size: 1.2rem;
      }
      
      .filter-info {
        background: #fff3cd;
        border: 1px solid #ffeaa7;
        border-radius: 4px;
        padding: 10px;
        margin-bottom: 15px;
        font-size: 0.9rem;
      }
      
      .filter-info p {
        margin: 0;
        color: #856404;
      }
      
      .date-filter-form {
        margin: 0;
      }
      
      .filter-row {
        display: flex;
        gap: 15px;
        align-items: end;
        flex-wrap: wrap;
      }
      
      .filter-group {
        flex: 1;
        min-width: 150px;
      }
      
      .filter-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #495057;
        font-size: 0.9rem;
      }
      
      .filter-group input[type="date"] {
        width: 100%;
        padding: 8px 12px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        font-size: 14px;
        transition: border-color 0.3s;
      }
      
      .filter-group input[type="date"]:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
      }
      
      .filter-actions {
        display: flex;
        gap: 10px;
        align-items: center;
      }
      
      .btn-filter {
        background: #4CAF50;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
      }
      
      .btn-filter:hover {
        background: #45a049;
      }
      
      .btn-clear {
        background: #6c757d;
        color: white;
        text-decoration: none;
        padding: 8px 16px;
        border-radius: 4px;
        font-size: 14px;
        transition: background-color 0.3s;
        display: inline-block;
      }
      
      .btn-clear:hover {
        background: #5a6268;
        color: white;
        text-decoration: none;
      }
      
      /* Responsive Design */
      @media screen and (max-width: 768px) {
        .materials-container {
          max-width: 100%;
          padding: 15px;
          margin: 10px;
        }
        
        .navigation {
          flex-direction: column;
          gap: 10px;
          text-align: center;
          padding: 10px;
        }
        
        .navigation a {
          margin: 5px 0;
          padding: 10px 15px;
          font-size: 14px;
          display: block;
        }
        
        h2 {
          font-size: 1.8rem;
          text-align: center;
        }
        
        .add-button {
          width: 100%;
          margin: 10px 0;
          padding: 12px;
        }
        
        ul {
          padding-left: 20px;
        }
        
        li {
          margin-bottom: 10px;
          padding: 10px;
          background-color: #f9f9f9;
          border-radius: 5px;
          word-wrap: break-word;
        }
      }
      
      @media screen and (max-width: 480px) {
        .materials-container {
          padding: 10px;
          margin: 5px;
        }
        
        .navigation {
          padding: 8px;
        }
        
        .navigation a {
          padding: 8px 12px;
          font-size: 13px;
        }
        
        h2 {
          font-size: 1.6rem;
        }
        
        .add-button {
          padding: 10px;
          font-size: 14px;
        }
        
        li {
          font-size: 14px;
          padding: 8px;
        }
        
        /* Responsive para el filtro */
        .filter-row {
          flex-direction: column;
          gap: 10px;
        }
        
        .filter-group {
          min-width: auto;
        }
        
        .filter-actions {
          justify-content: center;
          margin-top: 10px;
        }
        
        .btn-filter, .btn-clear {
          flex: 1;
          text-align: center;
        }
      }
    </style>
  </head>
  <body>
    <div class="materials-container">
      <div class="navigation">
        <a href="consultarMateriales">Ver Materiales</a>
        <% 
          if (tipoUsuario != null && tipoUsuario.equals("DtBibliotecario")) {
        %>
            <a href="consultar-usuarios">Ver Usuarios</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="listarPrestamos">Ver Préstamos</a>
        <% } else { %>
            <a href="misPrestamos">Mis Préstamos</a>
        <% } %>
        <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
      </div>
      
      <%@ include file="includes/userGreeting.jsp" %>
      
      <h2>Materiales de la Biblioteca</h2>
      
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
              <input type="date" id="fechaDesde" name="fechaDesde" 
                     value="<%= request.getParameter("fechaDesde") != null ? request.getParameter("fechaDesde") : "" %>">
            </div>
            <div class="filter-group">
              <label for="fechaHasta">Fecha Hasta:</label>
              <input type="date" id="fechaHasta" name="fechaHasta" 
                     value="<%= request.getParameter("fechaHasta") != null ? request.getParameter("fechaHasta") : "" %>">
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
          out.println("<li style='color: #666; font-style: italic;'>No hay materiales registrados en la biblioteca</li>");
        }
      %>
    </ul>
    </div>
    
    <script>
    // JavaScript para mejorar la experiencia del filtro de fechas
    document.addEventListener('DOMContentLoaded', function() {
        const fechaDesdeInput = document.getElementById('fechaDesde');
        const fechaHastaInput = document.getElementById('fechaHasta');
        const filterForm = document.querySelector('.date-filter-form');
        
        // Validar que la fecha desde no sea mayor que la fecha hasta
        function validateDateRange() {
            const fechaDesde = fechaDesdeInput.value;
            const fechaHasta = fechaHastaInput.value;
            
            if (fechaDesde && fechaHasta && fechaDesde > fechaHasta) {
                alert('La fecha "Desde" no puede ser mayor que la fecha "Hasta"');
                fechaDesdeInput.focus();
                return false;
            }
            return true;
        }
        
        // Agregar validación al formulario
        if (filterForm) {
            filterForm.addEventListener('submit', function(e) {
                if (!validateDateRange()) {
                    e.preventDefault();
                    return false;
                }
            });
        }
        
        // Validar en tiempo real cuando cambien las fechas
        if (fechaDesdeInput) {
            fechaDesdeInput.addEventListener('change', validateDateRange);
        }
        
        if (fechaHastaInput) {
            fechaHastaInput.addEventListener('change', validateDateRange);
        }
        
        // Establecer fecha máxima como hoy para evitar fechas futuras
        const today = new Date().toISOString().split('T')[0];
        if (fechaDesdeInput) {
            fechaDesdeInput.setAttribute('max', today);
        }
        if (fechaHastaInput) {
            fechaHastaInput.setAttribute('max', today);
        }
        
        // Auto-completar fecha hasta si solo se selecciona fecha desde
        if (fechaDesdeInput && fechaHastaInput) {
            fechaDesdeInput.addEventListener('change', function() {
                if (this.value && !fechaHastaInput.value) {
                    fechaHastaInput.value = this.value;
                }
            });
        }
    });
    </script>
  </body>
</html>

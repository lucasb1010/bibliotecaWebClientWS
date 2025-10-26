<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Material - Biblioteca</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesAgregarMaterial.css">
</head>
<body>
    <div class="container">
        <h1 class="uppercase">Agregar Material</h1>

        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="agregarPrestamo">Agregar Préstamo</a>
            <a href="listarPrestamos">Ver Préstamos</a>
            <a href="prestamosPorZona">📊 Préstamos por Zona</a>
            <a id="logout" href="logout">Cerrar Sesión</a>
        </div>
        
        <%@ include file="includes/userGreeting.jsp" %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>
        
        <% if (request.getAttribute("mensaje") != null) { %>
        <div class="alert alert-success"><%= request.getAttribute("mensaje") %></div>
        <% } %>

        <form class="form" method="post" action="agregarMaterial">
            <!-- Tipo de Material -->
            <div class="form-group">
                <label for="tipo">Tipo de Material:</label>
                <select id="tipo" name="tipo" required onchange="toggleFields()">
                    <option value="">Seleccione un tipo</option>
                    <option value="libro">Libro</option>
                    <option value="articulo">Artículo</option>
                </select>
            </div>

            <!-- Campos comunes -->
            <div class="form-group">
                <label for="fechaIngreso">Fecha de Ingreso:</label>
                <input type="date" id="fechaIngreso" name="fechaIngreso">
            </div>

            <!-- Campos específicos para Libro -->
            <div id="libroFields" class="material-fields" style="display: none;">
                <div class="form-group">
                    <label for="titulo">Título del Libro:</label>
                    <input type="text" id="titulo" name="titulo" placeholder="Ingrese el título del libro">
                </div>
                <div class="form-group">
                    <label for="cantidadPaginas">Cantidad de Páginas:</label>
                    <input type="number" id="cantidadPaginas" name="cantidadPaginas" min="1" placeholder="Número de páginas">
                </div>
            </div>

            <!-- Campos específicos para Artículo -->
            <div id="articuloFields" class="material-fields" style="display: none;">
                <div class="form-group">
                    <label for="descripcion">Descripción del Artículo:</label>
                    <input type="text" id="descripcion" name="descripcion" placeholder="Descripción del artículo">
                </div>
                <div class="form-group">
                    <label for="pesoKg">Peso (kg):</label>
                    <input type="number" id="pesoKg" name="pesoKg" min="0" step="0.1" placeholder="Peso en kilogramos">
                </div>
                <div class="form-group">
                    <label for="dimensiones">Dimensiones:</label>
                    <input type="text" id="dimensiones" name="dimensiones" placeholder="Ej: 30x20x15 cm">
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn btn-success">Agregar Material</button>
                <a href="consultarMateriales" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
    
    <script>
        function toggleFields() {
            const tipo = document.getElementById('tipo').value;
            const libroFields = document.getElementById('libroFields');
            const articuloFields = document.getElementById('articuloFields');
            
            // Ocultar todos los campos específicos
            libroFields.style.display = 'none';
            articuloFields.style.display = 'none';
            
            // Mostrar campos según el tipo seleccionado
            if (tipo === 'libro') {
                libroFields.style.display = 'block';
            } else if (tipo === 'articulo') {
                articuloFields.style.display = 'block';
            }
        }
    </script>
</body>
</html>
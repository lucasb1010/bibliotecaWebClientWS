<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Material - Biblioteca</title>
    <link rel="stylesheet" href="CSS/stylesAgregarMaterial.css">
</head>
<body>
    <div class="form-container">
        <h1>Agregar Nuevo Material</h1>
        
        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="consultar-usuarios">Ver Usuarios</a>
            <a href="agregarMaterial">Agregar Material</a>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("mensaje") != null) { %>
            <div class="success">
                <%= request.getAttribute("mensaje") %>
            </div>
        <% } %>
        
        <form action="agregarMaterial" method="post">
            <div class="form-group">
                <label for="tipo">Tipo de Material <span class="required">*</span></label>
                <select name="tipo" id="tipo" required>
                    <option value="">Seleccione un tipo</option>
                    <option value="libro">Libro</option>
                    <option value="articulo">Artículo</option>
                </select>
            </div>
            
            <!-- Campos comunes de DtMaterial -->
            <div class="form-group">
                <label for="fechaIngreso">Fecha de Ingreso</label>
                <input type="date" name="fechaIngreso" id="fechaIngreso">
            </div>
            
            <!-- Campos específicos del Libro -->
            <div id="campos-libro" style="display: none;">
                <h3>Información del Libro</h3>
                <div class="form-group">
                    <label for="titulo">Título del Libro</label>
                    <input type="text" name="titulo" id="titulo" placeholder="Ingrese el título del libro">
                </div>
                
                <div class="form-group">
                    <label for="cantidadPaginas">Cantidad de Páginas</label>
                    <input type="text" name="cantidadPaginas" id="cantidadPaginas" placeholder="Ingrese la cantidad de páginas">
                </div>
            </div>
            
            <!-- Campos específicos del Artículo -->
            <div id="campos-articulo" style="display: none;">
                <h3>Información del Artículo</h3>
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea name="descripcion" id="descripcion" rows="4" placeholder="Ingrese una descripción del artículo"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="pesoKg">Peso (Kg)</label>
                    <input type="number" name="pesoKg" id="pesoKg" min="0" step="0.1" placeholder="Ingrese el peso en kilogramos">
                </div>
                
                <div class="form-group">
                    <label for="dimensiones">Dimensiones</label>
                    <input type="text" name="dimensiones" id="dimensiones" placeholder="Ej: 20x15x3 cm">
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn btn-primary">Agregar Material</button>
                <a href="consultarMateriales" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
    <script src="JS/scriptsAgregarMaterial.js"></script>

</body>
</html>
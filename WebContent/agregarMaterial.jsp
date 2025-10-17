<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Material - Biblioteca</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        .form-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        
        input[type="text"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            font-family: inherit;
        }
        
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #4CAF50;
        }
        
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .required {
            color: #e74c3c;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #45a049;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
            margin-left: 10px;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }
        
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }
        
        .navigation {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .navigation a {
            color: #4CAF50;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        
        .navigation a:hover {
            text-decoration: underline;
        }
    </style>
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
                    <input type="text" name="titulo" id="titulo" 
                           placeholder="Ingrese el título del libro">
                </div>
                
                <div class="form-group">
                    <label for="cantidadPaginas">Cantidad de Páginas</label>
                    <input type="text" name="cantidadPaginas" id="cantidadPaginas" 
                           placeholder="Ingrese la cantidad de páginas">
                </div>
            </div>
            
            <!-- Campos específicos del Artículo -->
            <div id="campos-articulo" style="display: none;">
                <h3>Información del Artículo</h3>
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea name="descripcion" id="descripcion" rows="4" 
                              placeholder="Ingrese una descripción del artículo"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="pesoKg">Peso (Kg)</label>
                    <input type="number" name="pesoKg" id="pesoKg" min="0" step="0.1"
                           placeholder="Ingrese el peso en kilogramos">
                </div>
                
                <div class="form-group">
                    <label for="dimensiones">Dimensiones</label>
                    <input type="text" name="dimensiones" id="dimensiones" 
                           placeholder="Ej: 20x15x3 cm">
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn btn-primary">Agregar Material</button>
                <a href="consultarMateriales" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
    
    <script>
        // Mostrar/ocultar campos según el tipo seleccionado
        document.getElementById('tipo').addEventListener('change', function() {
            const tipo = this.value;
            const camposLibro = document.getElementById('campos-libro');
            const camposArticulo = document.getElementById('campos-articulo');
            
            // Ocultar todos los campos específicos primero
            camposLibro.style.display = 'none';
            camposArticulo.style.display = 'none';
            
            // Mostrar campos según el tipo seleccionado
            if (tipo === 'libro') {
                camposLibro.style.display = 'block';
            } else if (tipo === 'articulo') {
                camposArticulo.style.display = 'block';
            }
        });
        
        // Validación del formulario
        document.querySelector('form').addEventListener('submit', function(e) {
            const tipo = document.getElementById('tipo').value;
            
            if (!tipo) {
                alert('Por favor seleccione un tipo de material');
                e.preventDefault();
                return;
            }
            
            // Validaciones específicas según el tipo
            if (tipo === 'libro') {
                const titulo = document.getElementById('titulo').value.trim();
                if (!titulo) {
                    alert('Por favor ingrese el título del libro');
                    e.preventDefault();
                    return;
                }
            } else if (tipo === 'articulo') {
                const descripcion = document.getElementById('descripcion').value.trim();
                if (!descripcion) {
                    alert('Por favor ingrese la descripción del artículo');
                    e.preventDefault();
                    return;
                }
            }
        });
        
        // Establecer fecha actual por defecto
        document.addEventListener('DOMContentLoaded', function() {
            const fechaInput = document.getElementById('fechaIngreso');
            if (!fechaInput.value) {
                const today = new Date().toISOString().split('T')[0];
                fechaInput.value = today;
            }
        });
    </script>
</body>
</html>


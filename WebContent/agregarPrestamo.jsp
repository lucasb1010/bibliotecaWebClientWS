<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Préstamo</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        .container { max-width: 800px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); }
        .navigation { text-align: center; margin-bottom: 20px; }
        .navigation a { color: #4CAF50; text-decoration: none; margin: 0 10px; font-weight: bold; }
        h1 { text-align: center; color: #333; }
        .form-group { margin-bottom: 16px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        select, input[type="date"] { width: 100%; padding: 10px; border: 1.5px solid #ddd; border-radius: 6px; font-size: 16px; }
        .btn { padding: 12px 20px; border: none; border-radius: 6px; background: #4CAF50; color: white; cursor: pointer; font-weight: bold; }
        .btn-secondary { background: #777; text-decoration: none; display: inline-block; }
        .row { display: flex; gap: 16px; }
        .row .form-group { flex: 1; }
        .alert { padding: 12px; border-radius: 6px; margin-bottom: 12px; }
        .alert-error { background: #fdecea; color: #b71c1c; }
        .alert-success { background: #e8f5e9; color: #1b5e20; }

        @media (max-width: 768px) {
            .container { margin: 10px; padding: 16px; }
            .row { flex-direction: column; gap: 0; }
            .navigation { display: flex; flex-direction: column; gap: 8px; }
            .btn, .btn-secondary { width: 100%; margin-bottom: 8px; text-align: center; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="agregarPrestamo">Agregar Préstamo</a>
        </div>

        <h1>Agregar Préstamo</h1>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("mensaje") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("mensaje") %></div>
        <% } %>

        <form method="post" action="agregarPrestamo">
            <div class="form-group">
                <label for="materialId">Material</label>
                <select name="materialId" id="materialId" required>
                    <option value="">Seleccione un material</option>
                    <% java.util.List<String> materialesIds = (java.util.List<String>) request.getAttribute("materialesIds");
                       if (materialesIds != null) {
                           for (String mid : materialesIds) { %>
                               <option value="<%= mid %>">ID: <%= mid %></option>
                    <%     }
                       } %>
                </select>
            </div>

            <div class="row">
                <div class="form-group">
                    <label for="lectorCorreo">Lector</label>
                    <select name="lectorCorreo" id="lectorCorreo" required>
                        <option value="">Seleccione un lector</option>
                        <% java.util.List<String> lectores = (java.util.List<String>) request.getAttribute("lectores");
                           if (lectores != null) {
                               for (String l : lectores) { %>
                                   <option value="<%= l %>"><%= l %></option>
                        <%     }
                           } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bibliotecarioCorreo">Bibliotecario</label>
                    <select name="bibliotecarioCorreo" id="bibliotecarioCorreo" required>
                        <option value="">Seleccione un bibliotecario</option>
                        <% java.util.List<String> bibliotecarios = (java.util.List<String>) request.getAttribute("bibliotecarios");
                           if (bibliotecarios != null) {
                               for (String b : bibliotecarios) { %>
                                   <option value="<%= b %>"><%= b %></option>
                        <%     }
                           } %>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label for="fechaSolicitud">Fecha de Solicitud</label>
                    <input type="date" id="fechaSolicitud" name="fechaSolicitud" required />
                </div>
                <div class="form-group">
                    <label for="fechaDevolucion">Fecha de Devolución</label>
                    <input type="date" id="fechaDevolucion" name="fechaDevolucion" />
                </div>
            </div>

            <div class="form-group" style="text-align:center;">
                <button type="submit" class="btn">Crear Préstamo</button>
                <a href="consultarMateriales" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</body>
</html>

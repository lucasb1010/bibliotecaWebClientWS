<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Préstamo</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesAgregarPrestamo.css">
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
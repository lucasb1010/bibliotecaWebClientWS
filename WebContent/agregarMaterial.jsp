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
        <h1 class="uppercase">Actualizar Préstamo</h1>

        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="agregarPrestamo">Agregar Préstamo</a>
            <a href="listarPrestamos">Ver Préstamos</a>
            <a href="prestamosPorZona">📊 Préstamos por Zona</a>
            <a id="logout" href="logout">Cerrar Sesión</a> <!-- Campos de selección para cambiar usuarios y material -->
        </div>
        
        <%@ include file="includes/userGreeting.jsp" %>

        
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>
        
        <div class="prestamo-info">
            <strong>Información del Préstamo:</strong><br>
            <%= request.getAttribute("prestamoInfo") %>
        </div>
        
        <form class="form" method="post" action="actualizarPrestamo">
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
    <script src="JS/scriptsAgregarMaterial.js"></script>
</body>
</html>
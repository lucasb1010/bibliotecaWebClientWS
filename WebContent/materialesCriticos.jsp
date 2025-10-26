<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String tipoUsuario = (String) session.getAttribute("tipoUsuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiales Críticos</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/stylesMaterialesCriticos.css">
</head>
<body>
    <div class="container">
        <h1>Materiales con muchos préstamos pendientes</h1>

        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <% if (tipoUsuario != null && tipoUsuario.equals("DtBibliotecario")) { %>
                <a href="consultar-usuarios">Ver Usuarios</a>
                <a href="agregarMaterial">Agregar Material</a>
                <a href="listarPrestamos">Ver Préstamos</a>
            <% } else { %>
                <a href="misPrestamos">Mis Préstamos</a>
            <% } %>
            <a id="logout" href="logout">Cerrar Sesión</a>
        </div>

        <%@ include file="includes/userGreeting.jsp" %>

        <div class="filter-container critical-filter">
            <form method="get" action="consultarMaterialesPorPrestamos" class="umbral-form">
            <label for="umbral">Umbral (número de préstamos):</label>
            <input type="number" id="umbral" name="umbral" min="0" value="<%= request.getAttribute("umbral") != null ? request.getAttribute("umbral") : 3 %>">
            <button type="submit" class="btn-filter">Buscar</button>
            </form>
        </div>

        <% if (request.getAttribute("mensaje") != null) { %>
            <div class="div">
            <%= request.getAttribute("mensaje") %>
            </div>
        <% } %>

        <div class="table-wrapper">
            <table class="criticals-table">
            <thead>
                <tr>
                <th>ID</th>
                <th>Tipo</th>
                <th>Nombre</th>
                <th>Préstamos Pendientes</th>
                </tr>
            </thead>
            <tbody>
                <%
                String[] materiales = (String[]) request.getAttribute("materialesCriticos");
                if (materiales != null && materiales.length > 0) {
                    for (String m : materiales) {
                    // Parseamos la línea esperada: "ID: %d | Tipo: %s | Nombre: %s | Préstamos Pendientes: %d"
                    String id = "-";
                    String tipo = "-";
                    String nombre = "-";
                    String prestamos = "-";
                    if (m != null) {
                        String[] parts = m.split("\\|");
                        for (String p : parts) {
                        String t = p.trim();
                        if (t.startsWith("ID:")) id = t.substring(3).trim();
                        else if (t.startsWith("Tipo:")) tipo = t.substring(5).trim();
                        else if (t.startsWith("Nombre:")) nombre = t.substring(7).trim();
                        else if (t.startsWith("Préstamos Pendientes:")) prestamos = t.substring("Préstamos Pendientes:".length()).trim();
                        }
                    }
                    out.println("<tr><td>" + id + "</td><td>" + tipo + "</td><td>" + nombre + "</td><td>" + prestamos + "</td></tr>");
                    }
                } else {
                    out.println("<tr><td colspan='4' class="mensaje">No se encontraron materiales que cumplan el umbral</td></tr>");
                }
                %>
            </tbody>
            </table>
        </div>
    </div>
    <script src="JS/scriptsMaterialesCriticos.js"></script>
</body>
</html>

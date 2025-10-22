<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
  String nombreUsuario = (String) session.getAttribute("nombreUsuario");
  if (nombreUsuario != null) {
    Object tipoObj = session.getAttribute("tipoUsuario");
    String icono = "👤";
    if ("DtLector".equals(tipoObj)) {
      icono = "📚";
    } else if ("DtBibliotecario".equals(tipoObj)) {
      icono = "👨‍💼";
    }
%>
  <div class="user-greeting" style="background: linear-gradient(135deg, #e8f5e8, #f0f8f0); padding: 15px; border-radius: 8px; margin-bottom: 20px; text-align: center; border-left: 4px solid #4CAF50;">
    <strong style="color: #2e7d32; font-size: 16px;">
      <%= icono %> ¡Hola <%= nombreUsuario %>!
    </strong>
    <% if (tipoObj != null) { %>
      <br>
      <small style="color: #666; font-size: 12px;">
        <% if ("DtLector".equals(tipoObj)) { %>
          📖 Lector
        <% } else if ("DtBibliotecario".equals(tipoObj)) { %>
          👨‍💼 Bibliotecario
        <% } %>
      </small>
    <% } %>
  </div>
<% } %>

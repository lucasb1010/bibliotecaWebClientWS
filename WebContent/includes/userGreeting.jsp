<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
  String nombreUsuario = (String) session.getAttribute("nombreUsuario");
  String tipoUsuario = (String) session.getAttribute("tipoUsuario");
  if (nombreUsuario != null) {
    String icono = "👤";
    if (tipoUsuario != null) {
      if (tipoUsuario.equals("DtLector")) {
        icono = "📚";
      } else if (tipoUsuario.equals("DtBibliotecario")) {
        icono = "👨‍💼";
      }
    }
%>
  <div class="user-greeting" style="background: linear-gradient(135deg, #e8f5e8, #f0f8f0); padding: 15px; border-radius: 8px; margin-bottom: 20px; text-align: center; border-left: 4px solid #4CAF50;">
    <strong style="color: #2e7d32; font-size: 16px;">
      <%= icono %> ¡Hola <%= nombreUsuario %>!
    </strong>
    <% if (tipoUsuario != null) { %>
      <br>
      <small style="color: #666; font-size: 12px;">
        <% if (tipoUsuario.equals("DtLector")) { %>
          📖 Lector
        <% } else if (tipoUsuario.equals("DtBibliotecario")) { %>
          👨‍💼 Bibliotecario
        <% } %>
      </small>
    <% } %>
  </div>
<% } %>

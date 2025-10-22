<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      }
    </style>
  </head>
  <body>
    <div class="materials-container">
      <div class="navigation">
        <a href="consultarMateriales">Ver Materiales</a>
        <a href="consultar-usuarios">Ver Usuarios</a>
        <a href="agregarMaterial">Agregar Material</a>
        <a href="logout" style="color: #dc3545;">Cerrar Sesión</a>
      </div>
      
      <%@ include file="includes/userGreeting.jsp" %>
      
      <h2>Materiales de la Biblioteca</h2>
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
  </body>
</html>

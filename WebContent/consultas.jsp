<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Materiales</title>
  </head>
  <body>
    <h2>Materiales</h2>
    <ul>
      <%
        String[] materiales = (String[]) request.getAttribute("materiales");
        if (materiales != null && materiales.length > 0) {
          for (String m : materiales) { out.println("<li>" + m + "</li>"); }
        } else {
          out.println("<li>Sin datos</li>");
        }
      %>
    </ul>
  </body>
</html>



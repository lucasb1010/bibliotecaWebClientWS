package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import publicadores.ControladorPublish;
import publicadores.ControladorPublishService;
import publicadores.DtUsuario;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter out = resp.getWriter();
        JsonObject response = new JsonObject();
        
        try {
            // Obtener parámetros del formulario
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            // Debug: imprimir parámetros recibidos
            System.out.println("DEBUG - Email recibido: " + email);
            System.out.println("DEBUG - Password recibido: " + password);
            
            if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
                response.addProperty("success", false);
                response.addProperty("message", "Email y contraseña son requeridos. Email: " + email + ", Password: " + password);
                out.print(response.toString());
                return;
            }
            
            // Usar cliente JAX-WS para autenticar
            ControladorPublishService service = new ControladorPublishService();
            ControladorPublish port = service.getControladorPublishPort();
            
            // Llamar al método de login (necesitarás implementarlo en el servicio web)
            DtUsuario usuario = port.login(email, password);
            
            if (usuario != null) {
                // Login exitoso
                HttpSession session = req.getSession(true);
                session.setAttribute("usuario", usuario);
                session.setAttribute("email", email);
                session.setAttribute("tipoUsuario", usuario.getClass().getSimpleName());
                
                // Obtener nombre del usuario (usando reflexión para acceder a getNombre)
                String nombreUsuario = "Usuario";
                try {
                    java.lang.reflect.Method getNombre = usuario.getClass().getMethod("getNombre");
                    nombreUsuario = (String) getNombre.invoke(usuario);
                } catch (Exception e) {
                    System.out.println("No se pudo obtener el nombre del usuario: " + e.getMessage());
                }
                
                session.setAttribute("nombreUsuario", nombreUsuario);
                
                response.addProperty("success", true);
                response.addProperty("message", "¡Bienvenido " + nombreUsuario + "!");
                response.addProperty("tipoUsuario", usuario.getClass().getSimpleName());
                response.addProperty("nombreUsuario", nombreUsuario);
            } else {
                response.addProperty("success", false);
                response.addProperty("message", "Credenciales incorrectas");
            }
            
        } catch (Exception e) {
            response.addProperty("success", false);
            response.addProperty("message", "Error del servidor: " + e.getMessage());
        }
        
        out.print(response.toString());
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Redirigir a la página de login
        resp.sendRedirect("login.jsp");
    }
}

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Historial de Préstamos - Bibliotecario</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        /* Estilos específicos para el historial de préstamos */
        .history-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5rem;
        }
        
        .librarian-info {
            background-color: #e8f5e8;
            border: 1px solid #4CAF50;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 25px;
            text-align: center;
        }
        
        .librarian-info h3 {
            color: #2e7d32;
            margin: 0 0 10px 0;
        }
        
        .stats {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            min-width: 150px;
            margin: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .loans-list {
            list-style: none;
            padding: 0;
        }
        
        .loan-item {
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            margin-bottom: 15px;
            padding: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .loan-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .loan-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }
        
        .loan-id {
            font-weight: bold;
            color: #4CAF50;
            font-size: 1.1rem;
        }
        
        .loan-status {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        .status-pendiente {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-activo {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-devuelto {
            background-color: #d1ecf1;
            color: #0c5460;
        }
        
        .loan-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }
        
        .detail-item {
            background-color: white;
            padding: 10px;
            border-radius: 5px;
            border-left: 4px solid #4CAF50;
        }
        
        .detail-label {
            font-weight: bold;
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 5px;
        }
        
        .detail-value {
            color: #333;
            font-size: 1rem;
        }
        
        .no-loans {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 2px dashed #dee2e6;
        }
        
        .navigation {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .navigation a {
            color: #4CAF50;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-weight: bold;
        }
        
        .navigation a:hover {
            background-color: #e8f5e8;
        }
        
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }
        
        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .history-container {
                max-width: 100%;
                margin: 10px;
                padding: 20px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .stats {
                flex-direction: column;
                align-items: center;
            }
            
            .stat-card {
                width: 100%;
                max-width: 300px;
            }
            
            .loan-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .loan-details {
                grid-template-columns: 1fr;
            }
            
            .navigation {
                flex-direction: column;
                text-align: center;
            }
        }
        
        @media screen and (max-width: 480px) {
            .history-container {
                margin: 5px;
                padding: 15px;
            }
            
            h1 {
                font-size: 1.8rem;
            }
            
            .stat-card {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <div class="history-container">
        <div class="navigation">
            <a href="consultarMateriales">Ver Materiales</a>
            <a href="agregarMaterial">Agregar Material</a>
            <a href="agregarPrestamo">Agregar Préstamo</a>
            <a href="listarPrestamos">Ver Todos los Préstamos</a>
            <a href="historialPrestamosBibliotecario">Mi Historial</a>
            <a href="logout">Cerrar Sesión</a>
        </div>

        <h1>📚 Mi Historial de Préstamos</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } else { %>
            <div class="librarian-info">
                <h3>👤 Bibliotecario: <%= request.getAttribute("correoBibliotecario") %></h3>
            </div>
            
            <div class="stats">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("totalPrestamos") %></div>
                    <div class="stat-label">Total de Préstamos</div>
                </div>
            </div>
            
            <ul class="loans-list">
                <% 
                List<String> prestamos = (List<String>) request.getAttribute("prestamos");
                if (prestamos != null && !prestamos.isEmpty()) {
                    for (String prestamo : prestamos) {
                        // Parsear información del préstamo (formato: "Material X | Lector Y | Bibliotecario Z | Estado W | Solicitud A | Devolución B")
                        String[] partes = prestamo.split(" \\| ");
                        String material = "", lector = "", bibliotecario = "", estado = "", fechaSolicitud = "", fechaDevolucion = "";
                        
                        for (String parte : partes) {
                            if (parte.startsWith("Material ")) {
                                material = parte.replace("Material ", "").trim();
                            } else if (parte.startsWith("Lector ")) {
                                lector = parte.replace("Lector ", "").trim();
                            } else if (parte.startsWith("Bibliotecario ")) {
                                bibliotecario = parte.replace("Bibliotecario ", "").trim();
                            } else if (parte.startsWith("Estado ")) {
                                estado = parte.replace("Estado ", "").trim();
                            } else if (parte.startsWith("Solicitud ")) {
                                fechaSolicitud = parte.replace("Solicitud ", "").trim();
                            } else if (parte.startsWith("Devolución ")) {
                                fechaDevolucion = parte.replace("Devolución ", "").trim();
                            }
                        }
                        
                        String statusClass = "status-pendiente";
                        if (estado.toLowerCase().contains("activo")) {
                            statusClass = "status-activo";
                        } else if (estado.toLowerCase().contains("devuelto")) {
                            statusClass = "status-devuelto";
                        }
                %>
                    <li class="loan-item">
                        <div class="loan-header">
                            <div class="loan-id">Material #<%= material %></div>
                            <div class="loan-status <%= statusClass %>"><%= estado %></div>
                        </div>
                        
                        <div class="loan-details">
                            <div class="detail-item">
                                <div class="detail-label">👤 Lector</div>
                                <div class="detail-value"><%= lector %></div>
                            </div>
                            
                            <div class="detail-item">
                                <div class="detail-label">📚 Material</div>
                                <div class="detail-value"><%= material %></div>
                            </div>
                            
                            <% if (!fechaSolicitud.isEmpty()) { %>
                            <div class="detail-item">
                                <div class="detail-label">📅 Fecha Solicitud</div>
                                <div class="detail-value"><%= fechaSolicitud %></div>
                            </div>
                            <% } %>
                            
                            <% if (!fechaDevolucion.isEmpty()) { %>
                            <div class="detail-item">
                                <div class="detail-label">📅 Fecha Devolución</div>
                                <div class="detail-value"><%= fechaDevolucion %></div>
                            </div>
                            <% } %>
                        </div>
                    </li>
                <% 
                    }
                } else {
                %>
                    <li class="no-loans">
                        <h3>📭 No hay préstamos registrados</h3>
                        <p>No se encontraron préstamos asociados a tu cuenta de bibliotecario.</p>
                        <p>Los préstamos aparecerán aquí una vez que comiences a procesarlos.</p>
                    </li>
                <% } %>
            </ul>
        <% } %>
    </div>
</body>
</html>

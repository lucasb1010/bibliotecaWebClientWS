<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    String emailLector = (String) request.getAttribute("emailLector");
    Map<String, List<String>> prestamosPorEstado = (Map<String, List<String>>) request.getAttribute("prestamosPorEstado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Préstamos - Biblioteca Web</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }
        
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
        
        .user-info {
            background: linear-gradient(135deg, #e8f5e8, #f0f8f0);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .user-info h2 {
            margin: 0;
            color: #2e7d32;
        }
        
        .estado-section {
            margin-bottom: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .estado-header {
            padding: 15px 20px;
            font-weight: bold;
            font-size: 1.1rem;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .estado-pendiente { background: #FF9800; }
        .estado-en-curso { background: #4CAF50; }
        .estado-devuelto { background: #9E9E9E; }
        
        .estado-count {
            background: rgba(255,255,255,0.2);
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.9rem;
        }
        
        .prestamos-list {
            padding: 0;
            margin: 0;
        }
        
        .prestamo-item {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            background: #fafafa;
        }
        
        .prestamo-item:last-child {
            border-bottom: none;
        }
        
        .prestamo-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .prestamo-details {
            flex: 1;
            min-width: 300px;
        }
        
        .prestamo-material {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }
        
        .prestamo-meta {
            font-size: 0.9rem;
            color: #666;
        }
        
        .prestamo-actions {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8rem;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-info {
            background: #2196F3;
            color: white;
        }
        
        .btn-success {
            background: #4CAF50;
            color: white;
        }
        
        .empty-state {
            padding: 40px 20px;
            text-align: center;
            color: #666;
            font-style: italic;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            border-left: 4px solid #4CAF50;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 15px;
            }
            
            .navigation {
                padding: 10px;
            }
            
            .navigation a {
                display: block;
                margin: 5px 0;
                padding: 10px;
            }
            
            .prestamo-info {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .prestamo-actions {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="navigation">
            <a href="consultarMateriales">📚 Ver Materiales</a>
            <a href="misPrestamos">📋 Mis Préstamos</a>
            <a href="logout" style="color: #f44336;">🚪 Cerrar Sesión</a>
        </div>
        
        <div class="user-info">
            <h2>📋 Mis Préstamos</h2>
            <p>Gestión de tus préstamos personales</p>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div style="background: #ffebee; color: #c62828; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <!-- Estadísticas -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("PENDIENTE").size() %></div>
                <div class="stat-label">Pendientes</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("EN_CURSO").size() %></div>
                <div class="stat-label">En Curso</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><%= prestamosPorEstado.get("DEVUELTO").size() %></div>
                <div class="stat-label">Devueltos</div>
            </div>
        </div>
        
        <!-- Préstamos Pendientes -->
        <div class="estado-section">
            <div class="estado-header estado-pendiente">
                <span>⏳ Préstamos Pendientes</span>
                <span class="estado-count"><%= prestamosPorEstado.get("PENDIENTE").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("PENDIENTE").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos pendientes</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("PENDIENTE")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: Pendiente de aprobación</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
        
        <!-- Préstamos En Curso -->
        <div class="estado-section">
            <div class="estado-header estado-en-curso">
                <span>📖 Préstamos En Curso</span>
                <span class="estado-count"><%= prestamosPorEstado.get("EN_CURSO").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("EN_CURSO").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos en curso</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("EN_CURSO")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: En curso - Material prestado</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
        
        <!-- Préstamos Devueltos -->
        <div class="estado-section">
            <div class="estado-header estado-devuelto">
                <span>✅ Préstamos Devueltos</span>
                <span class="estado-count"><%= prestamosPorEstado.get("DEVUELTO").size() %> préstamos</span>
            </div>
            <ul class="prestamos-list">
                <% if (prestamosPorEstado.get("DEVUELTO").isEmpty()) { %>
                    <li class="empty-state">No tienes préstamos devueltos</li>
                <% } else { %>
                    <% for (String prestamo : prestamosPorEstado.get("DEVUELTO")) { %>
                        <li class="prestamo-item">
                            <div class="prestamo-info">
                                <div class="prestamo-details">
                                    <div class="prestamo-material"><%= prestamo %></div>
                                    <div class="prestamo-meta">Estado: Devuelto - Préstamo completado</div>
                                </div>
                            </div>
                        </li>
                    <% } %>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>

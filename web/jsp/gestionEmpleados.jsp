<%@ page import="java.sql.*" %>
<%@ page import="controllers.ConexionDB" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gesti�n de Empleados</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/gestionStyle.css">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/8148534299.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
            </div>
            <div class="user-icon">
                <a href="adminConfig.jsp"><img src="<%= request.getContextPath() %>/images/configuracion.png" alt="configuracion"></a>
            </div>
        </header>
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="adminDashboard.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoMenu.jpg" alt="Men� Principal">Men� Principal</a></li>
                    <li><hr></li>
                    <li><a href="gestionEmpleados.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoEmpleado.jpg" alt="Gesti�n de empleados">Gesti�n de empleados</a></li>
                    <li><hr></li>
                    <li><a href="gestionClientes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoCliente.jpg" alt="Gesti�n de clientes">Gesti�n de clientes</a></li>
                    <li><hr></li>
                    <li><a href="gestionProveedores.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProveedor.jpg" alt="Gesti�n de proveedores">Gesti�n de proveedores</a></li>
                    <li><hr></li>
                    <li><a href="gestionProductos.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProducto.jpg" alt="Gesti�n de productos">Gesti�n de productos</a></li>
                    <li><hr></li>
                    <li><a href="gestionReportes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoReporte.jpg" alt="Reportes">Reportes</a></li>
                    <li><hr></li>
                    <li><a href="gestionNoticias.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoPublicacion.jpg" alt="Publicaci�n de noticias">Publicaci�n de noticias y eventos</a></li>
                </ul>
            </nav>
        </div>
        <main>
            <div class="agregarNuevo">
                <h2>Agregar Empleado</h2>
                <form action="<%= request.getContextPath() %>/GestionarEmpleado"  method="post">
                    <input type="hidden" name="action" value="agregar">
                    <div>
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" required>
                    </div>
                    <div>
                        <label for="telefono">Tel�fono:</label>
                        <input type="text" id="telefono" name="telefono" required>
                    </div>
                    <div>
                        <label for="correo">Correo electr�nico:</label>
                        <input type="email" id="correo" name="correo" required>
                    </div>
                    <div>
                        <label for="dni">DNI:</label>
                        <input type="text" id="dni" name="dni" required>
                    </div>
                    <div>
                        <label for="cargo">Cargo:</label>
                        <input type="text" id="cargo" name="cargo" required>
                    </div>
                    <div>
                        <label for="fechaContratacion">Fecha de Contrataci�n:</label>
                        <input type="date" id="fechaContratacion" name="fechaContratacion" required>
                    </div>
                    <div>
                        <label for="idRol">Rol:</label>
                        <select id="idRol" name="idRol" required>
                            <option value="1">Admin</option>
                            <option value="2">User</option>
                        </select>
                    </div>
                    <div>
                        <label for="contrasena">Contrase�a:</label>
                        <input type="password" id="contrasena" name="contrasena" required>
                    </div>
                    <button type="submit">Agregar</button>
                </form>
            </div>
            <div class="lista">
                <h2>Lista de Empleados</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Tel�fono</th>
                            <th>Correo Electr�nico</th>
                            <th>DNI</th>
                            <th>Cargo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            PreparedStatement stmt = null;
                            ResultSet rs = null;
                            try {
                                conn = ConexionDB.getConnection();
                                String sql = "SELECT idEmpleado, nombreEmpleado, telefonoEmpleado, correoEmpleado, dniEmpleado, cargo FROM empleado";
                                stmt = conn.prepareStatement(sql);
                                rs = stmt.executeQuery();
                                while (rs.next()) {
                                    String nombre = rs.getString("nombreEmpleado");
                                    String telefono = rs.getString("telefonoEmpleado");
                                    String correo = rs.getString("correoEmpleado");
                                    String dni = rs.getString("dniEmpleado");
                                    String cargo = rs.getString("cargo");
                                    int idEmpleado = rs.getInt("idEmpleado");
                        %>
                        <tr>
                            <td><%= nombre %></td>
                            <td><%= telefono %></td>
                            <td><%= correo %></td>
                            <td><%= dni %></td>
                            <td><%= cargo %></td>
                            <td>
                                <a href="ModificarProducto.php?id=<?=$datos->idproducto?>" class="btn btn-small"><i
                                        class="fa-solid fa-pen-to-square"></i></a>
                                <a href="CrudProducto.php?id=<?= $datos->idproducto?>" class="btn btn-small btn-danger"><i
                                        class="fa-solid fa-user-minus"></i></a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (SQLException | ClassNotFoundException e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>
</html>

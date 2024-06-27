<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcampoverde", "root", "");
    String sql = "SELECT * FROM noticia ORDER BY fechaNoticia DESC";
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery(sql);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Noticias y Eventos</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeBody.css">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="container">
                <div class="logo">
                    <a href="employeeDashboard.jsp">
                        <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
                    </a>
                </div>
                <nav>
                    <ul>
                        <li><a href="employeeInformation.jsp">Información</a></li>
                        <li><a href="employeeNews.jsp">Noticias y Eventos</a></li>
                        <li><a href="employeeProducts.jsp">Productos</a></li>
                        <li><a href="employeeReports.jsp">Reportes</a></li>
                        <li><a href="employeeForum.jsp">Foro de discusión</a></li>
                    </ul>
                </nav>
                <div class="config">
                    <a href="employeeConfig.jsp">
                        <img src="<%= request.getContextPath() %>/images/configuracion.png" alt="config">
                    </a>
                </div>
            </div>
        </header>
        <main class="container mt-5">
            <!-- Sección de Noticias y Eventos -->
            <div class="row mb-4">
                <div class="col text-center">
                    <h2>Noticias y Eventos</h2>
                    <p>Mantener a los empleados informados sobre las últimas noticias y eventos de la empresa.</p>
                </div>
            </div>

            <!-- Noticias Recientes -->
            <div class="row mb-4">
                <div class="col-12">
                    <h3>Noticias Recientes</h3>
                    <div id="newsCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <%
                                boolean first = true;
                                while (rs.next()) {
                                    String tituloNoticia = rs.getString("tituloNoticia");
                                    String contenido = rs.getString("contenido");
                                    String fechaNoticia = rs.getString("fechaNoticia");
                                    String imagen = rs.getString("imagen");
                            %>
                            <div class="carousel-item <%= first ? "active" : "" %>">
                                <div class="card">
                                    <img src="<%= request.getContextPath() %>/${imagen}" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= tituloNoticia %></h5>
                                        <p class="card-text"><%= contenido %></p>
                                        <p class="card-text"><small class="text-muted">Publicado el <%= fechaNoticia %></small></p>
                                    </div>
                                </div>
                            </div>
                            <%
                                    first = false;
                                }
                                conn.close();
                            %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#newsCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#newsCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Eventos Próximos -->
            <div class="row mb-4">
                <div class="col-12">
                    <h3>Eventos Próximos</h3>
                    <div class="row">
                        <!-- Ejemplo estático de eventos, reemplazar con contenido dinámico según sea necesario -->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Reunión Corporativa</h5>
                                    <p class="card-text">Detalles sobre la próxima reunión corporativa.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Seminario de Innovación</h5>
                                    <p class="card-text">Información sobre el seminario de innovación.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Taller de Capacitación</h5>
                                    <p class="card-text">Detalles sobre el próximo taller de capacitación.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Boletines y Comunicados -->
            <div class="row mb-4">
                <div class="col-12">
                    <h3>Boletines y Comunicados</h3>
                    <div class="list-group">
                        <!-- Ejemplo estático de boletines, reemplazar con contenido dinámico según sea necesario -->
                        <a href="#" class="list-group-item list-group-item-action">Boletín Mensual - Junio 2024</a>
                        <a href="#" class="list-group-item list-group-item-action">Comunicado Oficial - Cambio de Políticas</a>
                        <a href="#" class="list-group-item list-group-item-action">Boletín Mensual - Mayo 2024</a>
                    </div>
                </div>
            </div>
        </main>
    <footer>
        <section id="contacto">
            <div class="contenedor-footer">
                <div class="content-foo">
                    <h4>Teléfono</h4>
                    <p>+51 923579117</p>
                </div>
                <div class="content-foo">
                    <h4>Email</h4>
                    <p>Grupocampoverde@hotmail.com</p>
                </div>
                <div class="content-foo">
                    <h4>Redes sociales</h4>
                    <div class="lang-social">
                        <a href="https://www.facebook.com" class="social-icon">F</a>
                    </div>
                </div>
            </div>
        </section>
        <section id="titulo-final">
            <h2 class="titulo-final">Grupo Campo Verde &copy;</h2>
        </section>
    </footer>
</body>
</html>
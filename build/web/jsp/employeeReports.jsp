<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reportes</title>
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
        <main>
            
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
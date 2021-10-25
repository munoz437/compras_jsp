
<%@page import="modelo.Menu"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Puesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") != null) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            body{
                background: #02AAB0;  
                background: -webkit-linear-gradient(to left, #00CDAC, #02AAB0); 
                background: linear-gradient(to left, #00CDAC, #02AAB0); 
            }
            h1{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="inicio.jsp">Empresa</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="inicio.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Integrantes</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <%--<a class="dropdown-item" href="puestos.jsp">Puestos</a>
                            <a class="dropdown-item" href="empleados.jsp">Empleados</a>
                            <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                            <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="marcas.jsp">Marcas</a>
                            <a class="dropdown-item" href="productos.jsp">Productos</a>
                            <a class="dropdown-item" href="ventas.jsp">Ventas</a>
                            <a class="dropdown-item" href="compras.jsp">Compras</a>--%>
                            <%
                                Menu menu = new Menu();
                                HashMap<String, String> drop = menu.drop();
                                for (String i : drop.keySet()) {
                                    out.println("<a class='dropdown-item' href='" + i + ".jsp'>" + i.toUpperCase() + "</a>");
                                }
                            %>

                        </div>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> Bienvenido ${sessionScope.usuario}</a>

                    </li>
                    <li class="nav-item">
                        <form action="../login" method="post">
                            <button name="btn_cerrar" id="btn_cerrar"  value="cerrar" class="btn btn-primary ">Cerrar Sesión</button>

                        </form>


                    </li>

                </ul>
            </div>
        </nav>









        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>

<%    } else {
        response.sendRedirect("../index.jsp");
    }

%>
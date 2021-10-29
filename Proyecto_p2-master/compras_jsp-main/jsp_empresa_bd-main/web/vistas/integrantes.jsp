
<%@page import="modelo.Menu"%>
<%@page import="modelo.Clientes"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<!DOCTYPE html>
<html>
  
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>info</title>
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
                        <a class="nav-link" href="#">Informacion</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <%--<a class="dropdown-item" href="puestos.jsp">Puestos</a>
                            <a class="dropdown-item" href="clientes.jsp">Clientes</a>
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
                </ul>
            </div>
        </nav>
        <h1>--:)INFORMACION SOBRE NOSOTROS(:--</h1>
        <br>
        <h3>-¿QUIENES SOMOS?-</h3>
        <br>
        <FONT FACE="times new roman" size=4 COLOR="black">Somos una epresa que se dedica a la distrubicion de productos electronicos</FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">Stales como felefonos moviles, aparatos de sonido, camaras profecionales, etc.</FONT>
         <FONT FACE="times new roman" size=4 COLOR="black">tambien, hacemos cotizaciones sobre productos mas caros o mas grandes para cumplir con las espectativas</FONT>
          <FONT FACE="times new roman" size=4 COLOR="black">del cliente. nosotros nos dedicamos tambien a la reparacion de aparatos electronicos con</FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">piezas originales del mismo dispositivo.</FONT>
         <br>
        
        <h3>**MISION**</h3>
        <br>
        <FONT FACE="times new roman" size=4 COLOR="black">Gracias a la oportunidad que se nos ha dado y tambien, agradeciondo a los </FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">muy buenos y formales proveedores que nos han logrado conseguir todo tipo de producto y por su puesto de la mejor</FONT>
         <FONT FACE="times new roman" size=4 COLOR="black">calidad y con mayor demanda del mercado, queremos expandir un poco mas e instruir a la gente a que</FONT>
          <FONT FACE="times new roman" size=4 COLOR="black">valore la posibilidad de abrirse al mundo de la tecnologia adquiriendo nuestros productos y de esa manera</FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">adquirir nuevos conocimientos sobre la tecnologia que en estos momentos es muy importante</FONT>
        <br>
        
        <h3>**VISION**</h3>
        <br>
        <FONT FACE="times new roman" size=4 COLOR="black">Ya que por el momento somos una tienda en linea y estamos empezando con el tema de las</FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">ventas en line y las reparaciones a domicilio, nuestra mision es conseguir un buen local y de esa manera</FONT>
         <FONT FACE="times new roman" size=4 COLOR="black">poder tener una mayor cercania con nuestros clientes, cuando logramos nuestro cometido como</FONT>
          <FONT FACE="times new roman" size=4 COLOR="black">empresa, expandirnos a diferentes lugares del pais y tambien crear muchos talleres de </FONT>
        <FONT FACE="times new roman" size=4 COLOR="black">reparacion de dispositivos electronicos, claro, siempre brindando el mejor servicio</FONT>
    </body>
</html>

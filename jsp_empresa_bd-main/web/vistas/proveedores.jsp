


<%@page import="modelo.Menu"%>
<%@page import="modelo.Proveedores"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
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
                            <%-- <a class="dropdown-item" href="puestos.jsp">Puestos</a>
                            <a class="dropdown-item" href="empleados.jsp">Empleados</a>
                            <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                            <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="marcas.jsp">Marcas</a>
                            <a class="dropdown-item" href="productos.jsp">Productos</a>
                            <a class="dropdown-item" href="ventas.jsp">Ventas</a>
                            <a class="dropdown-item" href="compras.jsp">Compras</a> --%>
                            
                            <%
                                Menu menu = new Menu();
                                HashMap<String, String> dr = menu.drop();
                                for (String i : dr.keySet()) {
                                    out.println("<a class='dropdown-item' href='" + i + ".jsp'>" + i.toUpperCase() + "</a>");
                                }
                            %>
                            
                        </div>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="container">
            <h1>Formulario Proveedores</h1>

            <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo</button>
            <a class="btn btn-danger " href="compras.jsp">Ingresar Compra</a> 

            <div class="modal fade" id="modal_proveedor" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="../sr_proveedores" method="post" class="form-group">
                                <label for="lbl_id" ><b>ID</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                                <label for="lbl_codigo" ><b>Proveedor</b></label>
                                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="proveedor1"  required>

                                <label for="lbl_nombres" ><b>NIT</b></label>
                                <input type="text" name="txt_NIT" id="txt_NIT" class="form-control" placeholder="123" required>

                                <label for="lbl_direccion" ><b>Direccion</b></label>
                                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>

                                <label for="lbl_telefono" ><b>Telefono</b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>

                                <br>
                                <div class="row">
                                    <div class="col-md-3">
                                        <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary ">Agregar</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success ">Modificar</button>
                                    </div>

                                    <div class="col-md-3">
                                        <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger " onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                    return false" >Eliminar</button>                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>






            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th>Proveedor</th>
                        <th>NIT</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                    </tr>
                </thead>
                <tbody id="tbl_proveedors">
                    <%
                        Proveedores proveedor = new Proveedores();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = proveedor.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
                                    function limpiar() {
                                        $("#txt_id").val(0);
                                        $("#txt_proveedor").val('');
                                        $("#txt_NIT").val('');
                                        $("#txt_direccion").val('');
                                        $("#txt_telefono").val('');
                                    }

                                    $('#tbl_proveedors').on('click', 'tr td', function (evt) {
                                        var target, id, proveedor, NIT, direccion, telefono;
                                        target = $(event.target);
                                        id = target.parent().data('id');

                                        proveedor = target.parent("tr").find("td").eq(0).html();
                                        NIT = target.parent("tr").find("td").eq(1).html();

                                        direccion = target.parent("tr").find("td").eq(2).html();
                                        telefono = target.parent("tr").find("td").eq(3).html();
                                        $("#txt_id").val(id);
                                        $("#txt_proveedor").val(proveedor);
                                        $("#txt_NIT").val(NIT);
                                        $("#txt_direccion").val(direccion);
                                        $("#txt_telefono").val(telefono);

                                        $("#modal_proveedor").modal('show');
                                    });

        </script>
    </body>
</html>



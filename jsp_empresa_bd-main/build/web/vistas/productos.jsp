<%@page import="modelo.Producto"%>
<%@page import="modelo.Marca"%>
<%@page import="modelo.Clientes"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
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
                            <a class="dropdown-item" href="puestos.jsp">Puestos</a>                            
                            <a class="dropdown-item" href="empleados.jsp">Empleados</a>
                            <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                            <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="marcas.jsp">Marcas</a>
                            <a class="dropdown-item" href="productos.jsp">Productos</a>
                            <a class="dropdown-item" href="ventas.jsp">Ventas</a>
                            <a class="dropdown-item" href="compras.jsp">Compras</a>

                        </div>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="container">
            <h1>Formulario Productos</h1>

            <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo</button>

            <a class="btn btn-warning btn-block" href="marcas.jsp">Ingresar Marca</a>
            <div class="modal fade" id="modal_producto" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="../sr_productos" method="post" class="form-group">

                                <div class="row">
                                    <div class="col">
                                        <label for="lbl_id" ><b>ID</b></label>
                                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 

                                    </div>
                                    <div class="col">
                                        <label for="lbl_nombres" ><b>Producto</b></label>
                                        <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Producto1" required>

                                    </div>
                                    <div class="col">
                                        <label for="lbl_marca" ><b>Marca</b></label>
                                        <select name="drop_marca" id="drop_marca" class="form-select">
                                            <%
                                                Marca marca = new Marca();
                                                HashMap<String, String> drop = marca.drop();
                                                for (String i : drop.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                                }


                                            %>
                                        </select>
                                    </div>
                                </div>






                                <label for="lbl_apellidos" ><b>Descripcion</b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripcion.." required>

                                <label for="lbl_direccion" ><b>Imagen</b></label>
                                <input type="text"  name="txt_img" id="txt_img" class="form-control" placeholder="imagen.." required>



                                <label for="lbl_telefono" ><b>Precio Costo</b></label>
                                <input type="number" name="txt_costo" id="txt_costo" class="form-control" placeholder="100" required>

                                <label for="lbl_email" ><b>Precio Venta</b></label>
                                <input type="number" name="txt_venta" id="txt_venta" class="form-control" placeholder="200" required>


                                <label for="lbl_fn" ><b>Existencia</b></label>
                                <input type="number"  name="txt_existencia" id="txt_existencia" class="form-control" >

                                <label for="lbl_fn" ><b>Ingreso</b></label>
                                <input type="date"  name="txt_ingreso" id="txt_ingreso" class="form-control" >


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

                        <th>Producto</th>
                        <th>Marca</th>
                        <th>Descripcion</th>
                        <th>Imagen</th>
                        <th>Costo(Q)</th>
                        <th>Venta(Q)</th>
                        <th>Existencia</th>
                        <th>Ingreso</th>

                    </tr>
                </thead>
                <tbody id="tbl_productos">
                    <%                        Producto producto = new Producto();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = producto.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 9) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td> <img src='" + tabla.getValueAt(t, 4) + "' width='300' height='100'> </td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
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
                                        $("#txt_producto").val('');
                                        $("#drop_marca").val(1);
                                        $("#txt_descripcion").val('');
                                        $("#txt_img").val('');
                                        $("#txt_costo").val('');
                                        $("#txt_venta").val('');
                                        $("#txt_existencia").val('');
                                        $("#txt_ingreso").val('');
                                    }

                                    $('#tbl_productos').on('click', 'tr td', function (evt) {
                                        var target, id, producto, marca, descripcion, imagen, costo, venta, existencia, ingreso;
                                        target = $(event.target);
                                        id = target.parent().data('id');

                                        producto = target.parent("tr").find("td").eq(0).html();
                                        marca = target.parent().data('id_p');
                                        descripcion = target.parent("tr").find("td").eq(2).html();
                                        imagen = target.parent("tr").find("td").eq(3).html();
                                        costo = target.parent("tr").find("td").eq(4).html();
                                        venta = target.parent("tr").find("td").eq(5).html();
                                        existencia = target.parent("tr").find("td").eq(6).html();
                                        ingreso = target.parent("tr").find("td").eq(7).html();

                                        $("#txt_id").val(id);
                                        $("#txt_producto").val(producto);
                                        $("#drop_marca").val(marca);
                                        $("#txt_descripcion").val(descripcion);
                                        $("#txt_img").val(imagen);
                                        $("#txt_costo").val(costo);
                                        $("#txt_venta").val(venta);
                                        $("#txt_existencia").val(existencia);
                                        $("#txt_ingreso").val(ingreso);

                                        $("#modal_producto").modal('show');
                                    });

        </script>
    </body>
</html>



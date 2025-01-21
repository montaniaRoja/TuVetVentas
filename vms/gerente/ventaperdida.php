<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');


check_login();
if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal = $_SESSION['sucursal'];
    //$sucursalList = implode(",", $sucursal);


    $detalledeventas = pg_query($db, "SELECT DISTINCT
    vp.fecha,
    pr.prod_preciopublico,
    vp.sucursal,
    s.sucursal_nombre,
    vp.codigoprod,
    vp.nombreprod,
    pr.id_marca,
    m.marca_nombre,
    vp.cantidad,
    vp.usuario,
    vp.notas,
    vp.accion_tomada,
	r.ptoreorden   
FROM
    ventaperdida vp
LEFT JOIN productos pr ON vp.codigoprod = pr.prod_codbarra
LEFT JOIN marcas m ON pr.id_marca = m.id
LEFT JOIN sucursales s ON vp.sucursal = s.id
LEFT JOIN puntosdereorden r on r.codbarra=vp.codigoprod and vp.sucursal=r.id_sucursal	
WHERE vp.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
AND vp.sucursal = '$sucursal'
ORDER BY vp.fecha;");



    if (!$detalledeventas) {
        die("Error en la consulta: " . pg_last_error($db));
    }
}



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Reporte Venta Perdida</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />


</head>

<body>
    <script src="js/seleccion.js"></script>
    <div id="app">
        <?php include('include/sidebar.php'); ?>
        <div class="app-content">
            <?php include('include/header.php'); ?>
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Reporte Venta Perdida</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span></span>
                                </li>
                                <li class="active">
                                    <span>No Hay</span>
                                </li>
                            </ol>
                        </div>
                    </section>
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="row margin-top-30">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="panel panel-white">
                                            <div class="panel-heading">
                                                <h5 class="over-title margin-bottom-15"><span class="text-bold">Reporte Venta Perdida</span></h5>


                                                <form role="form" name="marcas" method="post" action="" onsubmit="return setFormAction();">



                                                    <div class="form-group">
                                                        <label for="fechainicial">
                                                            Desde

                                                            <input type="date" id="fechainicial" name="fechainicial" class="form-control" autocomplete="off"></label>
                                                        <label for="fechafinal">

                                                            <input type="date" id="fechafinal" name="fechafinal" class="form-control" autocomplete="off"></label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputData">
                                                            Seleccione Salida

                                                            <select name="select" id="select" class="form-control">
                                                                <option value="1">Excel</option>
                                                                <option value="2" selected>Pantalla</option>

                                                            </select></label>
                                                    </div>

                                                    <button type="submit" name="submit" class="btn btn-o btn-primary">
                                                        Procesar
                                                    </button>

                                                </form>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>

                                <table id="example" class="display" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Nombre Producto</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                            <th>Reorden</th>
                                            <th>Usuario</th>
                                            <th>Notas</th>
                                            <th>Revision</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $cnt = 1;
                                        $sumaPrecio = 0;
                                        while ($row = pg_fetch_object($detalledeventas)) {
                                            $sumaPrecio += $row->prod_preciopublico;
                                        ?>
                                            <tr>
                                                <td><?php echo $row->fecha; ?></td>
                                                <td><?php echo $row->nombreprod; ?></td>
                                                <td><?php echo $row->cantidad; ?></td>
                                                <td><?php echo $row->prod_preciopublico; ?></td>
                                                <td><?php echo $row->ptoreorden; ?></td>
                                                <td><?php echo $row->usuario; ?></td>
                                                <td><?php echo $row->notas; ?></td>
                                                <td><?php echo $row->accion_tomada; ?></td>
                                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" 
                                                data-codigo="<?php echo $row->codigoprod; ?>"
                                                data-sucursal="<?php echo $sucursal; ?>"
                                                data-fecha="<?php echo $row->fecha; ?>">Accion</button></td>

                                            </tr>
                                        <?php
                                            $cnt = $cnt + 1;
                                        }
                                        ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Linea de Totales</td>
                                            <td></td>
                                            <td><?php echo "$ " . $sumaPrecio ?></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>

                                    </tfoot>


                                </table>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Accion tomada sobre el codigo</h5>
                        <div id="codproducto"></div>
                        
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="myForm">
                            <div class="form-group">
                                <label for="select01">Accion</label>
                                <select class="form-control" id="select01" name="select01">
                                    <option selected>Escoja opcion...</option>
                                    <option value="Se cambio punto de reorden">Se Cambio Punto de Reorden</option>
                                    <option value="Se reporto a CD, no hay codigo">Se reporto a CD, no hay Codigo</option>
                                    <option value="Se reporto a CD, No hay existencias">Se reporto a CD, No hay existencias</option>
                                    <option value="Producto Agotado">Producto agotado desde el proveedor</option>
                                    
                                </select>
                                <input type="hidden" id="modalcodigo" name="modalcodigo">
                                <input type="hidden" id="modalsucursal" name="modalsucursal">
                                <input type="hidden" id="modalfecha" name="modalfecha">
                            </div>

                            <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- start: FOOTER -->
    <?php include('include/footer.php'); ?>
    <!-- end: FOOTER -->

    <!-- start: SETTINGS -->
    <?php include('include/setting.php'); ?>

    <!-- end: SETTINGS -->

    <!-- start: MAIN JAVASCRIPTS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="vendor/autosize/autosize.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CLIP-TWO JAVASCRIPTS -->
    <script src="assets/js/main.js"></script>
    <!-- start: JavaScript Event Handlers for this page -->
    <script src="assets/js/form-elements.js"></script>
    <script>
        function setFormAction() {
            var selectedOption = document.getElementById('select').value;

            if (selectedOption == 1) {
                document.forms['marcas'].action = 'ventaperdida_excel.php';
            } else if (selectedOption == 2) {
                document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
            }

            return true;
        }
    </script>


    <script type="text/javascript">
        new DataTable('#example');
    </script>
    <script>
        jQuery(document).ready(function() {
            Main.init();
            FormElements.init();
        });
    </script>

<script>
        $(document).ready(function() {
            $('#exampleModalCenter').on('show.bs.modal', function(event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var codigo = button.data('codigo'); // Extract info from data-* attributes
                var sucursal = button.data('sucursal');
                var fecha = button.data('fecha');
                console.log(codigo, sucursal, fecha);
                $('#codproducto').text(codigo);
                $('#modalcodigo').val(codigo);
                $('#modalfecha').val(fecha);
                $('#modalsucursal').val(sucursal);
            });

            $('#myForm').on('submit', function(event) {
                event.preventDefault(); // Evita el refresco de la página

                $.ajax({
                    type: 'POST',
                    url: 'actualizar_venta_perdida.php', 
                    data: $(this).serialize(), 
                    success: function(response) {
                        // Maneja la respuesta del servidor
                        alert('Datos guardados exitosamente');
                        $('#exampleModalCenter').modal('hide'); // Cierra el modal
                        $('#myForm')[0].reset(); // Limpia los campos del formulario
                    },
                    error: function(xhr, status, error) {
                        // Maneja los errores
                        alert('Ocurrió un error: ' + error);
                    }
                });
            });
        });
    </script>

    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
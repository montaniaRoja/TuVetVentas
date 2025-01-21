<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}


if (isset($_POST['submit'])) {
    $sucursal = $_REQUEST['sucursal'];
    $fecha = $_REQUEST['fecha'];
    $fecha_formateada = date('Y-m-d', strtotime($fecha));

    // Ahora puedes usar $fecha_formateada en tu consulta
    $cierre = pg_query($db, "SELECT cobrada_por, fecha_cobro, SUM(pago_efectivo) as efectivo, SUM(pago_tarjeta) as tarjeta, SUM(pago_credito) as credito,
                        SUM(pago_puntos) as puntos
                        FROM hfacturas WHERE fecha_cobro = '$fecha_formateada' and pagada_sn=1 and anulada=0 and id_sucursal='$sucursal'
                        GROUP BY fecha_cobro, cobrada_por");
}

if (isset($_POST['imprimir'])) {
    $fechaImprimir = $_REQUEST['fecha'];
    $sucursal = $_REQUEST['sucursal'];
    $url = "imprimir_cierre_ventas.php?fecha=$fechaImprimir&sucursal=$sucursal";
    header("Location: $url");
    exit();
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Cierre de Ventas</title>
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
                                <h1 class="mainTitle">Ventas del dia</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span></span>
                                </li>
                                <li class="active">
                                    <span>Cobrar</span>
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
                                                <h5 class="over-title margin-bottom-15"><span class="text-bold">Ventas del Dia</span></h5>


                                                <form id="formulario" role="form" name="marcas" method="post">
                                                    <div class="form-group">

                                                        <select name="sucursal" id="sucursal" class="form-control">
                                                            <option value="" disabled selected>Seleccione sucursal</option>
                                                            <?php
                                                            $codigoCd = 7;
                                                            $query2 = "SELECT id, sucursal_nombre FROM sucursales where id!='$codigoCd' ORDER BY sucursal_nombre";
                                                            $consulta = pg_query($db, $query2);

                                                            while ($obj1 = pg_fetch_object($consulta)) {

                                                            ?>
                                                                <option value="<?php echo $obj1->id ?>" <?php echo $selected ?>>
                                                                    <?php echo $obj1->sucursal_nombre; ?>
                                                                </option>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="date" name="fecha" id="fecha" class="form-control" autocomplete="off" required value="<?php echo date('Y-m-d'); ?>"><br>
                                                    </div>
                                                    <button type="submit" name="submit" class="btn btn-o btn-primary">
                                                        Ver
                                                    </button>

                                                    <button type="submit" name="imprimir" class="btn btn-o btn-primary">
                                                        PDF
                                                    </button>
                                            </div>

                                            </form>

                                            <script>
                                                $(document).ready(function() {
                                                    <?php if (isset($_POST['submit'])) : ?>
                                                        $('#kardexModal').modal('show');
                                                    <?php endif; ?>
                                                });
                                            </script>

                                            <div class="modal fade" id="kardexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">


                                                <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Ventas del dia por usuario</h5>
                                                            <?php echo $fecha; ?>

                                                        </div>
                                                        <div class="modal-body">
                                                            <table id="example" class="display" style="width:100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Cobrador</th>
                                                                        <th>Fecha</th>
                                                                        <th>Efectivo</th>
                                                                        <th>Tarjeta</th>
                                                                        <th>Puntos</th>
                                                                        <th>Credito</th>
                                                                        <th>TOTAL</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <?php
                                                                    $total_efectivo = 0;
                                                                    $total_tarjeta = 0;
                                                                    $total_credito = 0;
                                                                    $total_puntos = 0;
                                                                    $total_general = 0;

                                                                    while ($row = pg_fetch_object($cierre)) {
                                                                    ?>
                                                                        <tr>
                                                                            <td><?php echo $row->cobrada_por; ?></td>
                                                                            <td><?php echo $row->fecha_cobro; ?></td>
                                                                            <td><?php echo number_format($row->efectivo, 2, '.', ','); ?></td>
                                                                            <td><?php echo number_format($row->tarjeta, 2, '.', ','); ?></td>
                                                                            <td><?php echo number_format($row->puntos, 2, '.', ','); ?></td>
                                                                            <td><?php echo number_format($row->credito, 2, '.', ','); ?></td>
                                                                            <td><?php echo number_format($row->credito + $row->efectivo + $row->tarjeta + $row->puntos, 2, '.', ','); ?></td>
                                                                        </tr>
                                                                    <?php
                                                                        // Calcula los totales
                                                                        $total_efectivo += $row->efectivo;
                                                                        $total_tarjeta += $row->tarjeta;
                                                                        $total_credito += $row->credito;
                                                                        $total_puntos += $row->puntos;
                                                                        $total_general += $row->credito + $row->efectivo + $row->tarjeta + $row->puntos;
                                                                    }
                                                                    ?>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <td colspan="2">Total</td>
                                                                        <td><?php echo number_format($total_efectivo, 2, '.', ','); ?></td>
                                                                        <td><?php echo number_format($total_tarjeta, 2, '.', ','); ?></td>
                                                                        <td><?php echo number_format($total_puntos, 2, '.', ','); ?></td>
                                                                        <td><?php echo number_format($total_credito, 2, '.', ','); ?></td>
                                                                        <td><?php echo number_format($total_general, 2, '.', ','); ?></td>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>


                                                        </div>


                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location();">Cerrar</button>


                                                        </div>





                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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



    <script type="text/javascript">
        new DataTable('#example');
    </script>
    <script>
        jQuery(document).ready(function() {
            Main.init();
            FormElements.init();
        });
    </script>

    




    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
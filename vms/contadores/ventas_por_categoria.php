<?php


session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');


check_login();
if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal = $_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);


    $detalledeventas = pg_query($db, "select c.id as catid, s.id as sucursalid, s.sucursal_nombre, c.cat_nombre as categoria, sum(d.total_linea) as total from dfacturas d
    join productos p
    on d.cod_barra=p.prod_codbarra
    join categorias c
    on p.id_categorias=c.id
	join sucursales s on d.sucursal_id=s.id
    where d.fecha between '$fechaInicial' and '$fechaFinal'
	and d.sucursal_id IN($sucursalList)
    and d.validado_sn=1 and anulada_sn='0'
        group by c.cat_nombre, c.id, s.sucursal_nombre, s.id
        order by categoria;");
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Detalle de Ventas</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" />
    <link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
                                <h1 class="mainTitle">Detalle de Ventas por Categoria</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span></span>
                                </li>
                                <li class="active">
                                    <span></span>
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
                                                <h5 class="over-title margin-bottom-15"><span class="text-bold">Detalle de Ventas Por Categoria</span></h5>


                                                <form role="form" name="marcas" method="post" action="" onsubmit="return setFormAction();">

                                                    <div class="form-group">
                                                        <label for="sucursal">
                                                            Sucursal
                                                        </label>
                                                        <select name="sucursal[]" id="sucursal" class="form-control" multiple>
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

                                                        <br>
                                                        <button type="button" onclick="seleccionarTodas()">Seleccionar Todas</button>

                                                    </div>

                                                    <div class="form-group">
                                                        <label for="fechainicial">
                                                            Desde

                                                            <input type="date" name="fechainicial" id="fechainicial" class="form-control" autocomplete="off"></label>
                                                        <label>Hasta

                                                            <input type="date" name="fechafinal" id="fechafinal" class="form-control" autocomplete="off"></label>
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
                                            <th>Cat Id</th>
                                            <th>Categoria</th>
                                            <th>Sucursal</th>
                                            <th>Total Ventas</th>
                                            <th>Detalle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $cnt = 1;
                                        while ($row = pg_fetch_object($detalledeventas)) {

                                        ?>
                                            <tr>
                                                <td><?php echo $row->catid; ?></td>
                                                <td><?php echo $row->categoria; ?></td>
                                                <td><?php echo $row->sucursal_nombre; ?></td>
                                                <td><strong>$<?php echo number_format($row->total, 2); ?></strong></td>

                                                <td>



                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-codigo="<?php echo $row->catid; ?>" data-sucursal="<?php echo $row->sucursalid; ?>" data-inicial="<?php echo $fechaInicial; ?>" data-final="<?php echo $fechaFinal; ?>">Ver detalle</button>


                                                </td>
                                            </tr>
                                        <?php
                                            $cnt = $cnt + 1;
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </div>

    <<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detalle Producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalContent">


                </div>
                <div class="modal-footer">
                    <form action="detalle_cat_excel.php" method="post">
                        <input type="hidden" id="codcliente" name="codcliente">
                        <input type="hidden" id="inicial" name="inicial">
                        <input type="hidden" id="final" name="final">
                        <input type="hidden" id="modalsucursal" name="modalsucursal">
                        <button type="submit" name="btnExcel" class="btn btn-primary">Excel</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </form>
                </div>
            </div>
        </div>
        </div>

        <!-- start: FOOTER -->
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
                    document.forms['marcas'].action = 'por_cat_excel.php';
                } else if (selectedOption == 2) {
                    document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
                }

                return true;
            }
        </script>


        <script type="text/javascript">
            new DataTable('#example2');
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
            $('#exampleModal').on('show.bs.modal', function(event) {
                let button = $(event.relatedTarget);
                let codigo = button.data('codigo');
                let sucursal = button.data('sucursal');
                let fInicial = button.data('inicial');
                let fFinal = button.data('final');
                console.log(codigo, fInicial, fFinal);
                $.ajax({
                    type: 'POST',
                    url: 'cargar_detalle_categoria.php',
                    data: {
                        codigo: codigo,
                        fInicial: fInicial,
                        fFinal: fFinal,
                        sucursal: sucursal
                    },
                    success: function(response) {
                        console.log("respuesta ok");
                        $('#modalContent').html(response);
                        var codigoCliente = document.getElementById('codcliente');
                        var fechaInicial = document.getElementById('inicial');
                        var fechaFinal = document.getElementById('final');
                        var modalsucursal = document.getElementById('modalsucursal');
                        codigoCliente.value = codigo;
                        fechaInicial.value = fInicial;
                        fechaFinal.value = fFinal;
                        modalsucursal.value = sucursal;


                    },
                    error: function(xhr, status, error) {
                        console.error("Error al cargar los datos:", status, error);
                    }
                });
            });
        </script>



        <!-- end: JavaScript Event Handlers for this page -->
        <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
<?php


session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');


check_login();
if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    

    $detalledeventas = pg_query($db, "select c.id, c.cat_nombre, sum(d.total_linea) as total
from dfacturas d join productos p
on d.cod_barra=p.prod_codbarra
join categorias c
on p.id_categorias=c.id
where d.validado_sn=1 and d.anulada_sn=0
and d.fecha between '$fechaInicial' and '$fechaFinal'
group by c.cat_nombre, c.id
order by c,cat_nombre;");
} else {
    $fechaInicial = (new DateTime('tomorrow'))->format('Y-m-d');
    $fechaFinal = (new DateTime('tomorrow'))->format('Y-m-d');
    $sucursal = [0];
    $sucursalList = implode(",", $sucursal);
    $detalledeventas = pg_query($db, "SELECT h.id_sucursal, s.sucursal_nombre, d.cod_barra, p.prod_nombre, sum(d.cantidad) as cantidad,
    p.prod_preciopublico, sum(monto_costo) as costo, sum(iva) as iva, sum(monto_descuento) as descuento,
    sum(d.total_linea) as total
    FROM dfacturas d
    JOIN productos p ON d.cod_barra = p.prod_codbarra
    JOIN hfacturas h ON d.id_hfactura = h.id
    JOIN sucursales s ON h.id_sucursal = s.id
    WHERE d.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
    AND h.id_sucursal IN ($sucursalList)
    AND d.validado_sn=1
    GROUP BY d.cod_barra, p.prod_preciopublico, h.id_sucursal, s.sucursal_nombre, p.prod_nombre
    ORDER BY d.cod_barra;");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Consolidado de Ventas</title>
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
                                <h1 class="mainTitle">Consolidado de Ventas por Categoria</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
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
                                                <h5 class="over-title margin-bottom-15"><span class="text-bold">Detalle de Ventas</span></h5>


                                                <form role="form" name="categorias" method="post" action="" onsubmit="return setFormAction();">

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
                                            <th>Nombre Categoria</th>
                                            <th>Venta Total</th>
                                            <th>Desglose</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $cnt = 1;
                                        while ($row = pg_fetch_object($detalledeventas)) {

                                        ?>
                                            <tr>
                                                <td><?php echo $row->id; ?></td>
                                                <td><?php echo $row->cat_nombre; ?></td>
                                                <td><?php echo $row->total; ?></td>
                                                
                                                <td>



                                                    <button type="button" class="btn btn-primary"
                                                        data-toggle="modal" data-target="#exampleModal"
                                                        data-categoria="<?php echo $row->id; ?>"
                                                        data-inicial="<?php echo $fechaInicial; ?>"
                                                        data-final="<?php echo $fechaFinal; ?>"
                                                        >Sucursales</button>


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

    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detalle Por sucursal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalContent">


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

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
                document.forms['categorias'].action = 'por_sucursal_excel.php';
            } else if (selectedOption == 2) {
                document.forms['categorias'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
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
            var button = $(event.relatedTarget); // Button that triggered the modal
            var categoria = button.data('categoria'); // Extract info from data-* attributes
            var fInicial = button.data('inicial');
            var fFinal = button.data('final');
            
            
            $.ajax({
                type: 'POST',
                url: 'cargar_sucursales_modal.php',
                data: {
                    categoria: categoria,
                    fInicial: fInicial,
                    fFinal: fFinal,
                    
                },
                success: function(response) {
                    $('#modalContent').html(response);
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
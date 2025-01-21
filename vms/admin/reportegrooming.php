<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}

if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal = $_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);

    $consulta = "select s.id, s.hora_inicio, s.hora_cambio_status,l.sucursal_nombre, g.nombre_gromista, c.cliente_nombre, m.nombre_mascota, 
    r.nombre_raza, s.hora_inicio, s.hora_final, diferencia ,s.sesion_status, s.minutos_recepcion
from tbl_sesionesgrooming s
join tbl_gromistas g
on s.id_gromista=g.id
join clientes c
on s.id_cliente=c.id
join mascotas m
on s.id_mascota=m.id
	join sucursales l
	on g.sucursal_asignada=l.id
    join razas r
	on m.raza_id=r.id
WHERE s.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
and sesion_status='Completada'
AND g.sucursal_asignada IN ($sucursalList);";

    $query = pg_query($db, $consulta);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Fila de Mascotas</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">

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


    <script>



    </script>

</head>

<body class="bg-dark">

    <script src="js/funciones.js"></script>

    <div id="app">
        <?php include('include/sidebar.php'); ?>
        <div class="app-content">

            <?php include('include/header.php'); ?>

            <!-- end: TOP NAVBAR -->
            <div class="main-content bg-dark">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Fila de Mascotas</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span><?php echo $_SESSION['login'] ?></span>
                                </li>
                                <li class="active">
                                    <span><?php echo $_SESSION['sucursal'] ?></span>
                                </li>
                            </ol>
                        </div>
                    </section>
                    <!-- end: PAGE TITLE -->
                    <!-- start: BASIC EXAMPLE -->
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="row margin-top-30">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="panel panel-white">
                                            <div class="panel-heading">
                                                <h5 class="over-title margin-bottom-15"><span class="text-bold">Detalle de Ventas</span></h5>


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

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h5 class="over-title margin-bottom-15"> <span class="text-bold">Peluqueria</span></h5>

                            <table id="example" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="center">#</th>                                        
                                        <th>Sucursal</th>
                                        <th>Nombre Gromista</th>
                                        <th>Nombre del Cliente</th>
                                        <th>Nombre Mascota</th>
                                        <th>Raza</th>
                                        <th>Hora Recepcion</th>
                                        <th>Hora Inicio</th>
                                        <th>Hora Final</th>
                                        <th>Tiempo Espera</th>
                                        <th>Duracion del Servicio</th>
                                        <th>Tiempo Total</th>
                                        <th>Detalle de Servicios</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                    $cnt = 1;
                                    while ($row = pg_fetch_object($query)) {
                                    ?>

                                        <tr>
                                            <td class="center"><?php echo $row->id; ?></td>                                            
                                            <td><?php echo $row->sucursal_nombre; ?></td>
                                            <td><?php echo $row->nombre_gromista; ?></td>
                                            <td><?php echo $row->cliente_nombre; ?></td>
                                            <td><?php echo $row->nombre_mascota; ?></td>
                                            <td><?php echo $row->nombre_raza; ?></td>
                                            <td><?php echo $row->hora_inicio; ?></td>
                                            <td><?php echo $row->hora_cambio_status; ?></td>
                                            <td><?php echo $row->hora_final; ?></td>
                                            <td><?php echo $row->minutos_recepcion; ?></td>
                                            <td><?php echo $row->diferencia - $row->minutos_recepcion; ?></td>
                                            <td><?php echo $row->diferencia; ?></td>
                                            <td><button type="button" class="btn btn-primary" data-toggle="modal"
                                                    data-target="#detalleServiciosModal"
                                                    data-sesionid="<?php echo $row->id; ?>"
                                                    data-nombremascota="<?php echo $row->nombre_mascota; ?>">Detalle</button></td>

                                        </tr>
 
                                    <?php
                                        $cnt = $cnt + 1;
                                    } ?>


                                </tbody>

                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="detalleServiciosModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Detalle de Servicios</h5>
                        <div id="mascota"></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="bodycontent">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: BASIC EXAMPLE -->
        <!-- end: SELECT BOXES -->

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
        jQuery(document).ready(function() {
            Main.init();
            FormElements.init();
        });
    </script>

    <script>
        function setFormAction() {
            var selectedOption = document.getElementById('select').value;

            if (selectedOption == 1) {
                document.forms['marcas'].action = 'gromistas_excel.php';
            } else if (selectedOption == 2) {
                document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
            }

            return true;
        }
    </script>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            // Este código se ejecutará cuando el DOM esté completamente cargado
            new DataTable('#example');
        });
    </script>

    <script>
        $('#detalleServiciosModal').on('show.bs.modal', function(event) {
            let button = $(event.relatedTarget);
            let sesionid = button.data('sesionid');
            let nombremascota = button.data('nombremascota');
            document.getElementById('mascota').innerHTML = nombremascota;
            console.log(sesionid, nombremascota);
            $.ajax({
                type: 'POST',
                url: 'cargar_detalle_servicios.php',
                data: {
                    sesionid: sesionid,
                    nombremascota: nombremascota

                },
                success: function(response) {
                    console.log("respuesta ok");
                    $('#bodycontent').html(response);
                    //var codigoCliente=document.getElementById('codcliente');

                    //codigoCliente.value=codigo;



                },
                error: function(xhr, status, error) {
                    console.error("Error al cargar los datos:", status, error);
                }
            });
        });
    </script>
    <script src="js/seleccion.js"></script>

    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->

</body>

</html>
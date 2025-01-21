<?php
session_start();
// Mostrar errores solo en desarrollo, comentar esta línea en producción
error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['guardar'])) {
    if (isset($_POST['codigonohay'], $_POST['sucursal'], $_POST['desc'])) {
        $codigo = $_POST['codigonohay'];
        $sucursal = $_POST['sucursal'];
        $porcDescuento = floatval($_POST['desc']) / 100;

        // Construir la consulta dinámicamente
        $placeholders = array();
        $values = array($porcDescuento);
        $index = 2;

        foreach ($sucursal as $id) {
            $placeholders[] = '$' . $index;
            $values[] = $id;
            $index++;
        }

        $sucursalPlaceholders = implode(',', $placeholders);
        $actualizar = "UPDATE existencias SET porc_descuento=$1 WHERE id_sucursal IN($sucursalPlaceholders) AND codbarra=$" . $index;
        $values[] = $codigo;

        $result = pg_query_params($db, $actualizar, $values);

        if ($result) {
            $_SESSION['message'] = 'Datos actualizados exitosamente.';
            $_SESSION['message_type'] = 'success';
        } else {
            $_SESSION['message'] = 'Error al actualizar los datos.';
            $_SESSION['message_type'] = 'error';
        }
    } else {
        $_SESSION['message'] = 'Faltan datos necesarios.';
        $_SESSION['message_type'] = 'error';
    }
    
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Descuentos</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

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
    <link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

</head>

<body>
    <div id="app">
        <?php include('include/sidebar.php'); ?>
        <div class="app-content">

            <?php include('include/header.php'); ?>

            <!-- end: TOP NAVBAR -->
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Descuentos por Sucursal</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span><?php echo $_SESSION['login'] ?></span>
                                </li>
                                <li class="active">
                                    <span>Descuentos</span>
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
                                                <h5 class="panel-title">Descuentos por Sucursal</h5>
                                            </div>
                                            <div class="panel-body">
                                                <p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
                                                    <?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
                                                <form role="form" name="marcas" method="post" action="">
                                                    <div class="form-group">
                                                        <label for="codigonohay">Codigo del Producto</label>
                                                        <input id="codigonohay" type="text" name="codigonohay" class="form-control" autocomplete="off" placeholder="Ingrese el codigo del producto">
                                                        <ul id="codigosnohay"></ul>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombrenohay">Nombre del Producto</label>
                                                        <input id="nombrenohay" type="text" name="nombrenohay" class="form-control" autocomplete="off" placeholder="Nombre del Producto">

                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sucursal">
                                                            Sucursal
                                                        </label>
                                                        <select name="sucursal[]" id="sucursal" class="form-control" multiple>
                                                            <option value="" disabled selected>Seleccione sucursal</option>
                                                            <?php
                                                            $query2 = "SELECT id, sucursal_nombre FROM sucursales ORDER BY sucursal_nombre";
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
                                                        <label for="inputData">Porc. Descuento como entero
                                                            <input type="number" name="desc" class="form-control" min="0" value="0"></label>

                                                    </div>
                                                    <button id="submit" type="submit" name="guardar" class="btn btn-o btn-primary">
                                                        Guardar
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="panel panel-white">


                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!-- end: BASIC EXAMPLE -->
            <!-- end: SELECT BOXES -->

        </div>
    </div>
    </div>
    <!-- start: FOOTER -->
    <?php include('include/footer.php'); ?>
    <!-- end: FOOTER -->

    <!-- start: SETTINGS -->
    <?php include('include/setting.php'); ?>

    <!-- end: SETTINGS -->
    </div>
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
    <script src="js/ventaperdida.js"></script>
    <script>
        // Inicializar la DataTable
        new DataTable('#example');

        // jQuery document ready function
        jQuery(document).ready(function() {
            Main.init();
            FormElements.init();
        });

        // Función para seleccionar todas las opciones de un select con id "sucursal"
        function seleccionarTodas() {
            console.log("evento click disparado");
            $("#sucursal option").prop("selected", true);
        }
    </script>

    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
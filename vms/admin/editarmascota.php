<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();


$id = intval($_GET['id']); // get value
$fecha_actual = date("Y-m-d");
if (isset($_POST['submit'])) {
    // $marca=$_POST['marca'];
    $pais = $_POST['pais'];
    //  $proveedor=$_POST['proveedor'];


    $query = ("update marcas set marca_paisorigen='$pais',proveedor_id='$_REQUEST[proveedor]',modificada_por='$_SESSION[login]', fecha_modificacion='$fecha_actual' where id='$id'");
    $query = pg_query($db, $query);

    $_SESSION['msg'] = "Datos de marca actualizados !!";
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Editar Marcas</title>

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

            <!-- end: TOP NAVBAR -->
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Admin | Editar Mascotas</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span><?php echo $_SESSION['login'] ?></span>
                                </li>
                                <li class="active">
                                    <span>Editar Marcas</span>
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
                                                <h5 class="panel-title">Editar Mascotas</h5>
                                            </div>
                                            <div class="panel-body">
                                                <p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
                                                    <?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
                                                    <form role="form" name="proveedores" method="post">
													<div class="form-group">
                                                    <?php

$id = intval($_GET['id']);
$sql = pg_query($db, "select * from mascotas where id=$id;");
while ($row = pg_fetch_object($sql)) {

    $mascotaId = $row->id;
    $nombreMascota=$row->nombre_mascota;
    
?> <input type="text" name="marca" class="form-control" disabled value="<?php echo $row->marca_nombre; ?>">
														<label for="inputData">
															Nombre de la Mascota
														</label>
														<input type="text" name="nombremascota" class="form-control" autocomplete="off" value="<?php echo $row->$nombreMascota; ?>">
													</div>

													<div class="form-group">
														<label for="inputData">
															Nombre del Propietario
														</label>
														<input type="text" name="nombreduenio" id="nombreduenio" class="form-control" autocomplete="off" placeholder="Ingrese nombre o No de id del Propietario" required>
														<ul id="lista"></ul>
													</div>


													<div class="form-group">

														<input type="hidden" name="idduenio" id="idduenio" class="form-control" autocomplete="off" placeholder="este campo es oculto">
													</div>


													<div class="form-group">
														<label for="inputData">
															Raza de la mascota

															<select name="raza" id="raza" class="form-control">
																<?php
																$query2 = "SELECT id, nombre_raza, nombre_especie FROM razas ORDER BY nombre_raza";
																$consulta = pg_query($db, $query2);
																while ($obj1 = pg_fetch_object($consulta)) { ?>
																	<option value="<?php echo $obj1->id . ',' . $obj1->nombre_especie; ?>" <?php if ($obj1->nombre_raza == 'Seleccione raza') {
																																				echo "selected";
																																			} ?>>
																		<?php echo   ' (' . $obj1->nombre_especie . ') ' . $obj1->nombre_raza; ?>
																	</option>
																<?php } ?>
															</select>
														</label>
														<label for="inputData">
															Edad de la mascota

															<input type="text" name="edadmascota" class="form-control" autocomplete="off" placeholder="Edad"></label>


													</div>

													<div class="form-group">
														<label for="select">
															Sexo Mascota

															<select name="genero" class="form-control">
																<option value="Femenino">Hembra</option>
																<option value="Masculino">Macho</option>
																<option value="" selected>Genero de la Mascota</option>
															</select></label>

														<label for="inputData">
															Pelaje

															<input type="text" name="pelajemascota" class="form-control" autocomplete="off" placeholder="tipo de pelaje"></label>
													</div>

													<div class="form-group">

														<label for="inputData">
															Tamaño

															<select name="size" class="form-control">
																<option value="Mini">Mini</option>
																<option value="Pequeño">Pequeño</option>
																<option value="Mediano">Mediano</option>
																<option value="Grande">Grande</option>
																<option value="Gigante">Gigante</option>
																<option value="" selected>tamaño de la Mascota</option>
															</select></label>
														<label for="inputData">
															Color

															<input type="text" name="colormascota" class="form-control" autocomplete="off" placeholder="color" required></label>


													</div>



													<div class="form-group">
														<label for="inputData">
															Estado Reproductivo

															<select name="reproductivo" class="form-control">
																<option value="Fertil">Fertil</option>
																<option value="Castrado">Castrado</option>
																<option value="Esterilizado">Esterilizado</option>
																<option value="" selected>estado reproductivo</option>
															</select></label>

														<label for="inputData">
															Chip

															<input type="text" name="chipmascota" class="form-control" autocomplete="off" placeholder="si, no, o numero de chip"></label>
													</div>


													<div class="form-group">
														<label for="inputData">
															Habitat

															<input type="text" name="habitatmascota" class="form-control" autocomplete="off" placeholder="Habitat" required></label>

														<label for="inputData">
															Dieta

															<input type="text" name="dietamascota" class="form-control" autocomplete="off" placeholder="" required></label>
													</div>
													<div class="form-group">
														<label for="inputData">
															Caracteristicas o señas particulares
														</label>
														<input type="text" name="caracteristicasmascota" class="form-control" autocomplete="off" placeholder="Señas particulares">
                                                        <?php } ?>
													</div>

													<button type="submit" name="submit" class="btn btn-o btn-primary">
														Submit
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
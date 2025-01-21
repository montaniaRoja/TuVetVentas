<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
	header("Location: logout.php");
	exit();
}

$fecha_actual = date("Y-m-d");

if (isset($_POST['marca'])) {
    $idMarca = $_POST['selectmarca'];
    $marcaList = implode(",", $idMarca);
    $idsucursal = $_POST['sucursal'];
    $sucursalList = implode(",", $idsucursal);
    $porcDescuento = (floatval($_REQUEST['desc'])) / 100;
    $modifica = $_SESSION['login'];
	
    // Construir la consulta SQL
    $query = "UPDATE existencias 
	SET porc_descuento = '$porcDescuento'
	WHERE codbarra IN (
    SELECT e.codbarra
    FROM existencias e
    INNER JOIN productos p ON e.codbarra = p.prod_codbarra
    INNER JOIN marcas m ON p.id_marca = m.id
    WHERE m.id IN ($marcaList)) and id_sucursal IN ($sucursalList);";

    // Imprimir la consulta SQL para depuración
    echo "Consulta SQL: $query<br>";
	
    $aplicarDescuento = pg_query($db, $query);

    if (!$aplicarDescuento) {
        $errorMsg = pg_last_error($db);
        echo "<script>alert('Error al procesar la información: $errorMsg');</script>";
    } else {
        echo "<script>alert('Descuentos Actualizados');</script>";
    }

    pg_close($db);
    echo "<script>window.location.href='calibrar_descuentos.php'</script>";
}


if (isset($_POST['setcat'])) {
	$idCategorias = $_REQUEST['selectcategoria'];
	$catList = implode(",", $idCategorias);
	$idsucursal = $_POST['sucursal'];
	$sucursalList = implode(",", $idsucursal);
	$porcDescuento = (floatval($_REQUEST['desc'])) / 100;
	$modifica = $_SESSION['login'];

	// Construir la consulta SQL
	$query = "UPDATE existencias
SET porc_descuento = '$porcDescuento'
WHERE codbarra IN (
    SELECT e.codbarra
    FROM existencias e
    INNER JOIN productos p ON e.codbarra = p.prod_codbarra
    INNER JOIN categorias c ON p.id_categorias = c.id
    WHERE c.id IN  ($catList)
) and id_sucursal in ($sucursalList);";

	// Imprimir la consulta SQL para depuración
	echo "Consulta SQL: $query<br>";

	$aplicarDescuento = pg_query($db, $query);

	if (!$aplicarDescuento) {
		$errorMsg = pg_last_error($db);
		echo "<script>alert('Error al procesar la información: $errorMsg');</script>";
	} else {
		echo "<script>alert('Descuentos Actualizados');</script>";
	}

	pg_close($db);
	echo "<script>window.location.href='calibrar_descuentos.php'</script>";
}

if (isset($_POST['ambos'])) {
	$idCategorias = $_REQUEST['selectcategoria'];
	$catList = implode(",", $idCategorias);
	$idMarca = $_REQUEST['selectmarca'];
	$marcaList = implode(",", $idMarca);
	$porcDescuento = (floatval($_REQUEST['desc'])) / 100;
	$modifica = $_SESSION['login'];
	$idsucursal = $_POST['sucursal'];
	$sucursalList = implode(",", $idsucursal);


	$aplicarDescuento = pg_query($db, "UPDATE existencias
	SET porc_descuento = '$porcDescuento'
	WHERE codbarra IN (
    SELECT e.codbarra
    FROM existencias e
    INNER JOIN productos p ON e.codbarra = p.prod_codbarra
    INNER JOIN categorias c ON p.id_categorias = c.id
    WHERE c.id IN ($catList)
    UNION
    SELECT e.codbarra
    FROM existencias e
    INNER JOIN productos p ON e.codbarra = p.prod_codbarra
    INNER JOIN marcas m ON p.id_marca = m.id
    WHERE m.id IN ($marcaList)) AND id_sucursal IN ($sucursalList);");

	if (!$aplicarDescuento) {
		echo "<script>alert('Error al procesar la información');</script>";
	} else {
		
		echo "<script>alert('Descuentos Actualizados');</script>";
	}

	pg_close($db);
	echo "<script>window.location.href='calibrar_descuentos.php'</script>";
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
	<!-- Bootstrap CSS -->

	<!-- Bootstrap Select CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.14/css/bootstrap-select.min.css">


</head>

<body>
	<script src="js/seleccion.js"></script>
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
								<h1 class="mainTitle">Configurar Descuentos</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Configurar Descuentos</span>
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
												<h5 class="panel-title">Configurar Descuentos</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" name="marcas" method="post">

													<div class="form-group">
														<label for="inputData">
															Marca
														</label><br>
														<select name="selectmarca[]" id="selectmarca" class="selectpicker form-control" multiple data-live-search="true">
															<?php
															$query2 = "SELECT id, marca_nombre FROM marcas order by marca_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) {   ?>


																<option value="<?php echo $obj1->id ?>"><?php echo $obj1->marca_nombre; ?></option>

															<?php } ?>
														</select>
													</div>

													<div class="form-group">
														<label for="categoria">
															Categoria
														</label><br>
														<select name="selectcategoria[]" id="categoria" class="selectpicker form-control" multiple data-live-search="true">
															<?php
															$query2 = "SELECT id, cat_nombre FROM categorias ORDER BY cat_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) {
															?>
																<option value="<?php echo $obj1->id ?>" <?php if ($obj1->prov_nombre == 'Seleccione Categoria') {
																											echo "selected";
																										} ?>><?php echo $obj1->cat_nombre; ?></option>
															<?php } ?>
														</select>

													</div>

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
														<label for="inputData">Porc. Descuento como entero
															<input type="number" name="desc" class="form-control" min="0" value="0"></label>

													</div>

													<button type="submit" name="marca" class="btn btn-o btn-primary" onclick="return confirm('¿se aplicara el descuento a todos los productos de esta marca?');">
														Por Marca
													</button>

													<button type="submit" name="setcat" class="btn btn-o btn-primary" onclick="return confirm('¿se aplicara el descuento a todos los productos de esta categoria?');">
														Por Categoria
													</button>
													<button type="submit" name="ambos" class="btn btn-o btn-primary" onclick="return confirm('¿se aplicara el descuento a todos los productos de esta categoria y marca?');">
														Ambos Criterios
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

						<div class="row">
							<div class="col-md-12">
								<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Productos</span></h5>



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
			$('.selectpicker').selectpicker();
		});
	</script>

	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap Select JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.14/js/bootstrap-select.min.js"></script>

</body>

</html>
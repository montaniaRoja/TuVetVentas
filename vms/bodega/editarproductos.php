<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
	header("Location: logout.php");
	exit();
}

$id = intval($_GET['id']); // get value
$fecha_actual = date("Y-m-d");
$obtenerNombreProducto = pg_query($db, "select * from productos where id='$id';");
while ($row = pg_fetch_object($obtenerNombreProducto)) {
	$nombreProducto = $row->prod_nombre;
}

if (isset($_POST['submit'])) {

	$determinarporcimpuesto = ("select * from impuestos where imp_id='$_REQUEST[impuestos]'");
	$determinarporcimpuesto = pg_query($db, $determinarporcimpuesto);
	if (!$determinarporcimpuesto) {
		echo "<script>alert('no se extrajo el porc de impuestos');</script>";
	}

	while ($row = pg_fetch_object($determinarporcimpuesto)) {
		$porcimpuesto = $row->imp_porc;
	}


	$sql01 = pg_query($db, "select * from productos where id='$id'");


	while ($row = pg_fetch_object($sql01)) {
		$barra = $row->prod_codbarra;
		$precio = $row->prod_preciopublico;
	}

	$nombre = $_POST['nombre'];
	$escalas = $_POST['escala'];
	$marca = $_POST['marca'];
	$categoria = $_POST['categoria'];
	$cminima = (int)$_POST['compraminima'];
	$dminima = (int)$_POST['distminima'];
	$uminima = (int)$_POST['minimoventa'];
	$ganancia = (floatval($_REQUEST['markup'])) / 100;
	//$descuento = (floatval($_REQUEST['descuento'])) / 100;
	$reorden = (int)$_REQUEST['reorden'];
	$impuestos = $_REQUEST['impuestos'];
	$unifraccion = (int)$_REQUEST['unifraccion'];  //$24
	$concentracion = (floatval($_REQUEST['contenido'])); //$25
	$contenido = $_REQUEST['contenido2']; //$26

	$nuevoPrecio = (floatval($_REQUEST['preciop']));
	$descUnidad = $nuevoPrecio * $descuento;
	$descprov = (floatval($_REQUEST['descproveedor'])) / 100;
	$psugerido = (floatval($_REQUEST['sugerido']));
	$precio_competencia = (floatval($_REQUEST['preciocompetencia']));
	$nombrecompetencia = $_REQUEST['nombrecompetencia'];


	if ($_REQUEST['cronico'] == "on") {
		$cronico = 1;
	} else {
		$cronico = 0;
	}


	if ($_REQUEST['activo'] == "on") {
		$activo = 1;
	} else {
		$activo = 0;
	}

	if ($_REQUEST['bodega'] == "on") {
		$bodega = 1;
	} else {
		$bodega = 0;
	}

	$modifico = $_SESSION['login'];
	//$contacto=$_POST['contacto'];




	$actualizar = "update productos set prod_nombre='$nombre', id_marca='$marca', id_categorias='$categoria', prod_compraminima='$cminima', prod_distminima='$dminima', 
	prod_ventaminima='$uminima', prod_markup='$ganancia', 
	descuento_unidad='$descUnidad', prod_preciopublico='$nuevoPrecio',
	activosn='$activo', escalas='$escalas', modificada_por='$modifico', 
	porcentaje_impuesto='$porcimpuesto', codigo_impuesto='$impuestos',
	fecha_modificacion='$fecha_actual', bodegasn='$bodega', unidad_fraccion='$unifraccion', concentracion='$concentracion', 
	contenido='$contenido', prov_descuento='$descprov', prov_preciosugerido='$psugerido', precio_competencia='$precio_competencia', 
	nombre_competencia='$nombrecompetencia', cronico_sn='$cronico' where id='$id'";
	$ejecutar = pg_query($db, $actualizar);

	if (!$ejecutar) {
		$error = pg_last_error($db);
		echo "<script>alert('Error al actualizar datos: " . $error . "');</script>";
	}

	//actualizar descuento en tabla existencias

	//$actualizar_descuento = pg_query($db, "update existencias set porc_descuento='$descuento' where codbarra='$barra'");


	$obtenerreordenanterior = "select ptoreorden from puntosdereorden where codbarra='$barra' and id_sucursal='$_SESSION[sucursal]'";
	$resultado = pg_query($db, $obtenerreordenanterior);

	if ($resultado) {
		$fila = pg_fetch_assoc($resultado);
		$puntoReorden = $fila['ptoreorden'];
	}



	$consulta01 = ("update puntosdereorden set ptoreorden='$reorden',modificadopor='$_SESSION[login]', fecha_modificacion='$fecha_actual'  where codbarra='$barra' and id_sucursal='$_SESSION[sucursal]'");
	$consulta01 = pg_query($db, $consulta01);


	if ($reorden != $puntoReorden) {
		$descripcion = "se modifico reorden al producto con codbarra: " . $barra . " de " . $puntoReorden . " a " . $reorden;
		$usuario = $_SESSION['login'];
		$sucmodifica = $_SESSION['sucursal'];

		$bitacora = "INSERT INTO bitacora (fecha, descripcion, usuario, sucursal_id, hora) VALUES ('$fecha_actual', '$descripcion', '$usuario', '$sucmodifica', CURRENT_TIME - INTERVAL '6 hours')";

		$guardarbitacora = pg_query($db, $bitacora);
		//echo $_SESSION['sucursal'];
	}





	//$_SESSION['msg']="Datos de producto actualizados !!";

	echo "<script>window.location.href='productos.php'</script>";
}

$consulta = "select i.nombre_ingrediente, c.concentracion, c.unidades from tbl_prodcomponentes c
join tbl_ingredientes i
on i.id=c.id_componente
	where id_producto='$id';";

$consultar = pg_query($db, $consulta);


?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Editar Productos</title>

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
	<link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css">
	<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

	<style>
		/* Estilos para el div de sugerencias */
		#lista {
			position: absolute;
			z-index: 9999;
			width: 100%;
			max-height: 200px;
			overflow-y: auto;
			background-color: #fff;
			border: 1px solid #ddd;
			border-radius: 4px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			padding: 4px;
		}

		/* Estilos para cada elemento de sugerencia */
		.suggest-element {
			cursor: pointer;
			padding: 4px 8px;
		}

		.suggest-element:hover {
			background-color: #f5f5f5;
		}
	</style>
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
								<h1 class="mainTitle">Admin | Editar Productos</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Editar Productos</span>
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
												<h5 class="panel-title">Editar Productos</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" name="dcotorspcl" method="post" enctype="multipart/form-data">
													<div class="form-group">
														<label for="exampleInputEmail1">
															Codigo
														</label>

														<?php
														$id = intval($_GET['id']);
														//echo $id;
														$sql = pg_query($db, "select * from productos where id='$id'");
														while ($row = pg_fetch_object($sql)) {	//comienza 1
															$marcaid = $row->id_marca;
															$catid = $row->id_categorias;
															$barra = $row->prod_codbarra;
															$impuesto = $row->codigo_impuesto;
															$esc = $row->escalas;
															$tipoalimento = $row->tipo_alimento;
															$content = $row->contenido;
															$sugerido = $row->prov_preciosugerido;
															$provdescuento = $row->prov_descuento;
															$preciocompt = $row->precio_competencia;
															$competencia = $row->nombre_competencia;
															$escronico = $row->cronico_sn;


															//echo "la marca es ".$marcaid

														?>
															<input type="text" name="codbarra" class="form-control" disabled value="<?php echo $row->prod_codbarra; ?>">

													</div>


													<div class="form-group">
														<label for="exampleInputEmail1">Nombre</label>
														<input type="text" name="nombre" autocomplete="off" class="form-control" value="<?php echo $row->prod_nombre; ?>">




													</div>

													<div class="form-group">



													<?php } //cierre 1
													?>

													</div>


													<div class="form-group">

														<label for="inputData">Marca</label><br>


														<select name="marca" id="marca" class="form-control">
															<?php
															$query2 = "SELECT id, marca_nombre FROM marcas order by marca_nombre ";
															$consulta = pg_query($db, $query2);

															while ($obj1 = pg_fetch_object($consulta)) {   ?>

																<option class="form-control" value="<?php echo $obj1->id ?> " <?php if ($marcaid == $obj1->id) {
																																	echo "selected";
																																} ?>><?php echo $obj1->marca_nombre; ?></option>

															<?php } ?>
														</select>



													</div>

													<!-- <div class="form-group"> 
															<label>
																Imagen del producto
															</label>
							<input id="imagen" type="file" name="imagen" >
														 </div> -->

													<div class="form-group">

														<label for="inputData">Categoria


															<select name="categoria" id="categoria" class="form-control">
																<?php
																$query2 = "SELECT id, cat_nombre FROM categorias order by cat_nombre ";
																$consulta = pg_query($db, $query2);

																while ($obj1 = pg_fetch_object($consulta)) {   ?>

																	<option class="form-control" value="<?php echo $obj1->id ?> " <?php if ($catid == $obj1->id) {
																																		echo "selected";
																																	} ?>><?php echo $obj1->cat_nombre; ?></option>

																<?php } ?>
															</select></label>
														<?php if ($escronico == 1) {; ?>

															<label>
																<input type="checkbox" id="cronico" name="cronico" checked="checked" disabled> Es Cronico</label>
														<?php } else {; ?>
															<label>
																<input type="checkbox" id="cronico" name="cronico" disabled> Es Cronico</label>

														<?php } ?>



													</div>
													<div class="form-group">
														<label for="exampleInputEmail1">Escalas</label>
														<input type="text" name="escala" autocomplete="off" class="form-control" value="<?php echo $esc; ?>">
													</div>

													<div class="form-group">
														<label for="tipoalimento">
															Tipo de Alimento
														</label>
														<select name="tipoalimento" class="form-control">
															<option value="<?php echo $tipoalimento; ?>" selected><?php echo $tipoalimento; ?></option>
															<option value="N/A">No Aplica</option>
															<option value="Seco">Seco</option>
															<option value="Humedo">Humedo</option>
														</select>
													</div>

													<div class="form-group">


														<div class="form-group">
															<label for="inputData">
																Impuestos
															</label><br>
															<select name="impuestos" id="impuestos">
																<?php
																$query2 = "SELECT imp_id,imp_nombre FROM impuestos order by imp_nombre";
																$consulta = pg_query($db, $query2);
																while ($obj1 = pg_fetch_object($consulta)) {   ?>


																	<option value="<?php echo $obj1->imp_id ?>" <?php if ($obj1->imp_id == $obj1) {
																													echo "selected";
																												} ?>><?php echo $obj1->imp_nombre; ?></option>

																<?php } ?>
															</select>
															<label><input type="checkbox" hidden="true" id="sumainv" name="sumainv" checked="checked"></label>
														</div>

														<?php

														//$id=intval($_GET['id']);
														//echo $id;
														$sql = pg_query($db, "select * from productos where id='$id'");
														while ($row = pg_fetch_object($sql)) { //comienza 2

														?>

															<div class="form-group">
																<label for="unifraccion">Unidad de Fraccionamiento
																	<input type="number" name="unifraccion" class="form-control" autocomplete="off" min="0" value="<?php echo (string)$row->unidad_fraccion; ?>"></label>


																<label for="contenido">Concentracion
																	<input type="number" name="contenido" class="form-control" autocomplete="off" min="0" value="<?php echo $row->concentracion; ?>" step="0.01"></label>
																<label for="contenido">Contenido

																	<select name="contenido2" class="form-control">
																		<option value="<?php echo (string)$row->contenido; ?>" selected><?php echo (string)$row->contenido; ?></option>
																		<option value="gramos">gramos</option>
																		<option value="Kilogramos">Kilogramos</option>
																		<option value="Libras">Libras</option>
																		<option value="Litros">Litros</option>
																		<option value="Onzas">Onzas</option>
																		<option value="ml">mililitros</option>
																	</select></label>
															</div>

															<div class="form-group">

																<label for="inputData">Compra Minima
																	<input type="number" name="compraminima" class="form-control" min="0" value="<?php echo (string)$row->prod_compraminima; ?>"></label>

																<label for="inputData">Distribucion Minima
																	<input type="number" name="distminima" class="form-control" min="0" value="<?php echo (string)$row->prod_distminima; ?>"></label>
															</div>


															<div class="form-group">
																<label for="inputData">Unidad Minima de Venta
																	<input type="number" name="minimoventa" class="form-control" min="0" value="<?php echo (string)$row->prod_ventaminima; ?>"></label>


																<?php
																$sucursal = $_SESSION['sucursal'];
																$cbarra = $row->prod_codbarra;

																?>
															<?php } //cierre 2
															?>


															<?php


															$sql = pg_query($db, "select ptoreorden from puntosdereorden where id_sucursal='$sucursal' and codbarra='$cbarra'");
															while ($row = pg_fetch_object($sql)) {

																//abre 3
															?>


																<label for="inputData">Punto de Reorden
																	<input type="number" name="reorden" class="form-control" min="0" value="<?php echo (string)$row->ptoreorden; ?>"></label>

															<?php } //cierra 3
															?>
															</div>


															<?php

															//$id=intval($_GET['id']);
															//echo $id;
															$sql = pg_query($db, "select * from productos where id='$id'");
															while ($row = pg_fetch_object($sql)) { //comienza 4

															?>

																<div class="form-group">


																	<label for="markup">Markup
																		<input type="number" id="markup" name="markup" class="form-control" min="0" value="<?php echo (string)$row->prod_markup * 100; ?>" step="0.001"></label>

																	<label for="descuento">Descuento al Cliente
																		<input type="number" id="descuento" name="descuento" class="form-control" min="0" value="<?php echo (string)$row->prod_porcdescuento * 100; ?>" step="0.001" readonly></label>





																</div>

																<div class="form-group">


																	<label for="costop">Costo del Producto
																		<input type="number" id="costop" name="costop" class="form-control" min="0" value="<?php echo (string)$row->prod_costopromedio; ?>" step="0.001" disabled>
																		<input type="hidden" id="costophidden" name="costophidden" class="form-control" min="0" value="<?php echo (string)$row->prod_costopromedio; ?>" step="0.001"></label>

																	<label for="preciop">Precio al Publico sin IVa
																		<input type="number" name="preciop" id="preciop" class="form-control" min="0" value="<?php echo (string)$row->prod_preciopublico; ?>" step="0.001"></label>

																</div>
																<div class="form-group">

																	<?php if ($row->activosn == 1) {; ?>

																		<label>
																			<input type="checkbox" id="activo" name="activo" checked="checked"> Activar/Desactivar Producto</label>
																	<?php } else {; ?>
																		<label>
																			<input type="checkbox" id="activo" name="activo"> Activar/Desactivar Producto</label>

																	<?php } ?>

																	<?php if ($row->bodegasn == 1) {; ?>

																		<label>
																			<input type="checkbox" id="bodega" name="bodega" checked="checked"> Producto es de bodega</label>
																	<?php } else {; ?>
																		<label>
																			<input type="checkbox" id="bodega" name="bodega"> Producto es de bodega</label>

																	<?php } ?>



																</div>


																<div class="form-group">


																<?php } //cierre 4
																?>
																</div>

																<div class="form-group">
																	<label for="inputData">Proveedor Descuento
																		<input type="number" name="descproveedor" class="form-control" autocomplete="off" min="0" value="<?php echo $provdescuento; ?>" step="0.001"></label>

																	<label for="inputData">Precio Sugerido
																		<input type="number" name="sugerido" class="form-control" autocomplete="off" min="0" value="<?php echo $sugerido ?>" step="0.001"></label>
																</div>

																<div class="form-group">

																	<label for="inputData">Precio mas bajo competencia
																		<input type="number" name="preciocompetencia" class="form-control" autocomplete="off" min="0" value="<?php echo $preciocompt; ?>" step="0.01"></label>

																	<label for="exampleInputEmail1">Nombre competencia
																		<input type="text" name="nombrecompetencia" autocomplete="off" class="form-control" value="<?php echo $competencia; ?>"></label>




																</div>




																<button type="submit" name="submit" class="btn btn-o btn-primary">
																	Actualizar
																</button>
												</form>


												<!-- Modal -->
												<div class="modal fade" id="ingredientesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
													<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle"></h5>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form>
																	<div class="form-group">
																		<label for="componente">Nombre del Componente</label>
																		<input type="text" class="form-control" id="componente" name="componente" placeholder="Componente" autocomplete="off">
																		<ul id="lista"></ul>
																	</div>

																	<div class="form-group">

																		<input type="hidden" class="form-control" id="idcomponente" name="idcomponente">
																		<input type="hidden" class="form-control" id="idproducto" name="idproducto">

																	</div>


																	<div class="form-group">
																		<label for="concentracion">Concentracion
																			<input type="number" class="form-control" id="concentracion" name="concentracion" min="0" step="0.01"></label>

																		<label for="unidad">Unidades
																			<select class="form-control" id="unidad" name="unidad">
																				<option value="Kilogramos">Kilogramos</option>
																				<option value="mililitros" selected>ml</option>
																				<option value="Libras">Libras</option>
																				<option value="mg/ml">miligramos / mililitro</option>
																				<option value="mg/g">miligramos / gramo</option>

																			</select></label>
																	</div>

																	<button type="button" name="agregarcomponente" class="btn btn-primary" onclick="llenarlista()">Agregar</button>
																</form>

															</div>
															<div class="modal-footer">
																<table id="example" class="display" style="width: 100%;">
																	<thead>
																		<tr>
																			<th>Id Componente</th>
																			<th>Nombre Componente</th>
																			<th>Id Producto</th>
																			<th>Concentracion</th>
																			<th>Unidades</th>

																		</tr>
																	</thead>
																	<tbody>

																	</tbody>

																</table><br>
																<div>
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary" onclick="guardarcomponentes()">Save changes</button>
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
							<div class="col-lg-12 col-md-12">
								<div class="panel panel-white">


								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Componentes</span></h5>
								<div class="form-group">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ingredientesModal" data-codigo="<?php echo $id; ?>" data-nombre="<?php echo $nombreProducto; ?>">Agregar</button>

								</div>
								<table id="componentes" class="display" style="width:100%">
									<thead>
										<tr>

											<th>Nombre</th>
											<th>Concentracion</th>
											<th>Unidades</th>
											<th>Acciones</th>

										</tr>
									</thead>
									<tbody>
										<?php

										while ($row = pg_fetch_object($consultar)) { ?>

											<tr>
												<td><?php echo $row->nombre_ingrediente; ?></td>
												<td><?php echo $row->concentracion; ?></td>
												<td><?php echo $row->unidades; ?></td>
												<td></td>




											</tr>

										<?php } ?>




									</tbody>

								</table>

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
	<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<!-- start: CLIP-TWO JAVASCRIPTS -->
	<script src="assets/js/main.js"></script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js"></script>
	<script src="./js/componentes.js"></script>
	<script>
		jQuery(document).ready(function() {
			Main.init();
			FormElements.init();
		});
	</script>
	<script>
		new DataTable('#componentes');
	</script>


	<script>
		// Obtener los elementos del DOM
		const markupInput = document.getElementById("markup");
		const costopInput = document.getElementById("costop");
		const costophiddenInput = document.getElementById("costophidden");
		const preciopInput = document.getElementById("preciop");

		// Escuchar cambios en el campo "markup"
		markupInput.addEventListener("input", function() {
			// Obtener el valor de "markup" como porcentaje
			const markupValue = parseFloat(markupInput.value) / 100;

			// Obtener el valor de "costophidden"
			const costophiddenValue = parseFloat(costophiddenInput.value);

			// Calcular el nuevo valor de "preciop"
			const newPreciopValue = costophiddenValue * (1 + markupValue);

			// Actualizar el campo "preciop"
			preciopInput.value = newPreciopValue.toFixed(2);



		});

		preciopInput.addEventListener("input", function() {
			// Obtener el valor de "precio" como porcentaje
			const precioValue = parseFloat(preciopInput.value);

			// Obtener el valor de "costophidden"
			const costophiddenValue = parseFloat(costophiddenInput.value);

			// Calcular el nuevo valor de "markup"
			const newMarkupValue = ((precioValue / costophiddenValue) - 1) * 100;

			// Actualizar el campo "markup"
			markupInput.value = newMarkupValue.toFixed(2);



		});
	</script>

	<script>
		$('#ingredientesModal').on('show.bs.modal', function(event) {


			var button = $(event.relatedTarget); // Button that triggered the modal
			var codigo = button.data('codigo'); // Extract info from data-* attributes
			var nombre = button.data('nombre');
			document.getElementById('exampleModalLongTitle').innerHTML = "Agregar Componentes a " + nombre;
			console.log(codigo, nombre);
			document.getElementById('idproducto').value = codigo;

			document.getElementById("componente").addEventListener("keyup", getComponente)

			function getComponente() {
				console.log('buscando componentes');
				let inputCP = document.getElementById("componente").value

				let lista = document.getElementById("lista")

				if (inputCP.length > 0) {

					let url = "include/getComponente.php"
					let formData = new FormData()
					formData.append("key", inputCP)

					fetch(url, {
							method: "POST",
							body: formData,
							mode: "cors" //Default cors, no-cors, same-origin
						}).then(response => response.json())
						.then(data => {
							lista.style.display = 'block'
							lista.innerHTML = data
						})
						.catch(err => console.log(err))
				} else {
					lista.style.display = 'none'
				}
			}

		});

		function mostrar(cliente_nombre, id_cliente) {
			lista.style.display = 'none'
			// alert("CP: " + cp)
			document.getElementById("componente").value = cliente_nombre;
			document.getElementById("idcomponente").value = id_cliente;

		}
	</script>
	<script>
		var select = document.getElementById("categoria");
		var selectedText = select.options[select.selectedIndex].text;
		if (selectedText === 'Medicamentos') {
			console.log('Medicamentos');
			var cronico = document.getElementById('cronico');
			cronico.disabled = false;
		}
	</script>

	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
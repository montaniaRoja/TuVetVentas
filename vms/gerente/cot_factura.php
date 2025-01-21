<?php
session_start();
//error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();


?>
<!DOCTYPE html>
<html lang="en">

<head>


	<title>Admin | Cotizaciones</title>
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

	<style>
		/* Estilos para el div de sugerencias */
		#lista,
		#listaCode {
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
								<h1 class="mainTitle">Cotizacion (modulo en proceso)</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Cotizar || Facturar</span>
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
									<div class="col-lg-10 col-md-12">
										<div class="panel panel-white">

											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>


												<div class="form-group">
													<label for="condicion">
														Condicion de Pago

														<select class="form-control" name="condicion" id="condicion">
															<option value="Contado" selected>Contado</option>
															<option value="Credito">Credito</option>
														</select></label>
												</div>


												<div class="form-group">
													<label for="cliente">
														Nombre del Cliente</label>

													<input type="text" name="cliente" id="cliente" class="form-control" autocomplete="off" placeholder="Ingrese nombre o No de id del Cliente" required>
													<div class="form-group">
														<ul id="lista"></ul>
													</div>
												</div>


												<div class="form-group">
													<label for="identidad">
														Numero de Identificacion</label>

													<input type="text" name="identidad" id="identidad" class="form-control" autocomplete="off" required readonly>
												</div>



												<div class="form-group">
													<label for="inputData">
														Productos
													</label><br>
													<table class="table" id="tabla_productos">
														<thead>
															<tr>
																<th class="center">Codigo</th>
																<th>Nombre</th>
																<th>Exist.</th>
																<th>Precio</th>
																<th>% Desc</th>
																<th>Cantidad</th>
																<th>Descuento?</th>
																<th>Monto Desc</th>
																<th>subTotal</th>
																<th>Iva</th>


																<th>Total</th>
																<th>Accion</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td style="width: 150px;">
																	<div class="form-group">
																		<input type="text" name="codigo" id="codigo" class="form-control" autocomplete="off" placeholder="Ingrese nombre o codigo del producto" required>

																	</div>
																	<ul id="listaCode"></ul>
																</td>

																<td style="width: 300px;">
																	<div class="form-group">
																		<input type="text" name="nombreproducto" id="nombreproducto" class="form-control" autocomplete="off" placeholder="nombre del producto" readonly>
																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="number" name="existencia" id="existencia" class="form-control text-right" readonly>
																	</div>
																</td>

																<td style="width: 100px;">
																	<div class="form-group">
																		<input type="number" name="precio" id="precio" class="form-control text-right" readonly step="0.01">
																		<input type="hidden" name="costo" id="costo" class="form-control text-right" readonly step="0.01">
																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="text" name="porcdescuento" id="porcdescuento" class="form-control text-right" readonly>
																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="number" name="cantidad" id="cantidad" class="form-control text-right" min="0" value="0" onchange="calcularSubtotal()">
																	</div>
																</td>

																<td style="width: 50px;">
																	<div class="form-group">
																		<input type="checkbox" name="aplicardescuento" id="aplicardescuento" onchange="calcularDescuento()">
																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="text" name="montodescuento" id="montodescuento" class="form-control text-right" value="0" readonly>
																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="text" name="subtotal" id="subtotal" class="form-control text-right" readonly>

																	</div>
																</td>

																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="text" name="iva" id="iva" class="form-control text-right" readonly>
																		<input type="hidden" name="ivah" id="ivah" class="form-control text-right" readonly>
																	</div>
																</td>



																<td style="width: 70px;">
																	<div class="form-group">


																		<input type="text" name="total" id="total" class="form-control text-right" readonly>
																		<input type="hidden" name="esinv" id="esinv" class="form-control text-right" readonly>
																	</div>
																</td>




																<td style="width: 70px;">
																	<div class="form-group">
																		<input type="button" name="agregar" id="agregar" class="btn btn-o btn-primary" onClick="agregarLista()" value="Lista">
																	</div>
																</td>


															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="col-lg-10 col-md-12">
									<div class="panel panel-white">


									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-10 col-md-12">


									<table id="example" class="table" style="width:100%">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>codBarra</th>
												<th>Producto</th>
												<th>Cantidad</th>
												<th>Precio U</th>
												<th>Descuento</th>
												<th>Monto Desc</th>
												<th>SubTotal</th>
												<th>Iva</th>
												<th>Total</th>



											</tr>
										</thead>
										<tbody>
										</tbody>
										<tfoot id="tfoot_lista"></tfoot>

									</table>
									<div class="form-group">
										<input type="button" name="guardar" id="guardar" class="btn btn-o btn-primary" onClick="guardarDatos()" value="Facturar">
										<input type="button" name="limpiar" id="limpiar" class="btn btn-o btn-primary" onClick="location.reload()" value="Nueva">
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
	<script src="js/cotizador.js"></script>
	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
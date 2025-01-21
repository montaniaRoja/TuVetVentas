<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Reporte Visitas</title>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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
	<link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">


</head>

<body>
	<script src="js/funciones.js"></script>
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
								<h1 class="mainTitle">Reporte Visitas</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Reporte Visitas</span>
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
									<div class="col-md-12 col-lg-6">
										<div class="panel panel-white">
											<div class="panel-heading">
												<h5 class="panel-title">Busqueda</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" method="post">
													<div class="form-group">
														<label for="inputData">
															Rango de fechas
														</label>
														<div class="input-group" style="width: 100%">
															<input type="date" id="ini" name="ini" style="width: 50%" class="form-control" autocomplete="off" placeholder="Ingrese Inicio">

															<input type="date" id="fin" name="fin" style="width: 50%" class="form-control" autocomplete="off" placeholder="Ingrese Fin">
														</div>
														<noti_mes style="color:red"></noti_mes>
													</div>
													<input type="hidden" id="sucursal" value="<?php echo $_SESSION['sucursal']; ?>">
													<div class="form-group">
														<label for="inputData">
															Categorias
														</label>
														<select name="categoria" id="categoria" class="form-control" data-live-search="true" multiple>
															<?php
															$query2 = "SELECT id,cat_nombre FROM categorias order by cat_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) { ?>
																<option value="<?php echo $obj1->id ?>"><?php echo $obj1->cat_nombre; ?></option>
															<?php } ?>
														</select>
														<input type="checkbox" id="checkbox_cat">Seleccionar Todas
														<noti_cat style="color:red"></noti_cat>
													</div>
													<div class="form-group">
														<label for="inputData">
															Tipo de salida
														</label>
														<select name="select" id="select" class="form-control">
															<option value="1">Excel</option>
															<option value="2" selected>Pantalla</option>
														</select>
														<noti_selec style="color:red"></noti_selec>
													</div>
													<a type="buttom" id="buscar" name="buscar" class="btn btn-o btn-primary" onClick="buscarVisitas()">
														Procesar
													</a>
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
								<table id="tabla_visitas" class="display" style="width:100%">
									<thead>
										<tr>
											<th>#</th>
											<th>Cliente</th>
											<th>Sucursal</th>
											<th>Cant. Facturas</th>
											<th>Cantidad Productos</th>
											<th>Monto</th>
											<th>Opción</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
									<tfoot id="footer">

									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end: BASIC EXAMPLE -->
			<!-- end: SELECT BOXES -->
			<!--=====================================
						MODAL DETALLES TRASLADOS
						======================================-->
			<div id="modalDetallesVisitas" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<!--=====================================
									CABEZA DEL MODAL
									======================================-->
						<div class="modal-header">
							<h4 class="modal-title">Detalle Visitas</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<!--=====================================
									CUERPO DEL MODAL
									======================================-->
						<form id="formulario" role="form" method="post" enctype="multipart/form-data">

							<div class="modal-body">

								<div class="card-body">
									<table class="table table-hover" id="tabla_detalles_visitas">
										<thead>
											<tr>
												<th colspan="6">Reporte Detalle Visita</th>';
											</tr>
											<tr>
												<th>Cliente:</th>
												<th colspan="5">
													<div id="cliente"></div>
												</th>
											</tr>
											<tr>
												<th>Sucursal</th>
												<th>Fecha</th>
												<th>Código</th>
												<th>Producto</th>
												<th>Cantidad</th>
												<th>Monto</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
										<tfoot id="footerd">

										</tfoot>
									</table>
								</div>
							</div>
						</form>
						<!--=====================================
									PIE DEL MODAL
									======================================-->
						<div class="modal-footer justify-content-between">
							<button class="btn btn-success" onClick="buscarDetalleVisitas(id_cli,1)">Descargar Excel</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						</div>
						<?php
						?>
					</div>
				</div>
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
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>-->


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

	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		new DataTable('#tabla_visitas');
	</script>

	<script src="js/reportes_vce.js"></script>

	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
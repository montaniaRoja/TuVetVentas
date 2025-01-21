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

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Estados De Cuenta Proveedores</title>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<link rel="hoja de estilo" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anónimo">

	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

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

	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="stylesheet" href="assets/css/plugins.css">
	<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	<!-- Latest compiled and minified CSS -->
	<style>
		.bootstrap-select .dropdown-menu li.selected>a {
			color: #000 !important;
			/* Texto negro */
			font-weight: bold !important;
			/* Negrita */
		}

		.bootstrap-select .btn {
			color: #000 !important;
			/* Texto negro */
			font-weight: bold !important;
			/* Negrita */
		}
	</style>
	<link href="https://cdn.jsdelivr.net/npm/tom-select@2.4.1/dist/css/tom-select.css" rel="stylesheet">


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
								<h1 class="mainTitle">Estado De Cuenta Proveedores</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Estado De Cuenta Proveedores</span>
								</li>
							</ol>
						</div>
					</section>
					<!-- end: PAGE TITLE -->
					<!-- start: BASIC EXAMPLE -->
					<div class="container-fluid container-fullw bg-white">
						<div class="row">
							<div class="col-md-12">
								<h5 class="over-title margin-bottom-15">Estado De Cuenta <span class="text-bold">Proveedores</span></h5>
								<table class="table table-hover" id="tabla_etproveedores">
									<thead>
										<tr>
											<th class="center">Id</th>
											<th>Proveedor</th>
											<th>Total Creditos</th>
											<th>Total Abonos</th>
											<th>Saldo</th>
											<th>Detalle</th>
											<th>Pagar</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$sql = pg_query($db, "
												select p.id, p.prov_nombre, sum(e.cargo) as compras, sum(e.abono) as abonos, sum(e.cargo)-sum(e.abono) as saldo
												from proveedores p
												left join extractosproveedores e
												on p.id=prov_id
												group by p.id
												order by p.id;");
										$cnt = 1;
										while ($row = pg_fetch_object($sql)) {
										?>

											<tr>
												<td class="center"><?php echo $row->id; ?>.</td>
												<td><?php echo $row->prov_nombre; ?></td>
												<td><?php echo "$ " . number_format($row->compras, 2); ?></td>
												<td><?php echo "$ " . number_format($row->abonos, 2); ?></td>
												<td><?php echo "$ " . number_format($row->saldo, 2); ?></td>
												<td><button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#exampleModal"
														data-codigo="<?php echo $row->id; ?>"
														data-proveedor="<?php echo $row->prov_nombre; ?>">Detalle</button></td>

												<td><button type="button" class="btn btn-secundary"
														data-toggle="modal" data-target="#abonosModal"
														data-code="<?php echo $row->id; ?>"
														data-prov="<?php echo $row->prov_nombre; ?>" disabled>Pagar</button></td>

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

				<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Detalle Compra al Credito</h5>
								<p id="nombreproveedor" style="color: red;"></p>
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


				<div class="modal fade bd-example-modal-lg" id="abonosModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Realizar Pagos</h5>
								<p id="nombreProveedor" style="color: red;"></p>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="modalContentForm">
								<form action="registrar_pago_proveedor.php" method="post">
									<input type="hidden" name="provName" id="provName" readonly>
									<input type="hidden" name="validacion" id="validacion" readonly>
									<div class="form-group">
										<label for="exampleFormControlSelect2" style="color: black;">Seleccione las Facturas a Pagar</label>

										<select name="listaFacturas[]" id="listaFacturas" multiple onchange="calcularTotal()">

										</select>

									</div>
									<div class="mt-3">
										<span id="totalFacturas" style="color: red; font-weight:bold;">Total: $0.00</span>
									</div>
									<div class="mt-3">
										<input type="hidden" name="montoTotal" id="montoTotal" style="text-align: right;" readonly>
										<input type="hidden" name="provId" id="provId" style="text-align: right;" readonly>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Ingrese el numero de Cheque</label>
										<input type="text" class="form-control" id="nocheque" name="nocheque" pattern="\d*" oninput="validarSoloNumeros(this)" required>

									</div>

									<button type="submit" name="btnPago" id="btnPago" class="btn btn-primary">
										Registrar Pago
									</button>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

							</div>
						</div>
					</div>
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

	<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
	<script src="vendor/autosize/autosize.min.js"></script>
	<script src="vendor/selectFx/classie.js"></script>


	<script src="vendor/DataTables/jquery.dataTables.min.js"></script>

	<script src="assets/js/main.js"></script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js"></script>
	<script src="js/estadocuentaproveedores.js"></script>

	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
	<script src="https://cdn.jsdelivr.net/npm/tom-select@2.4.1/dist/js/tom-select.complete.min.js"></script>


</body>

</html>
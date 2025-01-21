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

$fecha_actual = date("Y-m-d");
if (isset($_POST['submit'])) {

	$nombre = $_REQUEST['nombregromista'];
	$sucursalAsignada = $_REQUEST['sucursal'];
	$usuario = $_SESSION['login'];
	$status = 1;

	//echo $_REQUEST[fullname];
	$query = ("INSERT INTO tbl_gromistas (nombre_gromista, sucursal_asignada, creado_por,fecha_creacion, activo_sn) VALUES ('$nombre','$sucursalAsignada','$usuario','$fecha_actual','$status')");
	$guardar = pg_query($db, $query);
	if (!$guardar) {
		$error = pg_last_error($db);
		print_r($error);
	}
	pg_close();
	if ($guardar) {
		echo "<script>alert('Su informacion ha sido enviada');</script>";
	}
	echo "<script>window.location.href='gromistas.php'</script>";
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Registrar Gromistas</title>
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
								<h1 class="mainTitle">Agregar Gromistas</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Agregar Gromistas</span>
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
												<h5 class="panel-title">Agregar Gromistas</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" name="marcas" method="post">
													<div class="form-group">
														<label for="inputData">
															Nombre
														</label>
														<input type="text" name="nombregromista" class="form-control" autocomplete="off" placeholder="Nombre del Gromista">
													</div>

													<div class="form-group">
														<label for="inputData">
															Sucursal Asignada
														</label><br>
														<select name="sucursal" id="sucursal">
															<?php
															$sucursales = "SELECT id,sucursal_nombre FROM sucursales order by sucursal_nombre";
															$resultado = pg_query($db, $sucursales);
															while ($obj1 = pg_fetch_object($resultado)) {   ?>


																<option value="<?php echo $obj1->id; ?>"><?php echo $obj1->sucursal_nombre; ?></option>

															<?php } ?>
														</select>
													</div>

													<button type="submit" name="submit" class="btn btn-o btn-primary">
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

						<div class="row">
							<div class="col-md-12">
								<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Marcas</span></h5>

								<table id="example" class="display" style="width:100%">
									<thead>
										<tr>
											<th class="center">#</th>
											<th>Nombre</th>
											<th>Sucursal Asignada</th>
											<th>Creado por</th>
											<th>Fecha Creacion</th>
											<th>Estatus</th>
											<th>Acciones</th>


										</tr>
									</thead>
									<tbody>
										<?php
										$sql = pg_query($db, "select g.id, g.nombre_gromista, g.sucursal_asignada, s.sucursal_nombre, g.creado_por, g.fecha_creacion, g.activo_sn
from tbl_gromistas g join sucursales s
on g.sucursal_asignada=s.id
order by g.nombre_gromista;");
										$cnt = 1;
										while ($row = pg_fetch_object($sql)) {
											if ($row->activo_sn == 1) {
												$actual = "Activo";
											} else {
												$actual = "Inactivo";
											}
										?>

											<tr>
												<td class="center"><?php echo $row->id; ?>.</td>
												<td class="hidden-xs"><?php echo $row->nombre_gromista; ?></td>

												<td><?php echo $row->sucursal_nombre; ?></td>
												<td><?php echo $row->creado_por; ?></td>
												<td><?php echo $row->fecha_creacion; ?></td>
												<td><?php echo $actual; ?></td>

												<td>
													<div class="visible-md visible-lg hidden-sm hidden-xs">
														<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalGromistas" data-id="<?php echo $row->id; ?>" data-nombre="<?php echo $row->nombre_gromista; ?>" data-sucursal="<?php echo $row->sucursal_asignada; ?>" data-sucursalnombre="<?php echo $row->sucursal_nombre; ?>">
															Sucursal
														</button>


													</div>
												</td>
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
			<div class="modal fade" id="modalGromistas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Cambiar Sucursal</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form role="form" name="editgromistas" id="editgromistas" method="post">
								<div class="form-group">
									<label for="inputData">
										Nombre
									</label>
									<input type="text" name="gromista" id="gromista" class="form-control" readonly>
								</div>

								<div class="form-group">
									<label for="inputData">
										Sucursal Actual
									</label>
									<input type="text" name="actual" id="actual" class="form-control" readonly>
								</div>

								<div class="form-group">
									<label for="inputData">
										Nueva Sucursal
									</label><br>
									<select id="sucursalselect">
										<?php
										$sucursales = "SELECT id,sucursal_nombre FROM sucursales order by sucursal_nombre";
										$resultado = pg_query($db, $sucursales);
										while ($obj1 = pg_fetch_object($resultado)) {   ?>


											<option value="<?php echo $obj1->id; ?>"><?php echo $obj1->sucursal_nombre; ?></option>

										<?php } ?>
									</select>
								</div>


							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="cambiar">Save changes</button>
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
    $('#modalGromistas').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Botón que disparó el modal
        var idGromista = button.data('id'); // Extraer info de los atributos data-*
        var nombreGromista = button.data('nombre');
        var idSucursal = button.data('sucursal');
        var sucursalNombre = button.data('sucursalnombre');
        var boton = document.getElementById('cambiar');

        console.log(idGromista, nombreGromista, idSucursal, sucursalNombre);

        // Asignar valor al campo 'gromista'
        document.getElementById('gromista').value = nombreGromista;
        document.getElementById('actual').value = sucursalNombre;

        var select = document.getElementById('sucursalselect');
        select.addEventListener('change', function() {
            var selectedOption = this.options[select.selectedIndex];
        }, { passive: true });

        // Desasociar evento 'click' del botón 'cambiar' si ya existe
        boton.removeEventListener('click', handleGromistaChange);

        // Asignar el nuevo evento 'click'
        boton.addEventListener('click', handleGromistaChange);

        function handleGromistaChange() {
            console.log('datos a enviar');
            var idnuevasucursal = parseInt(select.value);
            console.log(idGromista, idnuevasucursal);

            const datos = {
                idGromista: idGromista,
                idSucursal: idnuevasucursal
            }

            fetch('http://tuvet.test.labanaliza.com/vms/apis/api_rotar_gromistas.php', {
                    method: 'PATCH',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(datos)
                })
                .then(response => {
                    console.log('Respuesta recibida:', response);
                    return response.json();
                })
                .then(data => {
                    console.log('Datos JSON recibidos:', data);
                    if (data.success) {
                        console.log('datos actualizados correctamente');
                        $('#modalGromistas').modal('hide'); // Cerrar el modal
                        alert(data.message);
                        window.location.reload();
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.log('Error en fetch:', error);
                    alert('Error: ' + error.message);
                });
        }
    });
</script>



	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
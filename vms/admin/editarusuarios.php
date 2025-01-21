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



if (isset($_POST['submit'])) {
	$nombre = $_POST['nombrehidden'];
	$iniciales = $_POST['iniciales'];
	$password = $_POST['password'];
	$solicitud = (intval($_POST['nuid']));
	$destinatario = $_POST['correo'];
	$fecha_actual = date("Y-m-d"); //$9
	$sucursal = $_REQUEST['sucursal'];
	$creador = $_SESSION['login'];
	$creadorId = (intval($_SESSION['userid']));
	$adminRol = "Administrador";
	$gerenteRol = "Gerente Sucursal";
	$atencionRol = "Atencion";
	$vetRol = "Medico Veterinario";
	$contaRol = "Contabilidad";
	$bodegaRol = "Gerente Bodega";
	$televentasRol="Televentas";
	$activo = 1;
	$empleadoRol = (intval($_POST['rolSelect']));

	switch ($empleadoRol) {
		case 1:
			// Prepara la consulta de inserción con parámetros
			$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion) 
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)";

			// Ejecuta la consulta de inserción usando pg_query_params
			$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $adminRol));

			if ($result) {
				// Si la inserción fue exitosa, actualiza la solicitud
				$procesar = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
				$procesado = pg_query_params($db, $procesar, array($solicitud));

				if ($procesado) {
					echo "<script>alert('Su informacion ha sido enviada');</script>";
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
				}
			} else {
				$error = pg_last_error($db);
				echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
			}

			//pg_close($db);
			echo "<script>window.location.href='usuarios.php'</script>";
			break;

		case 2:
			// Prepara la consulta de inserción con parámetros
			$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion, sucursal_asignada) 
				VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9,$10)";

			// Ejecuta la consulta de inserción usando pg_query_params
			$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $atencionRol, $sucursal));

			if ($result) {
				// Si la inserción fue exitosa, actualiza la solicitud
				$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
				$ejecutar = pg_query_params($db, $actualiza, array($solicitud));

				if ($ejecutar) {
					echo "<script>window.location.href='usuarios.php'</script>";
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
				}
			} else {
				$error = pg_last_error($db);
				echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
			}

			//	pg_close($db);
			break;


		case 3:
			// Prepara la consulta de inserción con parámetros
			$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion) 
				VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)";

			// Ejecuta la consulta de inserción usando pg_query_params
			$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $contaRol));

			if ($result) {
				// Si la inserción fue exitosa, actualiza la solicitud
				$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
				$ejecutar = pg_query_params($db, $actualiza, array($solicitud));

				if ($ejecutar) {
					echo "<script>window.location.href='usuarios.php'</script>";
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
				}
			} else {
				$error = pg_last_error($db);
				echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
			}

			//	pg_close($db);
			break;

		case 4:
			// Prepara la consulta de inserción con parámetros
			$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion, sucursal_asignada) 
					VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)";

			// Ejecuta la consulta de inserción usando pg_query_params
			$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $gerenteRol, $sucursal));

			if ($result) {
				// Si la inserción fue exitosa, actualiza la solicitud
				$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
				$ejecutar = pg_query_params($db, $actualiza, array($solicitud));

				if ($ejecutar) {
					echo "<script>window.location.href='usuarios.php'</script>";
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
				}
			} else {
				$error = pg_last_error($db);
				echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
			}

			//	pg_close($db);

			break;

		case 5:
			// Prepara la consulta de inserción con parámetros
			$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion, sucursal_asignada) 
				VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)";

			// Ejecuta la consulta de inserción usando pg_query_params
			$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $vetRol, $sucursal));

			if ($result) {
				// Si la inserción fue exitosa, actualiza la solicitud
				$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
				$ejecutar = pg_query_params($db, $actualiza, array($solicitud));

				if ($ejecutar) {
					echo "<script>window.location.href='usuarios.php'</script>";
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
				}
			} else {
				$error = pg_last_error($db);
				echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
			}

			//pg_close($db);
			break;

			case 6:
				// Prepara la consulta de inserción con parámetros
				$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion, sucursal_asignada) 
					VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)";
	
				// Ejecuta la consulta de inserción usando pg_query_params
				$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $bodegaRol, $sucursal));
	
				if ($result) {
					// Si la inserción fue exitosa, actualiza la solicitud
					$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
					$ejecutar = pg_query_params($db, $actualiza, array($solicitud));
	
					if ($ejecutar) {
						echo "<script>window.location.href='usuarios.php'</script>";
					} else {
						$error = pg_last_error($db);
						echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
					}
				} else {
					$error = pg_last_error($db);
					echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
				}
	
				//pg_close($db);
				break;


				case 7:
					// Prepara la consulta de inserción con parámetros
					$query = "INSERT INTO tbl_empleados (nombre_empleado, iniciales_empleado, passwd, creada_por, id_creador, fecha_creacion, activo_sn, id_solicitud, posicion) 
						VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)";
		
					// Ejecuta la consulta de inserción usando pg_query_params
					$result = pg_query_params($db, $query, array($nombre, $iniciales, $password, $_SESSION['login'], $creadorId, $fecha_actual, $activo, $solicitud, $televentasRol));
		
					if ($result) {
						// Si la inserción fue exitosa, actualiza la solicitud
						$actualiza = "UPDATE solicitudcontrasenia SET procesadosn = 1 WHERE id = $1";
						$ejecutar = pg_query_params($db, $actualiza, array($solicitud));
		
						if ($ejecutar) {
							echo "<script>window.location.href='usuarios.php'</script>";
						} else {
							$error = pg_last_error($db);
							echo "<script>alert('Error al actualizar: " . addslashes($error) . "');</script>";
						}
					} else {
						$error = pg_last_error($db);
						echo "<script>alert('Error al insertar: " . addslashes($error) . "');</script>";
					}
		
					//pg_close($db);
					break;
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Agregar Usuarios</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
								<h1 class="mainTitle">Admin | Agregar Usuarios</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Agregar Usuarios</span>
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
												<h5 class="panel-title">Agregar Usuarios</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" name="dcotorspcl" method="post">
													<div class="form-group">
														<label for="exampleInputEmail1">
															Nombre Usuario
														</label>

														<?php

														$id = intval($_GET['id']);
														$sql = pg_query($db, " select * from solicitudcontrasenia where id=$id;");
														while ($row = pg_fetch_object($sql)) {


														?>

															<input id="nombrehidden" type="text" readonly name="nombrehidden" class="form-control" value="<?php echo $row->nombreusuario; ?>">
													</div>


													<div class="form-group">

														<input type="hidden" name="nuid" class="form-control" value="<?php echo $row->id; ?>">

													</div>




													<div class="form-group">
														<label for="exampleInputEmail1">Iniciales</label>

														<input type="text" name="iniciales" class="form-control" readonly value="<?php echo $row->iniciales; ?>">
													</div>


													<div class="form-group">
														<label for="exampleInputEmail1">Correo</label>

														<input type="email" readonly name="correo" class="form-control" value="<?php echo $row->correousuario; ?>">
													</div>

													<div class="form-group">
														<label for="rolSelect">Rol asignado</label>
														<select name="rolSelect" id="rolSelect" class="form-control" readonly>
															<option value="1" <?php if ($row->rolusuario == 1) {
																					echo "selected";
																				} ?>>Administrador</option>
															<option value="2" <?php if ($row->rolusuario == 2) {
																					echo "selected";
																				} ?>>Atencion al cliente</option>
															<option value="3" <?php if ($row->rolusuario == 3) {
																					echo "selected";
																				} ?>>Contabilidad</option>
															<option value="4" <?php if ($row->rolusuario == 4) {
																					echo "selected";
																				} ?>>Gerente de Sucursal</option>
															<option value="5" <?php if ($row->rolusuario == 5) {
																					echo "selected";
																				} ?>>Medico Veterinario</option>
															<option value="6" <?php if ($row->rolusuario == 6) {
																					echo "selected";
																				} ?>>Gerente Bodega</option>					
																				<option value="7" <?php if ($row->rolusuario == 7) {
																					echo "selected";
																				} ?>>Televentas</option>
														</select>
													</div>


													<div class="form-group">
														<label for="exampleInputEmail1">Contraseña elegida por el usuario</label>
														<input type="password" name="password" class="form-control" value="<?php echo $row->passwd; ?>" disabled>
														<input type="hidden" name="password" class="form-control" value="<?php echo $row->passwd; ?>">
													</div>


													<div class="form-group">


													<?php } ?>
													</div>

													<div class="form-group">
														<label for="sucursal">
															Sucursal
														</label>
														<select name="sucursal" id="sucursal" class="form-control">
															<option value="" disabled selected>Sucursal Asignada</option>
															<?php
															$codigoCd = 7;
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


													</div>

													<button type="submit" name="submit" class="btn btn-o btn-primary">


														Crear Usuario
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
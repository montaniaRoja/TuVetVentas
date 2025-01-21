<?php
session_start();

$timeout = 7200; // 1 hora en segundos
if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > $timeout)) {
	// Si la última actividad es mayor al tiempo de espera, destruir la sesión
	session_unset(); // Liberar variables de sesión
	session_destroy(); // Destruir la sesión
}
$_SESSION['LAST_ACTIVITY'] = time(); // Actualizar tiempo de última actividad
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "GERENTE") {
	header("Location: logout.php");
	exit();
}
$usuarioLogueado = $_SESSION['login'];


?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Historia Clinica Mascotas</title>
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
		/* Estilos para la tabla */
		table {
			border-collapse: collapse;
			/* Colapsa los bordes de las celdas */
			width: 100%;
			/* Ancho de la tabla */
		}

		/* Estilos para las filas */
		tr {
			border: 1px solid #ddd;
			/* Borde para cada fila */
		}

		/* Estilos para las celdas */
		td {
			border: 1px solid #ddd;
			/* Borde para cada celda */
			padding: 8px;
			/* Espaciado interno en cada celda */
		}

		/* Estilos para las celdas editables */
		td[contenteditable="true"] {
			background-color: #f2f2f2;
			/* Color de fondo para las celdas editables */
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
								<h1 class="mainTitle">Admin | Historia Clinica Mascotas</h1>
								<div id="contenido"></div>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Historia Clinica Mascotas</span>
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
												<h5 class="panel-title">Historia Clinica Mascotas</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
												<form role="form" name="dcotorspcl" method="post" enctype="multipart/form-data">
													<div class="form-group">
														<label for="exampleInputEmail1">
															Nombre de la Mascota
														</label>

														<?php

														$id = intval($_GET['id']);
														$sql = pg_query($db, "select m.nombre_mascota, c.cliente_nombre, r.nombre_raza 
														from mascotas m join clientes c 
														on m.propietario_id=c.id
														join razas r
														on m.raza_id=r.id
														where m.id=$id;");
														while ($row = pg_fetch_object($sql)) {

														?> <input type="text" readonly name="nombre" id="nombre" class="form-control" value="<?php echo $row->nombre_mascota; ?>">


													</div>
													<input type="hidden" name="nombre" id="idmascota" class="form-control" value="<?php echo $id; ?>">
													<div class="form-group">


														<label for="exampleInputEmail1">
															Nombre del Propietario
															<input type="text" name="propietario" id="propietario" class="form-control" style="width: 100%;" value="<?php echo $row->cliente_nombre; ?>" readonly>

														</label>

														<label for="exampleInputEmail1">
															Raza de la Mascota
															<input type="text" name="razamascota" id="razamascota" class="form-control" style="width: 100%;" value="<?php echo $row->nombre_raza; ?>" readonly>

														</label>
													</div>
													<input type="hidden" name="nombremedico" id="nombremedico" value="<?php echo $_SESSION['login']; ?>">
													<input type="hidden" name="sucursal" id="sucursal" value="<?php echo $_SESSION['sucursal']; ?>">
													<input type="hidden" name="medicoid" id="medicoid" value="<?php echo $_SESSION['userid']; ?>">

											</div>

										<?php } ?>

										<div class="form-group">
											<label for="inputData">
												Habitat

												<input type="text" name="habitatmascota" id="habitat" class="form-control" autocomplete="off" placeholder="Habitat"></label>

											<label for="inputData">
												Dieta

												<input type="text" name="dietamascota" id="dietamascota" class="form-control" autocomplete="off" placeholder=""></label>
										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Motivo Consulta</label>
											<select name="motivo" id="motivo" class="form-control" onchange="mostrarOtro()">
												<option value="Consulta">Consulta</option>
												<option value="Baño">Baño</option>
												<option value="Vacunas">Vacunas</option>
												<option value="Desparasitacion" selected>Desparasitacion</option>
												<option value="Corte y baño">Corte y Baño</option>
												<option value="Otro">Otro</option>
											</select>
											<input type="text" name="otroMotivo" id="otroMotivo" class="form-control" style="display:none;" placeholder="Especificar otro motivo">
										</div>
										<div class="form-group">

											<label for="inputData">Temperatura °C
												<input type="number" name="temperatura" id="temperatura" class="form-control" autocomplete="off" step="0.01" min="0" required></label>

											<label for="inputData">Peso Kilogramos
												<input type="number" name="peso" id="peso" class="form-control" autocomplete="off" step="0.01" min="0" required></label>


										</div>

										<div class="form-group">

											<label for="exampleFormControlTextarea2" class="form-label">Anamnesis</label>
											<textarea name="anamnesis" id="anamnesis" class="form-control" rows="4" required></textarea>

										</div>

										<div class="form-group">

											<label for="exampleFormControlTextarea1" class="form-label">Examen Fisico</label>
											<textarea name="sintomas" id="sintomas" class="form-control" rows="4" required></textarea>

										</div>


										<div class="form-group">
											<label for="exampleInputEmail1">Analisis Realizados</label>
											<select name="analisis[]" id="analisis" class="form-control" multiple>
												<?php
												$query2 = "SELECT id,nombre_analisis FROM analisis order by nombre_analisis";
												$consulta = pg_query($db, $query2);
												while ($obj1 = pg_fetch_object($consulta)) {   ?>


													<option value="<?php echo $obj1->id ?>" <?php if ($obj1->nombre_analisis == 'Seleccione proveedor') {
																								echo "selected";
																							} ?>><?php echo $obj1->nombre_analisis; ?></option>

												<?php } ?>
											</select>
										</div>
										<div class="form-group">
											<label for="inputData">
												Examenes PDF
											</label>
											<input type="file" name="archivo_pdf" id="archivo_pdf" accept=".pdf" class="form-control">
										</div>

										<div class="form-group">

											<label for="exampleFormControlTextarea1" class="form-label">Diagnostico</label>
											<textarea name="dianostico" id="diagnostico" class="form-control" rows="4" required></textarea>

										</div>
										<h4>Receta</h4>
										<div class="form-group">
											<table id="tablaReceta">
												<tr>
													<td contenteditable="true"></td>
													<td contenteditable="true"></td>
												</tr>
											</table>
											<button type="button" onclick="agregarFila()">Agregar Fila</button>


										</div>


										<div class="form-group">
											<label for="date">
												Fecha Proxima Cita
											</label>
											<input type="date" name="fecha" id="fecha" class="form-control" autocomplete="off">

										</div>


										<button type="button" name="submit" class="btn btn-o btn-primary" onclick="guardarDatos()">
											guardar Datos
										</button>
										</form>
										<div id="aviso" style="color: red;"></div>

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
								<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Historial Mascotas</span></h5>

								<table id="example" class="display" style="width:100%">
									<thead>
										<tr>
											<th class="center">#</th>
											<th>Fecha Visita</th>
											<th>Nombre Mascota</th>
											<th>Raza</th>
											<th>Especie</th>
											<th>Motivo</th>
											<th>Proxima Cita</th>
											<th>Medico Atendio</th>

											<th>receta / Analisis / historial / editar</th>

										</tr>
									</thead>
									<tbody>
										<?php
										$sql = pg_query($db, "select h.id, h.fecha_visita, m.nombre_mascota, r.nombre_raza, r.nombre_especie, h.motivo_visita, h.proxima_cita, h.medico_atendio, h.ruta_archivo
from historial_mascotas h
join mascotas m on h.mascota_id=m.id
join razas r 
on m.raza_id=r.id
where m.id='$id'
order by h.id");
										$cnt = 1;
										while ($row = pg_fetch_object($sql)) {
											$medicoAtendio = $row->medico_atendio;
										?>

											<tr>
												<td class="center"><?php echo $row->id; ?>.</td>
												<td><?php echo $row->fecha_visita; ?></td>
												<td><?php echo $row->nombre_mascota; ?></td>
												<td><?php echo $row->nombre_raza; ?></td>
												<td><?php echo $row->nombre_especie; ?></td>
												<td><?php echo $row->motivo_visita; ?></td>
												<td><?php echo $row->proxima_cita; ?></td>
												<td class="medico"><?php echo $row->medico_atendio; ?></td>


												<td>

													<div class="visible-md visible-lg hidden-sm hidden-xs">

														<button onclick="window.location.href='imprimir_receta.php?id=<?php echo $row->id; ?>'" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Imprimir">receta</button>


														<?php
														if ($row->ruta_archivo != '' || $row->ruta_archivo != null) {
															echo '<button class="btn btn-transparent btn-xs" onclick="verPDF(\'' . $row->ruta_archivo . '\')" data-toggle="modal" data-target="#modalPDF">Analisis</button>';
														}
														?>

														<button type="button" class="btn btn-transparent btn-xs" data-toggle="modal" data-target="#modalHistorial" data-historial="<?php echo $row->id; ?>">
															Detalle</button>


														<?php if ($usuarioLogueado == $row->medico_atendio): ?>
															<input type="button" id="btnEditar" onclick="location.href='editarhistorial.php?id=<?php echo $row->id; ?>'" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Edit" value="Editar">
														<?php endif; ?>


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
		</div>

		<!-- Modal HISTORIAL -->
		<div class="modal fade" id="modalHistorial" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Historico</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div id="modalBody" class="modal-body" style="max-height: 750px; overflow-y: auto;"> <!-- Ajusta max-height según el tamaño deseado -->
						<!-- Contenido del modal aquí -->
						...
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>
		<!-- end: BASIC EXAMPLE -->
		<!-- end: SELECT BOXES -->

		<!--=====================================
						MODAL PDF
						======================================-->

		<div id="modalPDF" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: auto;">
				<div class="modal-content" style="width: auto;">
					<!--=====================================
									CABEZA DEL MODAL
									======================================-->
					<div class="modal-header">
						<h4 class="modal-title">PDF</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!--=====================================
									CUERPO DEL MODAL
									======================================-->
					<object id="visorPDF" type="application/pdf" width="100%" height="500px"></object>

					<!--=====================================
									PIE DEL MODAL
									======================================-->
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					</div>
					<?php
					?>
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
			$('#analisis').select2();
			Main.init();
			FormElements.init();
		});
	</script>

	<script>
		new DataTable('#example')
	</script>

	<script>
		function guardarDatos() {
			localStorage.clear();
			// Obtener los datos del historial
			var idmascota = parseInt(document.getElementById("idmascota").value);
			var nombremedico = document.getElementById("nombremedico").value;
			var medicoid = document.getElementById("medicoid").value;
			var sucursal = parseInt(document.getElementById("sucursal").value);
			var nombre = document.getElementById("nombre").value;
			var motivo = document.getElementById("motivo").value;
			var otroMotivo = document.getElementById("otroMotivo").value;
			var temperatura = parseInt(document.getElementById("temperatura").value);
			var peso = parseInt(document.getElementById("peso").value);
			var anamnesis = document.getElementById("anamnesis").value;
			var sintomas = document.getElementById("sintomas").value;
			var diagnostico = document.getElementById("diagnostico").value;
			var fecha = document.getElementById("fecha").value;
			if(fecha===''){
				fecha='2000-01-01';
			}
			
			var habitat = document.getElementById("habitat").value;
			var dieta = document.getElementById("dietamascota").value;
			var archivo_pdf = document.getElementById("archivo_pdf").files[0];

			if (isNaN(temperatura) || anamnesis === "" || diagnostico === "" ||
				isNaN(peso) || sintomas === "" || habitat === "" || dieta === "") {
				document.getElementById("aviso").innerHTML = 'Asegúrese de llenar todos los campos';
				return;
			}
			var recetaVacia = false;
			var datosTablaReceta = document.getElementById("tablaReceta");
			var filasReceta = datosTablaReceta.getElementsByTagName("tr");

			// Verificar si la única fila está vacía
			if (filasReceta.length === 1) {
				var celdasReceta = filasReceta[0].getElementsByTagName("td");

				// Comprobar si ambas celdas están vacías
				if (celdasReceta[0].textContent.trim() === "" && celdasReceta[1].textContent.trim() === "") {
					recetaVacia = true;
					let text = 'No hay datos en la receta, ¿desea continuar?';
					if (!confirm(text)) {
						return;
					}
				}
			}

			if (!archivo_pdf) { // Verifica si el archivo no fue seleccionado
				let text = 'No se ha seleccionado un archivo PDF, ¿desea continuar sin subirlo?';
				if (!confirm(text)) {
					return; // Si el usuario elige "Cancelar", la función se detiene
				}
			}


			var datosHistorial = new FormData();
			datosHistorial.append('idmascota', idmascota);

			if (motivo == 'Otro') {
				datosHistorial.append('motivo', otroMotivo);
			} else {
				datosHistorial.append('motivo', motivo);
			}
			datosHistorial.append('temperatura', temperatura);
			datosHistorial.append('peso', peso);
			datosHistorial.append('sintomas', sintomas);
			datosHistorial.append('diagnostico', diagnostico);
			datosHistorial.append('nombremedico', nombremedico);
			datosHistorial.append('sucursal', sucursal);
			datosHistorial.append('anamnesis', anamnesis);
			datosHistorial.append('medicoid', medicoid);
			datosHistorial.append('fecha', fecha);
			datosHistorial.append('habitat', habitat);
			datosHistorial.append('dieta', dieta);
			datosHistorial.append('archivo', archivo_pdf);


			fetch("http://tuvet.test.labanaliza.com/vms/apis/api_guardar_historial.php", {
					method: "POST",
					body: datosHistorial
				})
				.then(response => response.json()) // Cambiamos a .json() para procesar el JSON de respuesta
				.then(data => {
					if (data.success) {
						console.log(data.success);
						localStorage.setItem('respuesta', JSON.stringify(data));

						const historialId = data.id;
						console.log(historialId);

						if (!recetaVacia) {
							guardarReceta(historialId);
						}
						
						guardarAnalisis(historialId);
						window.location.reload();
						
					} else {
						alert("Error al guardar historial: " + data.message); // Muestra el error al usuario
					}
				})
				.catch(error => {
					console.error("Error:", error);
					alert("Error de conexión: " + error.message);
				});
		}

		function guardarReceta(historialId) {
			localStorage.setItem('recetaId',historialId);
			var receta = document.getElementById("tablaReceta");
			var filas = receta.getElementsByTagName("tr");
			var datosTablaArray = [];

			for (var i = 0; i < filas.length; i++) {
				var fila = filas[i];
				var celdas = fila.getElementsByTagName("td");
				var filaDatos = [];

				for (var j = 0; j < celdas.length; j++) {
					filaDatos.push(celdas[j].textContent.trim()); // Agregamos .trim() para limpiar los espacios en blanco
				}
				filaDatos.push(historialId); // Agrega el ID del historial
				datosTablaArray.push(filaDatos);
			}

			// Construir el JSON para enviar
			var datosEnvio = {
				receta: datosTablaArray
			};

			// Usar fetch para enviar la solicitud POST
			fetch("http://tuvet.test.labanaliza.com/vms/apis/api_guardar_receta.php", {
					method: "POST",
					headers: {
						"Content-Type": "application/json;charset=UTF-8"
					},
					body: JSON.stringify(datosEnvio)
				})
				.then(response => response.json()) // Procesar la respuesta como JSON
				.then(data => {
					if (data.success) {
						console.log("Receta guardada con éxito:", data.message);
					} else {
						console.error("Error al guardar la receta:", data.message);
					}
				})
				.catch(error => {
					console.error("Error al conectar con la API:", error);
				});
		}


		function guardarAnalisis(historialId) {
    // Obtener el ID del historial y los análisis seleccionados
    var idHistorial = historialId;
    var analisis = Array.from(document.getElementById("analisis").selectedOptions).map(option => option.value);
    console.log("Códigos de análisis:", analisis);

    // Construir el objeto de datos para enviar
    var datosAnalisis = {
        id: idHistorial,
        analisis: analisis
    };

    // Usar fetch para enviar la solicitud POST
    fetch("http://tuvet.test.labanaliza.com/vms/apis/api_guardar_analisis.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=UTF-8"
        },
        body: JSON.stringify(datosAnalisis)
    })
    .then(response => response.json()) // Procesar la respuesta como JSON
    .then(data => {
        if (data.success) {
            console.log("Análisis guardados con éxito:", data.message);
        } else {
            console.error("Error al guardar los análisis:", data.message);
        }
    })
    .catch(error => {
        console.error("Error al conectar con la API:", error);
    });
}



		// Función para agregar una fila a la tabla
		function agregarFila() {
			// Obtener la tabla
			var tabla = document.getElementById("tablaReceta");

			// Crear una nueva fila
			var newRow = tabla.insertRow(tabla.rows.length);

			// Crear celdas en la nueva fila
			var cell1 = newRow.insertCell(0);
			var cell2 = newRow.insertCell(1);

			// Hacer las celdas editables
			cell1.contentEditable = true;
			cell2.contentEditable = true;

			// Puedes agregar valores iniciales si lo deseas
			cell1.innerHTML = "";
			cell2.innerHTML = "";
		}
	</script>
	<script>
		function mostrarOtro() {
			var motivoSelect = document.getElementById("motivo");
			var otroMotivoInput = document.getElementById("otroMotivo");

			if (motivoSelect.value === "Otro") {
				otroMotivoInput.style.display = "block";
			} else {
				otroMotivoInput.style.display = "none";
			}
		}

		function verPDF(archivo) {
			console.log('Ruta del PDF:', archivo);
			var visorPDF = document.getElementById('visorPDF');
			visorPDF.setAttribute('data', archivo);
		}
	</script>
	<script>
		$('#modalHistorial').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); // Button that triggered the modal
			var idHistorial = button.data('historial'); // Extract info from data-* attributes 

			console.log("id del historial ", idHistorial);
			$.ajax({
				type: 'POST',
				url: 'cargar_historial_modal.php',
				data: {
					idHistorial: idHistorial

				},
				success: function(response) {
					$('#modalBody').html(response);
				},
				error: function(xhr, status, error) {
					console.error("Error al cargar los datos:", status, error);
				}
			});
		}).modal('handleUpdate');
	</script>



</body>

</html>
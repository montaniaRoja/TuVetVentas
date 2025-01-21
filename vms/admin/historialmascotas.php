<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}

//$id=intval($_GET['id']);// get value

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
      border-collapse: collapse; /* Colapsa los bordes de las celdas */
      width: 100%; /* Ancho de la tabla */
    }

    /* Estilos para las filas */
    tr {
      border: 1px solid #ddd; /* Borde para cada fila */
    }

    /* Estilos para las celdas */
    td {
      border: 1px solid #ddd; /* Borde para cada celda */
      padding: 8px; /* Espaciado interno en cada celda */
    }

    /* Estilos para las celdas editables */
    td[contenteditable="true"] {
      background-color: #f2f2f2; /* Color de fondo para las celdas editables */
    }
  </style>
	</head>
	<body>
		<div id="app">		
<?php include('include/sidebar.php');?>
			<div class="app-content">
				
						<?php include('include/header.php');?>
					
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
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
										<span><?php echo $_SESSION['login']?></span>
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
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" name="dcotorspcl" method="post" enctype="multipart/form-data">
														<div class="form-group">
															<label for="exampleInputEmail1">
																Nombre de la Mascota
															</label>

	<?php 

$id=intval($_GET['id']);
	$sql=pg_query($db,"select nombre_mascota from mascotas where id=$id;");
	while($row = pg_fetch_object($sql))
{	
    
    //$proveedorid=$row->proveedor_id;
    //echo "el codigo del proveedor es ".$proveedorid;
	?>		<input type="text" readonly name="nombre" id="nombre" class="form-control" value="<?php echo $row->nombre_mascota;?>" >
	
													<?php }?>	</div>
						
			<div class="form-group">
			<input type="hidden" name="nombre" id="idmascota" class="form-control" value="<?php echo $id;?>" >
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
	
	<label for="inputData">Temperatura
	<input type="text" name="temperatura" id="temperatura" class="form-control" autocomplete="off" placeholder="Temperatura"></label>
	
	<label for="inputData">Peso
	<input type="text" name="peso" id="peso" class="form-control" autocomplete="off" placeholder="Kg"></label>
	
	
	</div>
	
	<div class="form-group">
				
				<label for="exampleFormControlTextarea2" class="form-label">Anamnesis</label>
  <textarea name="anamnesis" id="anamnesis" class="form-control" id="exampleFormControlTextarea2" rows="4"></textarea>
				
				</div>
	
				<div class="form-group">
				
				<label for="exampleFormControlTextarea1" class="form-label">Escriba los sintomas</label>
  <textarea name="sintomas" id="sintomas" class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
				
				</div>		
				
				
		<div class="form-group">
			<label for="exampleInputEmail1">Analisis Realizados</label>
				<select name="analisis[]" id="analisis" class="form-control" multiple>
						<?php 
				$query2="SELECT id,nombre_analisis FROM analisis order by nombre_analisis";
				$consulta=pg_query($db,$query2);
				while($obj1=pg_fetch_object($consulta)){   ?>
				
				
				<option value="<?php echo $obj1->id ?>"<?php if($obj1->nombre_analisis=='Seleccione proveedor'){echo "selected";}?>><?php echo $obj1->nombre_analisis;?></option>
				
				<?php }?></select>
		</div>
		<div class="form-group" >
			<label for="inputData">
				Examenes PDF
			</label>
			<input type="file" name="archivo_pdf" id="archivo_pdf" accept=".pdf" class="form-control">
		</div>
				
<div class="form-group">
				
				<label for="exampleFormControlTextarea1" class="form-label">Diagnostico</label>
  <textarea name="dianostico" id="diagnostico" class="form-control" id="exampleFormControlTextarea2" rows="4"></textarea>
				
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
												
												<th>receta / historial</th>											
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select h.id, h.fecha_visita, m.nombre_mascota, r.nombre_raza, r.nombre_especie, h.motivo_visita, h.proxima_cita, h.medico_atendio, h.ruta_archivo
from historial_mascotas h
join mascotas m on h.mascota_id=m.id
join razas r 
on m.raza_id=r.id
where m.id='$id'
order by h.id");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $row->id;?>.</td>
												<td><?php echo $row->fecha_visita;?></td>
												<td><?php echo $row->nombre_mascota;?></td>
												<td><?php echo $row->nombre_raza;?></td>
												<td><?php echo $row->nombre_especie;?></td>
												<td><?php echo $row->motivo_visita;?></td>
												<td><?php echo $row->proxima_cita;?></td>
												<td><?php echo $row->medico_atendio;?></td>
												
												
												
												
												
												<td>
												
													<div class="visible-md visible-lg hidden-sm hidden-xs">
													
														<button onclick="window.location.href='imprimir_receta.php?id=<?php echo $row->id;?>'" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Imprimir">receta</button>

													
													<?php 
														if($row->ruta_archivo != '' || $row->ruta_archivo != null){
															$rutaArchivo = '../mvz/'.$row->ruta_archivo;
															echo '<button class="btn btn-transparent btn-xs" onclick="verPDF(\'' . $rutaArchivo . '\')" data-toggle="modal" data-target="#modalPDF">Analisis</button>';	
														}					
													?>
													
													<button type="button" class="btn btn-transparent btn-xs" data-toggle="modal" data-target="#modalHistorial" data-historial="<?php echo $row->id; ?>">
                                                      Detalle</button>
													</div>
												</td>
											</tr>
											
											<?php 
$cnt=$cnt+1;
											 }?>
											
											
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
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
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

    // Obtener los datos del historial
    var idmascota = parseInt(document.getElementById("idmascota").value);
    var nombre = document.getElementById("nombre").value;
    var motivo = document.getElementById("motivo").value;
    var otroMotivo = document.getElementById("otroMotivo").value;
    var temperatura = parseInt(document.getElementById("temperatura").value);
    var peso = parseInt(document.getElementById("peso").value);
    var anamnesis = document.getElementById("anamnesis").value;
    var sintomas = document.getElementById("sintomas").value;
    var diagnostico = document.getElementById("diagnostico").value;
    var fecha = document.getElementById("fecha").value;
    var archivo_pdf = document.getElementById("archivo_pdf").files[0];

    var datosHistorial = new FormData();
    datosHistorial.append('idmascota', idmascota);
    datosHistorial.append('nombre', nombre);
    if(motivo=='Otro'){
    	datosHistorial.append('motivo', otroMotivo);
    }else{
    	datosHistorial.append('motivo', motivo);
    }
    datosHistorial.append('temperatura', temperatura);
    datosHistorial.append('peso', peso);
    datosHistorial.append('anamnesis', anamnesis);
    datosHistorial.append('sintomas', sintomas);
    datosHistorial.append('diagnostico', diagnostico);
    datosHistorial.append('fecha', fecha);
    datosHistorial.append('archivo_pdf', archivo_pdf);

    fetch("guardar_historial.php", {
        method: "POST",
        body: datosHistorial
    })
    .then(response => response.text())
    .then(data => {
        
       		console.log(data.trim());
            guardarReceta(); 
            guardarAnalisis();
            window.location.reload();
        
    })
    .catch(error => {
        console.error("Error:", error);
    });
}

function guardarReceta() {
   var datosTabla = document.getElementById("tablaReceta");
var filas = datosTabla.getElementsByTagName("tr");
var datosTablaArray = [];

for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    var celdas = fila.getElementsByTagName("td");
    var filaDatos = [];

    for (var j = 0; j < celdas.length; j++) {
        filaDatos.push(celdas[j].textContent);
    }

    datosTablaArray.push(filaDatos);
}

var datosEnvio = {
    datosTabla: datosTablaArray
};

var xmlhttp = new XMLHttpRequest();
xmlhttp.open("POST", "./guardar_receta.php", true);
xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState === XMLHttpRequest.DONE) {
        if (xmlhttp.status === 200) {
           
            console.log(xmlhttp.responseText);
        } else {
           
            console.error('Ocurrió un error al enviar los datos al servidor.');
        }
    }
};

xmlhttp.send(JSON.stringify(datosEnvio));

}

function guardarAnalisis() {
   
	//enviar analisis

    var analisis = Array.from(document.getElementById("analisis").selectedOptions).map(option => option.value);
    console.log("codigos de analisis "+analisis);
    
    var datosAnalisis = {
    	analisis:analisis
    };
    
    
    var xmlhttp = new XMLHttpRequest();
xmlhttp.open("POST", "./guardar_analisis.php", true);
xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState === XMLHttpRequest.DONE) {
        if (xmlhttp.status === 200) {
           
            console.log(xmlhttp.responseText);
        } else {
           
            console.error('Ocurrió un error al enviar los datos al servidor.');
        }
    }
};

xmlhttp.send(JSON.stringify(datosAnalisis));

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
    $('#modalHistorial').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var idHistorial = button.data('historial'); // Extract info from data-* attributes
		
		console.log("id del historial ",idHistorial);
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
    });
</script>

	</body>
</html>
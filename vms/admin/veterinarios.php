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
		<title>Admin | *******</title>
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
									<h1 class="mainTitle">MVZ</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>MVZ</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
							

									<div class="row">
								<div class="col-md-12">
									<h5 class="over-title margin-bottom-15">MVZ<span class="text-bold"></span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>Id</th>
												<th>Nombre</th>
												<th>Iniciales</th>
												<th>Activar Inactivar</th>
												<th>Sucursal</th>
												
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select * from mvz;");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $cnt;?>.</td>
												<td class="hidden-xs"><?php echo $row->mvz_id;?></td>
												<td><?php echo $row->mvz_nombre;?></td>
												<td><?php echo $row->mvz_iniciales;?></td>
												
												<td>
													<input type="checkbox" id="activo" name="activo" <?php if($row->activosn==1) echo "checked"; ?> onchange="updateValor(this, <?php echo $row->mvz_id; ?>)">
												</td>
												<td>
													
													<select name="sucursal<?php echo $cnt; ?>" id="sucursal<?php echo $cnt; ?>" style="width: 100%" class="form-control" data-live-search="true" onchange="cambiarSucursal(this.value, <?php echo $row->mvz_id;?>)">
													<?php 
													$query2="SELECT id,sucursal_nombre FROM sucursales order by sucursal_nombre";
													$consulta=pg_query($db,$query2);
													while($obj1=pg_fetch_object($consulta)){?>
														<option value="<?php echo $obj1->id ?>" <?php if($obj1->id==$row->mvzsucursal_asignada){echo "selected";}?>><?php echo $obj1->sucursal_nombre;?></option>
													
													<?php }?>
													</select>
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
						<!-- end: BASIC EXAMPLE -->
						<!-- end: SELECT BOXES -->
						
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
    function updateValor(checkbox, adminId) {
        var nuevoValor = checkbox.checked ? 1 : 0;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "actdesmvz.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Manejar la respuesta del servidor si es necesario
                console.log(xhr.responseText);
            }
        };

        // Enviar los valores al servidor
        xhr.send("nuevo_valor=" + nuevoValor + "&admin_id=" + adminId);
    }
	
	function cambiarSucursal(id_suc, vId) {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "ajax/general.ajax.php", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// Manejar la respuesta del servidor si es necesario
				console.log(xhr.responseText);
				window.alert('Se realizo el cambio.');
			}
		};
		// Enviar los valores al servidor
		xhr.send("id_suc=" + id_suc + "&veterinario_id=" + vId+ "&cambiarSucursalV=" + "ok");
	}
</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
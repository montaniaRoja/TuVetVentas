<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
$sucursal=$_SESSION['sucursal'];


if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Administrar Monitoreo</title>
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
		
		
		<script>

            

        </script>
		<style>
			.select2-container {
				z-index: 10000; /* Ajusta este valor según sea necesario */
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
									<h1 class="mainTitle">Administrar Monitoreos</h1>
									<h5 id="estaSucursal"><?php echo $_SESSION['sucursal']?></h5>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Administrar Monitoreos</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-md-12">
									<a id="agregar-monitoreo" type="buttom" name="agregar-monitoreo" onClick="crearMonitoreo()" class="btn btn-o btn-primary margin-bottom-15" data-toggle="modal" data-target="#modalCrearMonitoreo">
										Crear Monitoreo
									</a>
									<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Monitoreos</span></h5>
									
									<table class="table table-hover" id="tabla_monitoreo">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Código</th>
                                                <th>Producto</th>
                                                <th>Empresa</th>
                                                <th>Dirección</th>
                                                <th>Precio Competencia</th>
                                                <th>Precio TuVet</th>
												<th>Creado Por</th>
                                                <th>Ultima Actualización</th>
                                                <th>Opción</th>
                                            </tr>
                                        </thead>
										<tbody id="tbody_monitoreo">
											<?php
											$sql=pg_query($db,"
											SELECT m.monitoreo_id,
											m.monitoreo_sucursal_id,
											s.sucursal_nombre,
											m.monitoreo_codbarra,
											p.prod_nombre,
                                            p.prod_preciopublico*(1+p.porcentaje_impuesto) as precio_tuvet,
											m.monitoreo_empresa_id,
											e.empresa_nombre,
											e.empresa_direccion,
											m.monitoreo_precio,
											m.monitoreo_usuario_crea,
											m.monitoreo_ultima_actualizacion
											FROM monitoreo m 
											INNER JOIN sucursales s ON s.id = m.monitoreo_sucursal_id
											INNER JOIN productos p ON p.prod_codbarra = m.monitoreo_codbarra
											INNER JOIN monitoreo_empresas e ON e.empresa_id = m.monitoreo_empresa_id
                                            WHERE m.monitoreo_sucursal_id = '$_SESSION[sucursal]'
											order by monitoreo_id desc");
											$cnt=1;
											while($row = pg_fetch_object($sql)){
												?>

												<tr>
													<td class="center"><?php echo $cnt;?>.</td>
													<td><?php echo $row->monitoreo_codbarra;?></td>
													<td><?php echo $row->prod_nombre;?></td>
													<td><?php echo $row->empresa_nombre;?></td>
													<td><?php echo $row->empresa_direccion;?></td>
													<td><?php echo '$' . number_format($row->monitoreo_precio,2);?></td>
													<td><?php echo '$' . number_format($row->precio_tuvet, 2); ?></td>
													<td><?php echo $row->monitoreo_usuario_crea;?></td>
													<td><?php echo $row->monitoreo_ultima_actualizacion;?></td>
													<td>
                                                        <?php
                                                            echo '<button class="btn btn-warning btnEditarMonitoreo" data-toggle="modal" data-target="#modalCrearMonitoreo" 
														        onClick="cargarDatosModalEditarMonitoreo('.$row->monitoreo_id.')">Editar</button>';
															echo '<button class="btn btn-o btn-success btnHistorialMonitoreo" data-toggle="modal" data-target="#modalHistorialMonitoreo" 
														        onClick="cargarDatosModalHistorialMonitoreo('.$row->monitoreo_id.')">Historial</button>';
                                                        ?>
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
						<!-- end: BASIC EXAMPLE -->
						<!-- end: SELECT BOXES -->
						<!--=====================================
						MODAL DETALLES TRASLADOS
						======================================-->

						<div id="modalCrearMonitoreo" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<!--=====================================
									CABEZA DEL MODAL
									======================================-->
									<div class="modal-header">
										<h4 class="modal-title">Monitoreo</h4>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
									</div>
									<!--=====================================
									CUERPO DEL MODAL
									======================================-->
									

										<div class="modal-body">
										<form id="formulario" role="form" method="post" enctype="multipart/form-data">
											<div class="card-body">  
											<input type="hidden" name="id_monitoreo" id="id_monitoreo">
											<input type="hidden" name="sucursal" id="sucursal" value="">
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Producto
                                                    </label>
                                                    <select name="producto" id="producto" class="form-control" style="width: 100%" data-live-search="true" >
                                                    	<option value=""></option>
													<?php 
                                                    $query2="SELECT id,prod_nombre, prod_codbarra FROM productos order by prod_nombre";
                                                    $consulta=pg_query($db,$query2);
                                                    while($obj1=pg_fetch_object($consulta)){?>
                                                        <option value="<?php echo $obj1->prod_codbarra ?>"><?php echo $obj1->prod_nombre;?></option>
                                                    <?php }?>
                                                    </select>
                                                    <noti_pro style="color:red"></noti_pro>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Empresa
                                                    </label>
                                                    <div class="input-group" style="width: 100%">
                                                        <select name="empresa" id="empresa" class="form-control" style="width: 70%">
															<option value=""></option>
														<?php 
															$query1="SELECT empresa_id,empresa_nombre FROM monitoreo_empresas order by empresa_id desc";
															$consulta1=pg_query($db,$query1);
															$arrayEmp = array();
															while($obj1=pg_fetch_object($consulta1)){
																$arrayEmp[] = array(
																	'empresa_id' => $obj1->empresa_id,
																	'empresa_nombre' => $obj1->empresa_nombre
																);
																?>
																<option value="<?php echo $obj1->empresa_id ?>" ><?php echo $obj1->empresa_nombre;?></option>
   															<?php  }
															$arrayE = json_encode($arrayEmp);?>
                                                        </select>
														<script type="text/javascript">
															var data_empresas = <?php echo json_encode($arrayE);?>;
														</script>
														<a type="buttom" onClick="crearEmpresa()" style="width: 30%; height: 30px;" class="form-control btn btn-sm btn-o btn-success" data-toggle="modal" data-target="#modalCrearEmpresa">
                                                            Crear Empresa
									                    </a>
													</div>
                                                    <noti_empre style="color:red"></noti_empre>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Precio
                                                    </label>
                                                    <input type="number" min="0" name="precio" id="precio" class="form-control">
                                                    <noti_precio style="color:red"></noti_precio>
                                                </div>
											</div>
									</form>
										</div>
									
									<!--=====================================
									PIE DEL MODAL
									======================================-->
									<div class="modal-footer justify-content-between">
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-success" id="btn_crear_monitoreo" onClick="insertarRegistroMonitoreo()">Crear</button>
                                        <button type="button" class="btn btn-success" id="btn_editar_monitoreo" onClick="editarRegistroMonitoreo()">Guardar</button>
									</div>
									<?php
									?>
								</div>
							</div>
						</div>
                        <!--=====================================
						MODAL DETALLES TRASLADOS
						======================================-->

						<div id="modalCrearEmpresa" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<!--=====================================
									CABEZA DEL MODAL
									======================================-->
									<div class="modal-header">
										<h4 class="modal-title">Empresa</h4>
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
												
												<input type="hidden" id="id_empresa" name="id_empresa">
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Nombre Empresa
                                                    </label>
                                                    <input type="text" class="form-control" id="nombre" name="nombre">
                                                    <noti_e_nom style="color:red"></noti_e_nom>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Dirección
                                                    </label>
                                                    <input type="text" class="form-control" id="direccion" name="direccion">
                                                    <noti_e_dir style="color:red"></noti_e_dir>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputData">
                                                        Teléfono
                                                    </label>
                                                    <input type="text" class="form-control" id="telefono" name="telefono">
                                                    <noti_e_tel style="color:red"></noti_e_tel>
                                                </div>
												<div class="form-group">
                                                    <label for="inputData">
                                                        Cantidad Sucursales
                                                    </label>
                                                    <input type="number" class="form-control" id="cantidad_sucursales" name="cantidad_sucursales">
                                                    <noti_e_cant_suc style="color:red"></noti_e_cant_suc>
                                                </div>
											</div>
										</div>
									</form>
									<!--=====================================
									PIE DEL MODAL
									======================================-->
									<div class="modal-footer justify-content-between">
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-success" id="btn_crear_empresa" onClick="insertarRegistroEmpresa()">Crear</button>
                                        <button type="button" class="btn btn-success" id="btn_editar_empresa" onClick="editarRegistroEmpresa()">Editar</button>
									</div>
									<?php
									?>
								</div>
							</div>
						</div>
						<!--=====================================
						MODAL DETALLES TRASLADOS
						======================================-->

						<div id="modalHistorialMonitoreo" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<!--=====================================
									CABEZA DEL MODAL
									======================================-->
									<div class="modal-header">
										<h4 class="modal-title">Monitoreo</h4>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
									</div>
									<!--=====================================
									CUERPO DEL MODAL
									======================================-->
									<div class="modal-body">
										<div class="card-body">  
											<table class="table table-hover" id="tabla_historial_monitoreo">
												<thead>
													<tr>
														<th colspan="5">Historial Monitoreo</th>';
													</tr>
													<tr>
														<th>Producto:</th>
														<th colspan="4"><div id="producto_nombre"></div></th>
													</tr>
													<tr>
														<th>Empresa</th>
														<th>Precio</th>
														<th>Usuario Crea</th>
														<th>Fecha</th>
													</tr>
												</thead>
												<tbody id="tbody_historial">
												</tbody>
											</table>		
											</div>
										</div>
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
				</div>
			</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
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
		<script src="vendor/DataTables/jquery.dataTables.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#tabla_monitoreo').DataTable({
					responsive: true
				});
				$('#tabla_historial_monitoreo').DataTable({
					responsive: true
				});
			});
		</script>
		<script src="js/monitoreo.js"></script>	
		<script>
			var sucursalLogueada=document.getElementById('estaSucursal').innerHTML;
			console.log(sucursalLogueada);
			document.getElementById('sucursal').value=sucursalLogueada;
			
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
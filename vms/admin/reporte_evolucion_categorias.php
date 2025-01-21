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
		<title>Admin | Reporte Evolución</title>
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
									<h1 class="mainTitle">Reporte Evolución Categorias</h1>
								</div>
									<ol class="breadcrumb">
										<li>
											<span><?php echo $_SESSION['login']?></span>
										</li>
										<li class="active">
											<span>Reporte Evolución Categorias</span>
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
										<div class="col-md-12 col-lg-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">Busqueda</h5>
												</div>
												<div class="panel-body">
													<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
													<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" method="post" >
														<div class="form-group">
															<label for="inputData">
																Sucursales
															</label>
															<div class="input-group" style="width: 100%">
																<select name="sucursal" id="sucursal" style="width: 100%" class="form-control" data-live-search="true" multiple>
																<?php 
																$query2="SELECT id,sucursal_nombre FROM sucursales order by sucursal_nombre";
																$consulta=pg_query($db,$query2);
																while($obj1=pg_fetch_object($consulta)){?>
																	<option value="<?php echo $obj1->id ?>"<?php if($obj1->sucursal_nombre=='seleccione categoria'){echo "selected";}?>><?php echo $obj1->sucursal_nombre;?></option>
																
																<?php }?>
																</select>
																<input type="checkbox" id="checkbox_suc" >Seleccionar Todos
															</div>
															<noti_suc style="color:red"></noti_suc>
														</div>
                                                        <div class="form-group">
															<label for="inputData">
																Categorias
															</label>
															<div class="input-group" style="width: 100%">
																<select name="categoria" id="categoria" style="width: 100%" class="form-control" data-live-search="true" multiple>
																<?php 
																$query2="SELECT id,cat_nombre FROM categorias order by cat_nombre";
																$consulta=pg_query($db,$query2);
																while($obj1=pg_fetch_object($consulta)){?>
																	<option value="<?php echo $obj1->id ?>"><?php echo $obj1->cat_nombre;?></option>
																<?php  }
																		$arrayC = json_encode($array);
																		echo $arrayC;?>
																</select>
																<script type="text/javascript">
																	var data_categorias = <?php echo json_encode($arrayC);?>;
																</script>
																<input type="checkbox" id="checkbox_cat" >Seleccionar Todas
															</div>
															<noti_cat style="color:red"></noti_cat>
														</div>
														<div class="form-group col-xs-6" style="width: 50%; padding-left: 0px; padding-right: 0px;">
															<label for="inputData">
																Tipo de reporte
															</label>
																<select name="tipo" id="tipo" style="width: 100%" class="form-control">
																	<option value="1">Monto</option>
																	<option value="2">Cantidad</option>
																</select>
															
															<noti_tipo style="color:red"></noti_tipo>
														</div>
														<div class="form-group col-xs-6" style="width: 50%; padding-left: 0px; padding-right: 0px;">
															<label for="inputData">
																Tipo de salida 
															</label>
																<select name="select" id="select" style="width: 100%" class="form-control">
																	<option value="1">Excel</option>
																	<option value="2" selected>Pantalla</option>
																</select>
															<noti_selec style="color:red"></noti_selec>
                                                        </div>
														<a type="buttom" id="buscar" name="buscar" class="btn btn-o btn-primary" onClick="buscarEvolucionCategorias()">
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
											<table id="tabla_evolucion" class="display" style="width:100%">	
												<thead>
													<tr id="head">
														<th>Categorias</th>
														<th>5 Meses antes</th>	
														<th>4 Meses antes</th>
														<th>3 Meses antes</th>	
														<th>2 Meses antes</th>
														<th>Mes anterior</th>
														<th>Mes actual</th>
													</tr>
													
												</thead>
												<tbody id="body">

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
            new DataTable('#tabla_evolucion');														
		</script>
		
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		
		

		<script src="js/reportes_vce.js"></script>
				
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
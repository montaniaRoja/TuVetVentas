<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}

$fecha_actual=date("Y-m-d");

if(isset($_GET['anulado'])){//if del submit
    $query=("UPDATE comprasproductos SET estado='Anulado' WHERE id='".$_GET['id']."'");
    $query=pg_query($query);
    
    if(!$query){
        echo "Error al procesar la informacion 1, ".pg_last_error($db)."";
    }
    
    if($query){
        echo "Su informacion ha sido actualizada general";
		$compra = "SELECT * FROM comprasproductos WHERE id='".$_GET['id']."'"; 
		$result_compra = pg_query($db, $compra);
		$result_compra = pg_fetch_object($result_compra);
		if ($result_compra->compra_condicion == 'Credito') {
			$query2=("UPDATE proveedores SET saldo=saldo-'".$result_compra->compra_total."' WHERE id='".$result_compra->proveedor_id."'");
			$query2=pg_query($query2);
			if(!$query2){
				echo "Error al procesar la informacion 2, ".pg_last_error($db)."";
			}
			$query3=("UPDATE extractosproveedores SET cargo=0, abono=0, saldo=0 WHERE doc_numero='".$result_compra->compra_nodoc."' AND fecha='".$result_compra->compra_fecha."' AND prov_id='".$result_compra->proveedor_id."' AND sucursal='".$result_compra->sucursal_id."'");
    		$query3=pg_query($query3);
			if(!$query3){
				echo "Error al procesar la informacion 3, ".pg_last_error($db)."";
			}
		}
		$compra_detalles = "SELECT * FROM comprasdetalle WHERE compra_id='".$_GET['id']."'"; 
		$result_compra_detalles = pg_query($db, $compra_detalles);
		if ($result_compra_detalles) {
			// Iterar sobre los resultados de la consulta utilizando pg_fetch_assoc
			while ($fila = pg_fetch_assoc($result_compra_detalles)) {
				// crear la fila de existencias y puntos de reorden para cada sucursal segun las sucursales existentes
				$query4=("UPDATE existencias SET existencia = existencia - '".$fila['producto_cantidadtotal']."' WHERE codbarra='".$fila['producto_codbarra']."' AND id_sucursal='".$result_compra->sucursal_id."'");
				$query4=pg_query($query4);

				if(!$query4){
					echo "Error al procesar la informacion 3, ".pg_last_error($db)."";
				}

				$queryuidc = ("select max(id) as id from kardex");
				$queryuidc = pg_query($queryuidc);
				$queryuidc = pg_fetch_object($queryuidc);
				$queryuidc = $queryuidc->id+1;
				$descripcion="entrada por compra";
				if(!$queryuidc){
					echo "Error al procesar la informacion i, ".pg_last_error($db)."";
				}
				$query5=("INSERT INTO kardex(id, sucursal_id, codbarra, cant_ingreso, cant_salio, fecha_transaccion,descripcion)
                        VALUES ($queryuidc, $result_compra->sucursal_id,'".$fila['producto_codbarra']."',0,'".$fila['producto_cantidadtotal']."','now()','$descripcion')");
				$query5=pg_query($query5);

				if(!$query5){
					echo "Error al procesar la informacion 5, ".pg_last_error($db)."";
				}

				
				if($query4){
					echo "<script>alert('Se anulo la compra');</script>";
					echo "<script>window.location.href='compras.php'</script>";
				}
			}
		}
    }

	//echo "<script>window.location.href='traslados.php'</script>";
}//if del submit

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Administrar Compras</title>
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
									<h1 class="mainTitle">Administrar Compras</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Administrar Compras</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
								<div class="row">
									<div class="col-md-12">
										<a id="agregar-compra" type="buttom" name="agregar-compra" href="ingresarcompra.php" class="btn btn-o btn-primary margin-bottom-15">
											Agregar Compra
										</a>
										<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Compras</span></h5>
										<table class="table table-hover" id="tabla_compras">
											<thead>
												<tr>
													<th class="center">#</th>
													<th>Factura</th>
													<th>Proveedor</th>
													<th>Condición</th>
													<th>Subtotal</th>
													<th>Monto Iva</th>
													<th>Monto Retención</th>
													<th>Total</th>
													<th>Fecha</th>
													<th>Estado</th>
													<th>Opción</th>
												</tr>
											</thead>
											<tbody>
												<?php
												$sql=pg_query($db,"
												select cp.id,
												cp.proveedor_id,
												p.prov_nombre,
												cp.compra_condicion, 
												cp.compra_fecha, 
												cp.compra_nodoc, 
												cp.compra_subtotal, 
												cp.compra_montoiva,
												cp.compra_montoretencion,
												cp.compra_total,
												cp.sucursal_id,
												cp.estado
												from comprasproductos as cp
												join proveedores as p on cp.proveedor_id=p.id
												ORDER BY cp.compra_fecha desc");
												$cnt=1;
												while($row = pg_fetch_object($sql)){
													?>

													<tr>
														<td class="center"><?php echo $cnt;?>.</td>
														<td><?php echo $row->compra_nodoc;?></td>
														<td><?php echo $row->prov_nombre;?></td>
														<td><?php echo $row->compra_condicion;?></td>
														<td><?php echo $row->compra_subtotal;?></td>
														<td><?php echo $row->compra_montoiva;?></td>
														<td><?php echo $row->compra_montoretencion;?></td>
														<td><?php echo $row->compra_total;?></td>
														<td><?php echo $row->compra_fecha;?></td>
														<td><?php echo $row->estado;?></td>
														<td>
														<?php 
															if ($row->estado == 'Ingresado' && $row->compra_fecha == $fecha_actual){
																?>
																<a href="compras.php?id=<?php echo $row->id?>&anulado=anulado" onClick="return confirm('¿Confirma para anular esta compra?')"
	                   									class="btn btn-danger btn-xs tooltips">Anular</a>
														<?php 
															}
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
				Main.init();
				FormElements.init();
				$('#tabla_compras').DataTable({
					responsive: true
				});
			});
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
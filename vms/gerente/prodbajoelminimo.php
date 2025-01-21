<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}




?>
<!DOCTYPE html>	
<html lang="en">
	<head>
		<title>Admin | Productos bajo el minimo</title>
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
		
		
		<script>

            

        </script>
		
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
									<h1 class="mainTitle">Existencias vs Minimo</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Punto de reorden</span>
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
													<h5 class="panel-title">Por sucursal</h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													
													
													<form role="form" name="marcas" method="post" action="reorden_excel.php" >
														<div class="form-group">
															<label for="inputData">
																Sucursal
															</label>
							<select name="sucursal[]" id="sucursal" class="form-control" multiple disabled>
    <option value="" disabled selected>Seleccione sucursal</option>
    <?php 
    $query2 = "SELECT id, sucursal_nombre FROM sucursales ORDER BY sucursal_nombre";
    $consulta = pg_query($db, $query2);

    while ($obj1 = pg_fetch_object($consulta)) {
        
        ?>
        <option value="<?php echo $obj1->id ?>" <?php echo $selected ?>>
            <?php echo $obj1->sucursal_nombre; ?>
        </option>
    <?php } ?>
</select>


																												
														
														<button id="submit" type="submit" name="submit" class="btn btn-o btn-primary">
															Hoja de Calculo
														</button>
													</form>
													
													
	<!-- funcion para prevenir que al presionar la tecla enter se envie el formulario -->												
	<script src="js/funciones.js"></script>												
													
													
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
									<h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>	
											<tr>	
												
												<th>Sucursal</th>
												<th>CodBarra</th>
												<th>Nombre</th>
												<th>Marca</th>
												<th>Proveedor</th>
												<th>Existencia</th>
												<th>Minimo</th>
												<th>Bodega?</th>
																			
												
											</tr>
										</thead>
										<tbody>
<?php
$sucursal=$_SESSION['sucursal'];
$sql=pg_query($db,"SELECT 
    p.prod_codbarra, 
    s.sucursal_nombre, 
    p.prod_nombre, 
    e.existencia, 
    r.ptoreorden,
    p.bodegasn, 
    m.marca_nombre, 
    pr.prov_nombre 
FROM 
    productos p
JOIN 
    existencias e ON p.prod_codbarra = e.codbarra
JOIN 
    (
        SELECT codbarra, ptoreorden, id_sucursal
        FROM puntosdereorden
    ) r ON p.prod_codbarra = r.codbarra AND e.id_sucursal = r.id_sucursal
JOIN 
    marcas m ON p.id_marca = m.id
JOIN 
    proveedores pr ON pr.id = m.proveedor_id
JOIN 
    sucursales s ON e.id_sucursal = s.id
WHERE 
    s.id ='$sucursal' AND
    e.existencia <= r.ptoreorden AND
    p.prod_esinventariosn=1
ORDER BY 
    p.prod_codbarra, s.sucursal_nombre;");
$cnt=1;
while($row = pg_fetch_object($sql)){
    $proveedor="Bodega";
    if($row->bodega==0){
        $proveedor="externo";
    }

?>

											<tr>
												
												<td><?php echo $row->sucursal_nombre;?></td>
												<td><?php echo $row->prod_codbarra;?></td>
												<td><?php echo $row->prod_nombre;?></td>
												<td><?php echo $row->marca_nombre;?></td>
												<td><?php echo $row->prov_nombre;?></td>
												<td><?php echo $row->existencia;?></td>
												<td><?php echo $row->ptoreorden;?></td>
												<td><?php echo $proveedor;?></td>
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
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		
		
		<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        // Este código se ejecutará cuando el DOM esté completamente cargado
        new DataTable('#example');
    });
</script>

		
		
		
			<script>
    $(document).ready(function() {
        <?php if(isset($_GET['mostrar'])) : ?>
            $('#kardexModal').modal('show');
        <?php endif; ?>
    });
</script>


<div class="modal fade" id="kardexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	

  <div class="modal-dialog modal-dialog-scrollable" role="document">
     <div class="modal-content">
      <div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Imagen del producto</h5>         
                                                    
      </div>
   <div class="modal-body">




</div>


<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location();">Cerrar</button>

 
</div>  
  

</div>
</div>
</div>

		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>

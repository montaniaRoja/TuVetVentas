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

if (isset($_POST['submit'])) {
    
    
    $sucursal=$_POST['sucursal'];
    
    $sucursales = pg_query($db, "SELECT * FROM sucursales where id='$sucursal'");
    
    $ventas = array();
    $contador=0;
    // Determinar la cantidad de productos
    
    
    // Mientras haya filas en el resultado
    while ($filaSucursal = pg_fetch_assoc($sucursales)){
        // Acceder a las propiedades del arreglo asociativo con corchetes
        $nombreSucursal = $filaSucursal['sucursal_nombre'];
        $sucursalId = $filaSucursal['id'];
        
        $productos = pg_query($db, "SELECT p.prod_codbarra, p.prod_nombre, m.marca_nombre, e.existencia FROM productos p
                                join existencias e
                                on p.prod_codbarra=e.codbarra
                                join marcas m
                                on p.id_marca=m.id
                                where e.id_sucursal=7;");
        
        while ($filaProducto = pg_fetch_assoc($productos)) {
            $codBarra = $filaProducto['prod_codbarra'];
            $nombreProducto = $filaProducto['prod_nombre'];
            $marcaProducto=$filaProducto['marca_nombre'];
            $existenciaBodega=$filaProducto['existencia'];
            $contador += 1;
            
            $venta30dias = pg_query($db, "SELECT sum(cantidad) as cantidad FROM dfacturas WHERE cod_barra='$codBarra' AND sucursal_id='$sucursalId' AND fecha >= current_date-30 AND validado_sn=1");
            
            while ($filaVenta = pg_fetch_assoc($venta30dias)) {
                $cantidad = ($filaVenta['cantidad'] > 0) ? $filaVenta['cantidad'] : 0;
                
                $existencias = pg_query($db, "SELECT * FROM existencias WHERE id_sucursal='$sucursalId' AND codbarra='$codBarra'");
                while ($filaExistencias = pg_fetch_assoc($existencias)) {
                    $inv = $filaExistencias['existencia'];
                    
                    $reorden = pg_query($db, "SELECT * FROM puntosdereorden WHERE id_sucursal='$sucursalId' AND codbarra='$codBarra'");
                    while ($filaReorden = pg_fetch_assoc($reorden)) {
                        $ptoreorden = $filaReorden['ptoreorden'];
                        
                        $topVentas = pg_query($db, "SELECT * FROM dfacturas WHERE cod_barra='$codBarra'
                                                AND sucursal_id='$sucursalId' AND fecha >= current_date-30
                                                AND validado_sn=1 ORDER BY cantidad DESC LIMIT 3");
                        
                        $cont = 0;
                        $topUno = $topDos = $topTres = 0; // Inicializar las variables
                        
                        while ($filaTop = pg_fetch_assoc($topVentas)) {
                            if ($cont == 0) {
                                $topUno = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                            } elseif ($cont == 1) {
                                $topDos = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                            } elseif ($cont == 2) {
                                $topTres = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                            }
                            $cont++;
                        }
                        
                        
                        // Crear un array asociativo para cada iteración y agregarlo al array principal
                        $venta = array(
                            'contador' => $contador,
                            'sucursalId' => $sucursalId,
                            'nombreSucursal' => $nombreSucursal,
                            'codBarra' => $codBarra,
                            'nombreProducto' => $nombreProducto,
                            'marcaProducto' => $marcaProducto,
                            'existenciaBodega' => $existenciaBodega,
                            'cantidad' => $cantidad,
                            'inv' => $inv,
                            'ptoreorden' => $ptoreorden,
                            'topUno' => $topUno,
                            'topDos' => $topDos,
                            'topTres' => $topTres,
                            'sugerencia' => ($inv == 0) ? ($ptoreorden - $inv) : ($inv - $ptoreorden),
                            'pedidobodega' => $ptoreorden - $inv,
                        );
                        
                        
                        // Agregar el array al array principal
                        $ventas[] = $venta;
                    }
                }
            }
        }
        
        $contador = 0;
    }
    
    
    
}





?>
<!DOCTYPE html>
<html lang="en">
	<head>
	
	
		<title>Admin | Sugerencia de pedido</title>
		
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
									<h1 class="mainTitle">Sugerencia de pedido</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span></span>
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
													<h5 class="panel-title"></h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" name="categorias" method="post" action="" onsubmit="return setFormAction();">
													
														
														<div class="form-group">
															<label for="sucursal">
																Sucursal
															</label>
							<select name="sucursal" id="sucursal" class="form-control">
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


				</div>	
														
														<div class="form-group">
		<label for="inputData">
																Seleccione Salida
															
		<select name="select" id="select" class="form-control">
  <option value="1">Excel</option>
  <option value="2" selected>Pantalla</option>
  
</select></label>
		</div>
														
														<button type="submit" name="submit" class="btn btn-o btn-primary">
															Procesar
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
            <h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>

            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>contador</th>
<th>Id Sucursal</th>
<th>Nombre Sucursal</th>
<th>cod Barra</th>
<th>Producto</th>
<th>Marca</th>
<th>Existencia bodega</th>
<th>Venta 30 dias</th>
<th>Existencia</th>
<th>Punto Reorden</th>
<th>Venta maxima</th>
<th>Venta Segunda</th>
<th>Venta Tercera</th>
<th>Sugerencia Pedido</th>
<th>Pedido a Bodega</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $cnt = 1;
                    foreach ($ventas as $venta){
                        if($venta['pedidobodega']>0){
                        ?>
                        <tr>
                            <td><?php echo $venta['contador']; ?></td>
                            <td><?php echo $venta['sucursalId']; ?></td>
                            <td><?php echo $venta['nombreSucursal']; ?></td>
                            <td><?php echo $venta['codBarra']; ?></td>
                            <td><?php echo $venta['nombreProducto']; ?></td>
                            <td><?php echo $venta['marcaProducto']; ?></td>
                            <td><?php echo $venta['existenciaBodega']; ?></td>
                            <td><?php echo $venta['cantidad']; ?></td>
                            <td><?php echo $venta['inv']; ?></td>
                            <td><?php echo $venta['ptoreorden']; ?></td>
                            <td><?php echo $venta['topUno']; ?></td>
                            <td><?php echo $venta['topDos']; ?></td>
                            <td><?php echo $venta['topTres']; ?></td>
                            <td><?php echo $venta['sugerencia']; ?></td>
                            <td><?php echo $venta['pedidobodega']; ?></td>
                            
                        </tr>
                    <?php
                        $cnt = $cnt + 1;
                    }
                    }
                    ?>
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
    function setFormAction() {
        var selectedOption = document.getElementById('select').value;
		console.log(selectedOption);
        if (selectedOption == 1) {
    document.forms['categorias'].action = 'pedido_sugerido.php';
} else if (selectedOption == 2) {
    document.forms['categorias'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
}

        return true;
    }
</script>
	
		
		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
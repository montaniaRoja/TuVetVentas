<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['submit'])) {
    
    $sucursal = $_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);
    $dias = intval($_POST['cars']);
    
    $consulta = "SELECT e.id_sucursal, s.sucursal_nombre, e.codbarra, p.prod_nombre, e.existencia, p.prod_costopromedio, e.existencia * p.prod_costopromedio AS costototal,
    MAX(k.fecha_transaccion) AS ultimoingreso, MAX(v.fecha) AS ultimaventa
FROM existencias e
JOIN productos p ON e.codbarra = p.prod_codbarra
LEFT JOIN dfacturas v ON e.codbarra = v.cod_barra AND e.id_sucursal = v.sucursal_id
JOIN kardex k ON e.codbarra = k.codbarra AND k.cant_ingreso > 0 AND e.id_sucursal = k.sucursal_id
JOIN sucursales s ON e.id_sucursal = s.id
WHERE e.existencia > 0 AND e.id_sucursal IN ($sucursalList) AND p.prod_esinventariosn = 1
    AND p.prod_codbarra NOT IN (
        SELECT DISTINCT e.codbarra
        FROM existencias e
        JOIN dfacturas v ON e.codbarra = v.cod_barra
        JOIN kardex k ON e.codbarra = k.codbarra AND k.cant_ingreso > 0 AND e.id_sucursal = k.sucursal_id
        WHERE v.fecha >= CURRENT_DATE - INTERVAL '$dias days'
        OR k.fecha_transaccion >= CURRENT_DATE - INTERVAL '$dias days'
    )
GROUP BY e.id_sucursal, e.codbarra, p.prod_nombre, e.existencia, p.prod_costopromedio, s.sucursal_nombre;";
    
    $resultado = pg_query($db, $consulta);
    
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
	
	
		<title>Admin | Productos sin Movimiento</title>
		
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
	<script src="js/seleccion.js"></script>
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
									<h1 class="mainTitle">Productos sin Movimiento</h1>
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
							<select name="sucursal[]" id="sucursal" class="form-control" multiple>
    <option value="" disabled selected>Seleccione sucursal</option>
    <?php 
    $codigoCd=7;
    $query2 = "SELECT id, sucursal_nombre FROM sucursales where id!='$codigoCd' ORDER BY sucursal_nombre";
    $consulta = pg_query($db, $query2);

    while ($obj1 = pg_fetch_object($consulta)) {
        
        ?>
        <option value="<?php echo $obj1->id ?>" <?php echo $selected ?>>
            <?php echo $obj1->sucursal_nombre; ?>
        </option>
    <?php } ?>
</select>
<br>
<button type="button" onclick="seleccionarTodas()">Seleccionar Todas</button>


</div>
				 <div class="form-group">
		<label for="cars">Dias a Calcular</label>

<select name="cars" id="cars" class="form-control">
  <option value="30">30 Dias</option>
  <option value="60">60 Dias</option>
  <option value="90">90 Dias</option>
  
</select>
		</div>
				
				
														
														<div class="form-group">
		<label for="selectSalida">
																Seleccione Salida
															
		<select name="selectSalida" id="selectSalida" class="form-control">
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
                    
                    <th>Sucursal</th>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Existencia</th>
                    <th>Costo Unidad</th>
                    <th>Total</th>
                    <th>Ultimo Ingreso</th>
                    <th>Ultima Venta</th>
                    <th>Otras Sucursales</th>


                    </tr>
                </thead>
               <tbody>
    <?php
    $cnt = 1;
    if ($resultado !== false) { // Verifica si $resultado es un objeto válido
        while ($row = pg_fetch_object($resultado)) {
    ?>
        <tr>
            <td><?php echo $row->sucursal_nombre; ?></td>
            <td><?php echo $row->codbarra; ?></td>
            <td><?php echo $row->prod_nombre; ?></td>
            <td><?php echo $row->existencia; ?></td>
            <td><?php echo $row->prod_costopromedio; ?></td>
            <td><?php echo $row->costototal; ?></td>
            <td><?php echo $row->ultimoingreso; ?></td>
            <td><?php echo $row->ultimaventa; ?></td>
             <td>
                            
                            
                           
                             <button type="button" class="btn btn-primary" 
                             data-toggle="modal" data-target="#exampleModal" 
                                data-codigo="<?php echo $row->codbarra; ?>"
                                 data-sucursal="<?php echo $row->id_sucursal; ?>"
                                >Ver detalle</button>

                            
                            
                            </td>
        </tr>
    <?php
            $cnt = $cnt + 1;
        }
    } else {
        // Manejar el caso en el que la consulta no se ejecutó correctamente
        echo "Error al ejecutar la consulta.";
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
				
			<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
   <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Venta en otras Sucursales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalContent">
      
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
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
        var selectedOption = document.getElementById('selectSalida').value;
		console.log(selectedOption);
        if (selectedOption == 1) {
    document.forms['categorias'].action = 'inv_muerto_excel.php';
} else if (selectedOption == 2) {
    document.forms['categorias'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
}

        return true;
    }
</script>
	
		<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var codigo = button.data('codigo'); // Extract info from data-* attributes
        var sucursal = button.data('sucursal');
		
		console.log('el codigo es '+codigo);
		console.log('la sucursal es '+sucursal);
        $.ajax({
            type: 'POST',
            url: 'otras_sucursales_modal.php',
            data: { 
            		codigo: codigo,
            		sucursal: sucursal
            	  },
            success: function(response) {
                $('#modalContent').html(response);
            },
            error: function(xhr, status, error) {
                console.error("Error al cargar los datos:", status, error);
            }
        });
    });
</script>
		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
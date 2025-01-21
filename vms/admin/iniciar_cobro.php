<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

$cliente=$_GET['nombre'];
$total=$_GET['total'];
$condicion=$_GET['condicion'];
$facturaId=$_GET['id'];



?>
<!DOCTYPE html>
<html lang="en">
	<head>
	
	
		<title>Admin | Cobrar Factura</title>
		
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
		
<?php include('include/sidebar.php');?>
			
				
						<?php include('include/header.php');?>
					
				<!-- end: TOP NAVBAR -->
					
				
								
	<ol class="breadcrumb">
	<li>
		
	</li>
	<li class="active">
							
	</li>
	</ol>
			
	<div class="main-content" >
	
	
	<div class="row">
	
	<div class="col-md-6">
	
	</div>
	
	<div class="col-md-6">
	<form role="form" name="categorias" method="post" action="procesarcobro02.php">
	<div class="form-group">
	<label for="factura">
	INGRESE EL NUMERO DE FACTURA</label>
	<input name="factura" placeholder="" class="form-control wd-450 text-right" required>
	<input type="hidden" name="idFactura" id="idFacturaInput" values="<?php echo $facturaId;?>">
	</div>
	
	<div class="form-group">
	<label for="cliente">
	Nombre del Cliente
	</label>
	<input type="text" name="cliente" id="cliente" class="form-control"  autocomplete="off" value="<?php echo $cliente;?>" disabled>
	<input type="hidden" name="nombreCliente02" id="nombreClienteInput02" class="form-control wd-450 text-right" value="<?php echo $cliente;?>">
	</div>
	
	<div class="form-group">
	<label for="total">
	Total
	</label>
	<input type="number" name="total" id="total" class="form-control"  value="<?php echo $total;?>" autocomplete="off" step="0.01" disabled>
	<input type="hidden" name="total02" id="total02" class="form-control"  value="<?php echo $total;?>" autocomplete="off" step="0.01">
	</div>
	
	<div class="form-group">
	<label for="cliente">
	Condicion
	</label>
	<input type="text" name="condicion" id="condicionInput" class="form-control"  autocomplete="off" value="<?php echo $condicion;?>" disabled>
	<input type="hidden" name="condicioncopia" id="condicionInputcopia" class="form-control"  autocomplete="off" value="<?php echo $condicion;?>">
	</div>
	
	
	
	<div class="form-group">
	<label for="tipodepago">
	Tipo de Pago
	</label>									
	<select name="tipodepago" id="tipodepago" class="form-control wd-450" >
    <option value="Seleccione tipo de pago" selected>Seleccione Tipo de pago</option>
  <option value="Efectivo" id="opcionEfectivo">Efectivo</option>
  <option value="Tarjeta" id="opcionTarjeta">Tarjeta</option>
  <option value="Tarjeta/Efectivo" id="opcionCombinacion">Tarjeta / Efectivo</option>
   <option value="Credito" id="opcionCredito">Credito</option>
	</select>					
	</div>													
														
<div class="form-group">
	<label for="efectivo">
	Efectivo
	</label>
	<input type="text" name="efectivo" id="efectivo" class="form-control"  disabled>
	<input type="hidden" name="copiaefectivo" id="copiaefectivo" class="form-control" >
	</div>
	
		
	
<div class="form-group">
	<label for="tarjeta">
	Tarjeta
	</label>
	<input type="text" name="tarjeta" id="tarjeta" class="form-control" disabled>
	<input type="hidden" name="copiatarjeta" id="copiatarjeta" class="form-control"  value="">
	</div>



<div class="form-group">
	<label for="credito">
	Credito
	</label>
	<input type="text" name="credito" id="credito" class="form-control" disabled>
	<input type="hidden" name="copiacredito" id="credito" class="form-control"  value="">
	</div>
	
	<div class="form-group">
	<label for="recibido">
	Efectivo Recibido
	
	<input type="text" name="recibido" id="recibido" class="form-control"  value="" ></label>
	<label for="credito">
	Numero de Autorizacion
	
	<input type="text" name="autorizacion" id="autorizacion" class="form-control"></label>
	
	</div>
	
	<div class="form-group">
	<label for="cambio">
	Cambio a entregar al cliente
	</label>
	<input type="text" name="cambio" id="cambio" class="form-control"  value="">
	</div>
	
	

<button type="submit" name="cobrar" id="cobrar" class="btn btn-o btn-primary" disabled>
Procesar Cobro
</button>
</form>
	
	</div>
	</div>
	</div>
	
	
			
		<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
		<?php include('include/setting.php');?>
				
			
			
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
		<script src="js/cobros2.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Obtener el elemento de entrada y el elemento de selección
        var condicionInput = document.getElementById('condicionInputcopia');
        var tipoDePagoSelect = document.getElementById('tipodepago');

        // Verificar el valor de condicioncopia al cargar la página
        if (condicionInput.value === 'Contado') {
            // Deshabilitar la opción "Crédito"
            document.getElementById('opcionCredito').disabled = true;
        }

        // Agregar un evento de cambio al campo condicioncopia
        condicionInput.addEventListener('change', function() {
            // Verificar el valor y deshabilitar la opción "Crédito" si es necesario
            if (condicionInput.value === 'contado') {
                document.getElementById('opcionCredito').disabled = true;
            } else {
                document.getElementById('opcionCredito').disabled = false;
            }
        });
    });
</script>
		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
<?php


session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
if ($_SESSION['usuario'] == "ATENCION") {
    header("Location: logout.php");
    exit();
}


check_login();
if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal=$_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);
    
    
    
    $detalledeventas = pg_query($db, "select h.id_sucursal,s.sucursal_nombre, sum(h.pago_efectivo) as efectivo,sum(h.pago_puntos) as puntos ,sum(h.pago_tarjeta) as tarjeta, sum(h.pago_credito) as credito,
sum(h.pago_efectivo)+sum(h.pago_tarjeta)+sum(h.pago_credito) as total
from hfacturas h 
join sucursales s on h.id_sucursal=s.id
where pagada_sn=1 and anulada=0
AND h.id_sucursal IN ($sucursalList)
and h.fecha_cobro BETWEEN '$fechaInicial' AND '$fechaFinal'
group by h.id_sucursal, s.sucursal_nombre
order by h.id_sucursal;");
    
    
    
}



?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Consolidado</title>
		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<link href="vendor/DataTables/css/jquery.dataTables.min.css"
	rel="stylesheet" media="screen">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<div class="main-content" >
<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
<section id="page-title">
<div class="row">
<div class="col-sm-8">
<h1 class="mainTitle">Consolidado General por Formas de Pago</h1>
</div>
<ol class="breadcrumb">
<li>
<span></span>
</li>
<li class="active">
<span>Cobrar</span>
</li>
</ol>
</div>
</section>
<div class="container-fluid container-fullw bg-white">
<div class="row">
<div class="col-md-12">

<div class="row margin-top-30">
										<div class="col-lg-6 col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
<h5 class="over-title margin-bottom-15"><span class="text-bold">Consolidado Formas de Pago</span></h5>


<form role="form" name="marcas" method="post" action="" onsubmit="return setFormAction();">
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
        <option value="<?php echo $obj1->id ?>">
            <?php echo $obj1->sucursal_nombre; ?>
        </option>
    <?php } ?>
</select>
<br>
<button type="button" onclick="seleccionarTodas()">Seleccionar Todas</button>

				</div>	
        <div class="form-group">
		<label for="fechainicial">
																Seleccione Rango de Fechas
																
		<input type="date" id="fechainicial" name="fechainicial" class="form-control"  value="<?php echo date('Y-m-d'); ?>" required></label>
		<label for="fechainicial">
		
		<input type="date" id="fechafinal" name="fechafinal" class="form-control" value="<?php echo date('Y-m-d'); ?>" required></label>
		</div>
		<div class="form-group">
		<label for="salida">
																Seleccione Salida
															
		<select name="salida" id="salida" class="form-control">
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
</div>

 <div class="row">
        <div class="col-md-12">
            <h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>

            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>Sucursal id</th>
                        <th>Nombre S</th>
                        <th>Efectivo</th>
                        <th>Tarjeta</th>
                        <th>Credito</th>
                        <th>Puntos</th>
                        <th>Total</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $cnt = 1;
                    $totalefectivo=0;
                    $totaltarjeta=0;
                    $totalcredito=0;
                    $totaltotal=0;
                    $totalpuntos=0;
                    while ($row = pg_fetch_object($detalledeventas)) {
                       $totalefectivo+=$row->efectivo;
                       $totaltarjeta+=$row->tarjeta;
                       $totalcredito+=$row->credito;
                       $totalpuntos+=$row->puntos;
                       $totaltotal+=$row->total;
                       
                        ?>
                        <tr>
                            <td><?php echo $row->id_sucursal; ?></td>
                            <td><?php echo $row->sucursal_nombre; ?></td>
                            
                            <td><?php echo '$' . number_format($row->efectivo, 2, '.', ','); ?></td>
                            <td><?php echo '$' . number_format($row->tarjeta, 2, '.', ','); ?></td>
                            <td><?php echo '$' . number_format($row->credito, 2, '.', ','); ?></td>
                            <td><?php echo '$' . number_format($row->puntos, 2, '.', ','); ?></td>
                            <td><?php echo '$' . number_format($row->total, 2, '.', ','); ?></td>
                            
                        </tr>
                    <?php
                        $cnt = $cnt + 1;
                    }
                    ?>
                </tbody>
                <tfoot>
    <tr>
        <td>Linea de Totales</td>
        <td></td>
        <td><?php echo '$' . number_format($totalefectivo, 2, '.', ',');?></td>
        <td><?php echo '$' . number_format($totaltarjeta, 2, '.', ',');?></td>
        <td><?php echo '$' . number_format($totalcredito, 2, '.', ',');?></td>
        <td><?php echo '$' . number_format($totalpuntos, 2, '.', ',');?></td>
        <td><?php echo '$' . number_format($totaltotal, 2, '.', ',');?></td>
    </tr>
</tfoot>

                
                
            </table>
        </div>
    </div>




</div>
</div>
</div>
</div>
</div>			<!-- start: FOOTER -->
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
		
		
		
		
		<script>
    function setFormAction() {
        var selectedOption = document.getElementById('salida').value;

        if (selectedOption == 1) {
    document.forms['marcas'].action = 'tipo_pago_excel1.php';
} else if (selectedOption == 2) {
    document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
}

        return true;
    }
</script>
	
		
		<script type="text/javascript">
            new DataTable('#example');

		</script>
		
		
		
	</body>
</html>
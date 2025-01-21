<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
include 'fechas.php';
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}

if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal=$_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);
    
    $detalledeventas = pg_query($db, "select c.cliente_nombre, d.cod_barra, p.prod_nombre, d.precio, d.cantidad, round(d.precio*d.cantidad,2) as tot,d.monto_descuento,round(d.monto_descuento/(d.precio*d.cantidad)*100,2) as porcdescuento ,d.total_linea, d.sucursal_id, s.sucursal_nombre ,h.creada_por 
from dfacturas d join productos p
on d.cod_barra=p.prod_codbarra
join hfacturas h on h.id=d.id_hfactura
join clientes c on h.id_cliente=c.id
join sucursales s on d.sucursal_id=s.id
    WHERE d.fecha BETWEEN '$fechaInicial' AND '$fechaFinal' and d.validado_sn=1 and d.anulada_sn=0
    AND d.sucursal_id IN ($sucursalList)");
    
    
}



?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Detalle de Descuentos</title>
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
<h1 class="mainTitle">Detalle de Descuentos</h1>
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
<h5 class="over-title margin-bottom-15"><span class="text-bold">Detalle de Ventas</span></h5>


<form role="form" name="marcas" method="post" action="" onsubmit="return setFormAction();" >
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
<button type="button" id="seleccionarTodas">Seleccionar Todas</button>

</div>
					
				
        <div class="form-group">
		<label for="fechainicial">Seleccione Fecha Inicial	
		<input type="date" name="fechainicial" id="fechainicial" class="form-control"  autocomplete="off"></label>
		</div>
		
		
		<div class="form-group">
		<label for="fechainicial">Seleccione Fecha Final
		<input type="date" name="fechafinal" id="fechafinal" class="form-control"  autocomplete="off"></label>
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
</div>

<!-- tabla aqui -->
<div class="row">
        <div class="col-md-12">
            <h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>

            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>Nombre Cliente</th>
                        <th>Cod Barra</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                        <th>Descuento</th>
                        <th>% Descuento</th>
                        <th>Total Pagado</th>
                        <th>Sucursal</th>
                        <th>Empleado Facturo</th>
                       </tr>
                </thead>
                <tbody>
                    <?php
                    $cnt = 1;
                    $total=0;
                    while ($row = pg_fetch_object($detalledeventas)) {
                       $total+=$row->total_linea;
                        ?>
                        <tr>
                            <td><?php echo $row->cliente_nombre; ?></td>
                            <td><?php echo $row->cod_barra; ?></td>
                            <td><?php echo $row->prod_nombre; ?></td>
                            <td><?php echo $row->precio; ?></td>
                            <td><?php echo $row->cantidad; ?></td>
                            <td><?php echo $row->tot; ?></td>
                            <td><?php echo $row->monto_descuento; ?></td>
                            <td><?php echo $row->porcdescuento; ?></td>
                            <td><?php echo $row->total_linea; ?></td>
                            <td><?php echo $row->sucursal_nombre; ?></td>
                            <td><?php echo $row->creada_por; ?></td>
                            
                        </tr>
                    <?php
                        $cnt = $cnt + 1;
                    }
                    ?>
                </tbody>
                
                 
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
    $(document).ready(function(){
        // Manejar el evento click del botón
        $("#seleccionarTodas").click(function(){
        console.log("evento clic disparado");
            // Seleccionar todas las opciones del select
            $("#sucursal option").prop("selected", true);
        });
    });
</script>

<script>
    $(document).ready(function(){
        // Obtener la fecha actual en formato 'Año-Mes-Día'
        var fechaActual = new Date().toISOString().split('T')[0];
        
        // Establecer la fecha actual como valor por defecto
        $("#fechainicial").val(fechaActual);
        $("#fechafinal").val(fechaActual);
    });
</script>
<script>
    function setFormAction() {
        var selectedOption = document.getElementById('select').value;

        if (selectedOption == 1) {
    document.forms['marcas'].action = 'detalle_descuentos_excel.php';
} else if (selectedOption == 2) {
    document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
}

        return true;
    }
</script>
		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
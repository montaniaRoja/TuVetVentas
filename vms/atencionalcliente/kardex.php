<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
check_login();


if(isset($_POST['submit']))
{
    
    $codigo=$_REQUEST['codigo'];
    $nombre=$_REQUEST['nombre'];
    $sucursal=$_REQUEST['sucursal'];
    list($idSucursal, $nombreSucursal) = explode('|', $_POST['sucursal']);
    $kardex=pg_query($db,"select * from kardex k join productos p on k.codbarra=p.prod_codbarra
                             join sucursales s on k.sucursal_id=s.id 
                            where k.codbarra='$codigo' and sucursal_id='$idSucursal' order by fecha_transaccion");
    
    
    
}


?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Kardex</title>
		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
		<script	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
		<link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		
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
<h1 class="mainTitle">Kardex</h1>
</div>
<ol class="breadcrumb">
<li>
<span></span>
</li>
<li class="active">
<span>Kardex</span>
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
<h5 class="over-title margin-bottom-15"><span class="text-bold">Consulta de Kardex</span></h5>


<form role="form" name="marcas" method="post" >
        <div class="form-group">
		<label for="codigo">Codigo</label>	
		<input type="text" name="codigo" id="codigo" class="form-control"  autocomplete="off" placeholder="Ingrese codigo">
		<ul id="listaCode" ></ul>
		</div>
		
		<div class="form-group">
		<label for="Nombre Producto">Nombre Producto</label>	
		<input type="text" name="nombre" id="nombre" class="form-control"  autocomplete="off" placeholder="Ingrese codigo">
		</div>
		
		 <div class="form-group">
		<label for="fechainicial">Seleccione Fecha Inicial	
		<input type="date" name="fechainicial" id="fechainicial" class="form-control"  autocomplete="off"></label>
		
		
		
		
		<label for="fechainicial">Seleccione Fecha Final
		<input type="date" name="fechafinal" id="fechafinal" class="form-control"  autocomplete="off"></label>
		</div>
		
		
		<div class="form-group">
		<label for="sucursal">
		Sucursal
		</label>
		<select name="sucursal" id="sucursal" class="form-control" >
    	<option value="" disabled selected>Seleccione sucursal</option>
    	<?php 
    	$codigoCd=7;
    	$query2 = "SELECT id, sucursal_nombre FROM sucursales ORDER BY sucursal_nombre";
        $consulta = pg_query($db, $query2);

        while ($obj1 = pg_fetch_object($consulta)) {
        $valor_concatenado = $obj1->id . '|' . $obj1->sucursal_nombre;
        ?>
        <option value="<?php echo $valor_concatenado; ?>">
            <?php echo $obj1->sucursal_nombre; ?>
        </option>
    	<?php } ?>
		</select>

		<br>
		</div>	
		
		<button type="submit" name="submit" class="btn btn-o btn-primary">
															buscar
														</button>
														
		
        </form>

<script>
    $(document).ready(function() {
        <?php if (isset($_POST['submit'])) : ?>
            $('#kardexModal').modal('show');
        <?php endif; ?>
    });
</script>

<div class="modal fade" id="kardexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	

  <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
     <div class="modal-content">
      <div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Movimientos de producto</h5>
<div><h3><?php echo $nombre;?></h3></div>         
<div><h3><?php echo $nombreSucursal;?></h3></div>                                                   
      </div>
   <div class="modal-body">
<table id="example" class="display compact" style="width:100%">
    <thead>
        <tr>
            <th>Fecha</th>
            <th>Documento</th>
            <th>Descripcion</th>
            <th>Ingreso</th>
            <th>Salida</th>
            <th>Saldo</th>
        </tr>
    </thead>      
    <tbody>
        <?php 
        $ingresos_totales = 0;
        $salidas_totales = 0;
        $saldos = 0;
        
        while($row = pg_fetch_object($kardex)){
            ?>
            <tr>
                <td><?php echo $row->fecha_transaccion; ?></td>
                <td><?php echo $row->doc_no; ?></td>
                <td><?php echo $row->descripcion; ?></td>
                <td><?php echo $row->cant_ingreso; ?></td>
                <?php 
                $ingresos = $row->cant_ingreso;
                $ingresos_totales += $ingresos;
                ?>
                <td><?php echo $row->cant_salio; ?></td>
                <?php 
                $salidas = $row->cant_salio;
                $salidas_totales += $salidas;
                $saldos = $saldos + $ingresos - $salidas;
                ?>
                <td><?php echo $saldos; ?></td>
            </tr>
            <?php 
        }
        ?>
    </tbody>
    
    <tfoot>
        <tr>
            <td colspan="3">Totales</td>
            <td><?php echo $ingresos_totales; ?></td>
            <td><?php echo $salidas_totales; ?></td>
            <td><?php echo $saldos; ?></td>
        </tr>
    </tfoot>
          
</table>


 

</div>


<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location();">Cerrar</button>

 
</div>  
  
  
 
  

</div>
</div>
</div>


</div>
</div>
</div>
</div>
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
            new DataTable('#example');

		</script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		
		<script src="js/kardex.js"></script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
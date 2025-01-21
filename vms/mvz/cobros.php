<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
check_login();



if(isset($_GET['del']))
{
    $idborrado=$_REQUEST['id'];
    $validado=0;
    pg_query($db,"delete from dfacturas where id_hfactura = '$idborrado' and validado_sn='$validado'");
    pg_query($db,"delete from hfacturas where id = '$idborrado' and pagada_sn='$validado' and anulada='$validado'");
    $_SESSION['msg']="datos eliminados !!";
    
    
    
}



?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Cobros</title>
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
		
		
    <script src="js/tiposdecobro.js"></script>


		
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
<h1 class="mainTitle">Cobros</h1>
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
<h5 class="over-title margin-bottom-15"><span class="text-bold">Cobro de Facturas</span></h5>

<table id="example" class="display" style="width: 100%">
									<thead>
										<tr>
											<th class="center">#</th>
											<th>Id Factura</th>
											<th>Fecha</th>
											<th>Vendedor</th>
											<th>Nombre Cliente</th>
											<th>Total</th>
											<th>Accion</th>


										</tr>
									</thead>
									<tbody>
<?php
$cerrada='S';
$sql = pg_query($db, "select * from hfacturas where lineas_factura>0 and pagada_sn=0 and id_sucursal='$_SESSION[sucursal]' and f_cerrada='$cerrada' order by id;");
$cnt = 1;
while ($row = pg_fetch_object($sql)) {
    ?>

											<tr>
											<td class="center"><?php echo $cnt;?>.</td>
											<td><?php echo $row->id;?></td>
											<td class="hidden-xs"><?php echo $row->fecha_creacion;?></td>

											<td><?php echo $row->creada_por;?></td>
											<td><?php echo $row->nombre_cliente;?></td>
											<td><?php echo $row->total_linea;?></td>
											<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs">

													<!-- <a href="cobrarfactura.php"
														class="btn btn-transparent btn-xs" tooltip-placement="top"
														tooltip="Edit"><i class="bi bi-currency-dollar"></i></a>  -->
														
														
														<a href="#" data-toggle="modal" data-id="<?php echo $row->id; ?>" 
														data-nombre="<?php echo $row->nombre_cliente; ?>"
														data-condicion="<?php echo $row->condicion_pago; ?> "
														 data-estado="<?php echo $row->f_cerrada; ?> "
														data-total="<?php echo $row->total_linea; ?>" data-target="#myModal">
                                                        <i class="bi bi-currency-dollar"></i>
                                                 		</a>
														
														
														
														<a href="editarfacturas.php?id=<?php echo $row->id;?>" class="btn btn-transparent btn-xs" 
														tooltip-placement="top" tooltip="Edit"><i class="fa fa-pencil"></i></a>

														
														
														<a
														href="cobros.php?id=<?php echo $row->id?>&del=delete"
														onClick="return confirm('Are you sure you want to delete?')"
														class="btn btn-transparent btn-xs tooltips"
														tooltip-placement="top" tooltip="Remove"><i
														class="bi bi-trash"></i></a>
														
														
														
														
												</div>
												<div class="visible-xs visible-sm hidden-md hidden-lg">
													<div class="btn-group" dropdown is-open="status.isopen">
														<button type="button"
															class="btn btn-primary btn-o btn-sm dropdown-toggle"
															dropdown-toggle>
															<i class="fa fa-cog"></i>&nbsp;<span class="caret"></span>
														</button>
														<ul class="dropdown-menu pull-right dropdown-light"
															role="menu">
															<li><a href="#"> Edit </a></li>
															<li><a href="#"> Share </a></li>
															<li><a href="#"> Remove </a></li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
											
											<?php
    $cnt = $cnt + 1;
}
?>
											
											
										</tbody>
								</table>




<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
    
	

  <div class="modal-dialog" role="document">
     <div class="modal-content">
      <div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Cobrar la factura con id no.</h5>         
                                                    
      </div>
   <div class="modal-body">




<form id="cobroForm" method="post" name="submit" action="procesarcobro.php">
<input type="hidden" name="idFactura" id="idFacturaInput">


	<div class="form-group">
   <label for="factura">Ingrese numero de factura :</label>
   <input name="factura" id="factura" placeholder="numero factura" class="form-control wd-450 text-right" required onChange="mostrar()">
   <div id="codigoStatus"></div></div>
    
   
  
                          
<div class="form-group">
   <label for="nombreClienteInput">Nombre del Cliente :</label>
 <input type="text" name="nombreCliente" id="nombreClienteInput" class="form-control wd-450 text-right" disabled>
 <input type="hidden" name="nombreCliente02" id="nombreClienteInput02" class="form-control wd-450 text-right">
 
 </div>
  

  <div class="form-group">
   <label for="totalInput">Total a Cobrar :</label>
    <input type="text" name="total" id="totalInput" class="form-control wd-450 text-right" disabled>
    <input type="hidden" name="total02" id="total02Input" class="form-control wd-450 text-right">
    <input type="hidden" name="condicion" id="condicionInput" class="form-control wd-450 text-right" step="0.01" min="0" value="0">
  </div>
    
      
  <div class="form-group">
   <label for="tipodepago">Tipo de Pago :</label>
    <select name="tipodepago" class="form-control wd-450 text-right">
    <option value="Seleccione tipo de pago" selected>Seleccione Tipo de pago</option>
  <option value="Efectivo" id="opcionEfectivo">Efectivo</option>
  <option value="Tarjeta" id="opcionTarjeta">Tarjeta</option>
  <option value="Tarjeta/Efectivo" id="opcionCombinacion">Tarjeta / Efectivo</option>
  <option value="Credito" id="opcionCredito">Credito</option>
	</select>
	</div>
  
  <div class="form-group">
   <label for="efectivo">Efectivo:</label>
    <input type="text" name="efectivo" id="efectivo" class="form-control wd-450 text-right"  step="0.01" min="0" value="0" disabled>
    <input type="hidden" name="copiaefectivo" placeholder="" class="form-control wd-450 text-right"  step="0.01" min="0" value="0">
  </div>
  
  <div class="form-group">
   <label for="tarjeta">Tarjeta :</label>
    <input type="text" name="tarjeta" disabled class="form-control wd-450 text-right"  step="0.01" min="0" value="0">
    <input type="hidden" name="copiatarjeta" placeholder="" class="form-control wd-450 text-right"  step="0.01" min="0" value="0">
  </div>
  
 <div class="form-group">
   <label for="credito">Credito:</label>
    <input type="text" name="credito" disabled class="form-control wd-450 text-right"  step="0.01" min="0" value="0">
    <input type="hidden" name="copiacredito" class="form-control wd-450 text-right"  step="0.01" min="0" value="0">
  </div>
  
    
  <div class="form-group">
   <label for="autorizacion">Numero de Autorizacion:</label>
    <input name="autorizacion" placeholder="" class="form-control wd-450 text-right">
  </div>
  
  <div class="form-group">
   <label for="recibido">Efectivo Recibido:</label>
    <input type="text" name="recibido" class="form-control wd-450 text-right" step="0.01" min="0" value="0">
  </div>
  
  <div class="form-group">
   <label for="cambio">Cambio a entregar al cliente:</label>
    <input type="text" name="cambio" class="form-control wd-450 text-right"  onchange="checkInputValue()">
	</div> 

 <input type="hidden" class="form-control" name="fecha" id="fecha">
 <input type="hidden" class="form-control" name="hora" id="hora">
     

<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location.reload();">Volver a la Lista</button>

 <button type="submit" name="cobrar" id="cobrar" class="btn btn-primary" disabled>Procesar cobro</button>
</div>
</form>
 
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
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
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
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script src="js/tiposdecobro.js"></script>
	
		
		<script type="text/javascript">
            new DataTable('#example');

		</script>
		
		<script>
        function mostrar() {
    
    // Obtener la fecha y hora actual
    var fechaActual = new Date();
    var fecha = fechaActual.getFullYear() + '-' + (fechaActual.getMonth() + 1) + '-' + fechaActual.getDate();
    var hora = fechaActual.getHours() + ':' + fechaActual.getMinutes() + ':' + fechaActual.getSeconds();

    // Asignar la fecha y la hora a los elementos con ID "fecha" y "hora"
    
    document.getElementById("fecha").value = fecha;
    document.getElementById("hora").value = hora;
    
    
    
    
}

        
        
        
    </script>
		
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		
		<script>
$(document).ready(function() {
    $("#factura").on("input", function() {
        var codigo = $(this).val();

        if (codigo.trim() !== "") {
            $.ajax({
                type: "POST",
                url: "verificar_numero.php", 
                data: { codigo: codigo },
                success: function(response) {
                    if (response === "existe") {
                    	console.log("numero existe");
                        $("#codigoStatus").text("El código ya existe en la base de datos.");
                        
                    } else {
                        $("#codigoStatus").text("");
                    }
                }
            });
        } else {
            $("#codigoStatus").text("");
        }
    });
});
</script>
		
		
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
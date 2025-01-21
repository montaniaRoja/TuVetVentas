<?php
session_start();
//error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}


if(isset($_GET['del']))
{
  $query2=("delete from proveedores where id = '".$_REQUEST['id']."'");
  $query2=pg_query($query2);
  if(!$query2){
      echo "<script>alert('Error al borrar proveedor');</script>";
  }
  $_SESSION['msg']="datos eliminados !!";
  echo "<script>window.location.href='proveedores.php'</script>";
    
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Agregar Proveedores</title>
		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
		<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
		
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
									<h1 class="mainTitle">Agregar Proveedores</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Agregar Proveedores</span>
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
													<h5 class="panel-title">Agregar Proveedores</h5>
												</div>
												<div id="notificacion">
													
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" name="proveedores" id="proveedores">
														<div class="form-group">
															<label for="vendorname">
																Proveedor
															</label>
							<input type="text" name="vendorname" id="vendorname" class="form-control"  autocomplete="off" placeholder="Ingrese nombre del Proveedor" required>
														</div>
												<div class="form-group">
															<label for="vendornit">
																NIT
															</label>
							<input type="text" name="vendornit" class="form-control"  id="vendornit" autocomplete="off" pattern="[0-9-]{4][0-9-]{6}[0-9-]{3}[0-9]{1}" placeholder="0000-000000-000-0">
														</div>
														<div class="form-group">
															<label for="vendornrc">
																NRC
															</label>
							<input type="text" name="vendornrc" id="vendornrc" class="form-control"  pattern= "[0-9-]{6][0-9]{1}" autocomplete="off" placeholder="000000-0">
														</div>
														<div class="form-group">
															<label for="vendoremitir">
																Emitir Cheques a
															</label>
							<input type="text" name="vendoremitir" id="vendoremitir" class="form-control"  autocomplete="off" placeholder="Ingrese nombre en los cheques" required>
														</div>
														<div class="form-group">
															<label for="vendordireccion1">
																Direccion Linea 1
															</label>
							<input type="text" name="vendordireccion1" id="vendordireccion1" class="form-control"  autocomplete="off" placeholder="Ingrese Direccion">
														</div>
														<div class="form-group">
															<label for="vendordireccion2">
																Direccion Linea 2
															</label>
							<input type="text" name="vendordireccion2" id="vendordireccion2" class="form-control"  autocomplete="off" placeholder="Ingrese Direccion">
														</div>
														<div class="form-group">
															<label for="vendortelefono">
																Telefono
															</label>
							<input type="tel" name="vendortelefono" id="vendortelefono" class="form-control"  autocomplete="off" placeholder="(codigo pais) numero">
														</div>
														
														<div class="form-group">
															<label for="vendorcorreo">
																Correo Electronico
															</label>
							<input type="email" name="vendorcorreo" id="vendorcorreo" class="form-control"  autocomplete="off" placeholder="uncorreo@correo.com">
														</div>
														
														<div class="form-group">
															<label for="vendorcontacto">
																Nombre de contacto
															</label>
							<input type="text" name="vendorcontacto" id="vendorcontacto" class="form-control"  autocomplete="off" placeholder="a quien contactar" required>
														</div>
														
														<button type="button" name="submit" id="submit" class="btn btn-o btn-primary">
															Submit
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
									<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Proveedores</span></h5>
									
									<table id="example" class="display" style="width:100%">	
										<thead>
											<tr>
												<th class="center">#</th>
												<th>Nombre</th>
												<th>Contacto</th>
												<th>Telefono</th>
												<th>Correo</th>
												<th>Cheque</th>
												<th>Accion</th>
												
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select * from proveedores where prov_nombre!='Seleccione proveedor'");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $cnt;?></td>
												
												<td class="hidden-xs"><?php echo $row->prov_nombre;?></td>
												
												<td><?php echo $row->prov_nombrecontacto;?></td>
												
												<td><?php echo $row->prov_telefono;?></td>
												
												<td><?php echo $row->prov_correo;?>
												
												<td><?php echo $row->prov_nombrecheque;?></td>
												
												<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs">
							<a href="editarproveedores.php?id=<?php echo $row->id;?>" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Edit"><i class="fa fa-pencil"></i></a>
													
	<a href="proveedores.php?id=<?php echo $row->id?>&del=delete" onClick="return confirm('Are you sure you want to delete?')"class="btn btn-transparent btn-xs tooltips" tooltip-placement="top" tooltip="Remove"><i class="fa fa-times fa fa-white"></i></a>
												</div>
												<div class="visible-xs visible-sm hidden-md hidden-lg">
													<div class="btn-group" dropdown is-open="status.isopen">
														<button type="button" class="btn btn-primary btn-o btn-sm dropdown-toggle" dropdown-toggle>
															<i class="fa fa-cog"></i>&nbsp;<span class="caret"></span>
														</button>
														
													</div>
												</div></td>
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
		document.addEventListener('DOMContentLoaded', function() {
  		applyNitMask('vendornit', '0000-000000-000-0');
});	
		
		</script>
		<script>
		document.addEventListener('DOMContentLoaded', function() {
  		applyNrcMask('vendornrc', '000000-0');
});	
		
		</script>
		
		<script>
		document.addEventListener('DOMContentLoaded', function() {
  		applyTelMask('vendortelefono', '(000)0000-0000');
});	
		
		</script>
		
		<script>
$(document).ready(function(){
    $('#submit').click(function(){
        if (validateForm()) {
            var formData = $('#proveedores').serialize();
            $.ajax({
                type: 'POST',
                url: './ajax/guardar_proveedor.php',
                data: formData,
                success: function(response){
                    $('#respuesta').html(response);
                    document.getElementById("notificacion").style.color = "#008f39";
                    document.getElementById("notificacion").innerHTML="Proveedor Creado Exitosamente!";
                    const myTimeout = setTimeout(myGreeting, 1000);
                    
                    function myGreeting() {
                        location.reload();
                    }
                }
            });
        } else {
           document.getElementById("notificacion").style.color = "#ff0000";
           document.getElementById("notificacion").innerHTML="Favor rellene todos los campos!";
        }
    });
    
    function validateForm() {
       
        var nombre = $('#vendorname').val();
        var nit = $('#vendornit').val();
        var nrc = $('#vendornrc').val();
        var emitir = $('#vendoremitir').val();
        var dir1 = $('#vendordireccion1').val();
        var dir2 = $('#vendordireccion2').val();
        var tel = $('#vendotelefono').val();
        var correo = $('#vendocorreo').val();
        var contacto = $('#vendocontacto').val();
                
        if (nombre == '' || nit == '' || nrc == '' || emitir == '' || dir1 == '' || tel == '' || correo == '' || contacto == '') {
            return false; // La validación falla si algún campo obligatorio está vacío
        }
         
        return true; // Retorna true si todos los campos pasan la validación
    }
});
</script>


				
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
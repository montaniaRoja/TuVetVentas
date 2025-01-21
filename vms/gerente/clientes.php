<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
$fecha_actual = date("Y-m-d H:i:s");
if(isset($_POST['submit']))
{//if del submit
    
    $idCreador=$_SESSION['userid'];
    $consultaMaxIdCl="select MAX(id) from clientes";
    $maxIdResultado=pg_query($db,$consultaMaxIdCl);
    $maxIdCliente=pg_fetch_result($maxIdResultado, 0,0);
    $siguienteId=$maxIdCliente+1;
    
    
    
    $tipodoc=$_REQUEST['tipodocumento'];
     if($_REQUEST['empresa']=="on"){
        $empresa=1;
    }
    else{
        $empresa=0;
    }
    
    if($_REQUEST['credito']=="on"){
        $credito=1;
    }
    else{
        $credito=0;
    }
    
    if($_REQUEST['puntos']=="on"){
        $puntos=1;
    }
    else{
        $puntos=0;
    }

	$nombre=$_REQUEST['nombre'];
    
    
    
    $query=("INSERT INTO clientes(id,cliente_nombre, cliente_tipodoc,cliente_nodoc,cliente_giro,cliente_dir1,
            cliente_dir2,cliente_tel,cliente_correo,esempresasn,darcreditosn,creado_por,fecha_creacion,cliente_saldos,gana_puntos, creadopor_id)
      VALUES ($siguienteId,'$nombre','$tipodoc','$_REQUEST[numdoc]','$_REQUEST[giro]','$_REQUEST[dir1]','$_REQUEST[dir2]',
            '$_REQUEST[tel]','$_REQUEST[correo]','$empresa','$credito','$_SESSION[login]','$fecha_actual',0,'$puntos','$idCreador')");
    $query=pg_query($db, $query);
    
    if(!$query){
        echo "<script>alert('Error al procesar la informacion posibles datos duplicados');</script>";
    }
    //pg_close();
    
    if($query){
        echo "<script>alert('Su informacion ha sido enviada');</script>";
    }
   
    
    
    echo "<script>window.location.href='clientes.php'</script>";
    
    
}//if del submit


if(isset($_GET['del']))
{
    $query2=("delete from clientes where id = '".$_REQUEST['id']."'");
    $query2=pg_query($db, $query2);
    if(!$query2){
        echo "<script>alert('Error hay registros en otras tablas que dependen de este registro');</script>";
    }
    $_SESSION['msg']="datos eliminados !!";
    echo "<script>window.location.href='clientes.php'</script>";
    
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Administrar Clientes</title>
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
									<h1 class="mainTitle">Agregar Clientes</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Agregar Clientes</span>
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
													<h5 class="panel-title">Agregar Clientes</h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" name="productos" method="post" >
														
														<div class="form-group">
															<label for="tipodocumento">
																Tipo de Documento
															</label>
															<select id="tipodocumento" name="tipodocumento" class="form-control" onchange="habilitarCampos()">
                                                              <option value="0" selected>Seleccione Tipo de Documento</option>
                                                              <option value="1" >DUI</option>
                                                              <option value="2">Tarjeta de Identidad</option>
                                                              <option value="3">Pasaporte</option>
                                                              <option value="4" >NRC</option>
                                                              <option value="5">RTN</option>
                                                            </select>
							
														</div>
														<div class="form-group">
															
							<input id="numdoc" type="text" name="numdoc" class="form-control"  autocomplete="off" required placeholder="Numero de documento sin guiones" disabled>
														</div>		
														
														
														
														<div class="form-group">
							
							<input type="hidden" id="docfinal" name="docfinal" class="form-control"  autocomplete="off" >
							</div>
														
																												
														<div class="form-group">
															<label for="inputData">
																Nombre del Cliente
															</label>
							<input id="nombre" type="text" required name="nombre" class="form-control"  autocomplete="off" placeholder="Nombre del Cliente" disabled>
														</div>

							<div class="form-group">
							<label>
							<input type="checkbox" id="empresa" name="empresa" >Es empresa?</label>
							
							<label>
							<input type="checkbox" id="credito" name="credito" >Dar Credito?</label>
							
							<label>
							<input type="checkbox" id="puntos" name="puntos" checked>Acumula Puntos?</label>
							
							</div>																				
							
								
										
														
							<div class="form-group">
							<label for="inputData">
							Giro
							</label>
							<input id="giro" type="text" name="giro" class="form-control"  autocomplete="off" placeholder="Giro si es empresa">
							</div>
													
							<div class="form-group">
							<label for="inputData">
							Direccion Linea 1
							</label>
							<input id="dir1" type="text" name="dir1" class="form-control"  autocomplete="off" placeholder="Direccion">
							</div>
														
							<div class="form-group">
							<label for="inputData">
							Direccion Linea 2
							</label>
							<input id="dir2" type="text" name="dir2" class="form-control"  autocomplete="off" placeholder="Direccion">
							</div>
														
							<div class="form-group">
							<label for="inputData">
							Telefono
							</label>
							<input type="tel" name="tel" id="telefono" class="form-control"  autocomplete="off" placeholder="(codigo de pais)numero" required>
							</div>
										
							<div class="form-group">
							<label for="inputData">
							correo
							</label>
							<input id="correo" type="email" name="correo" class="form-control"  autocomplete="off" placeholder="oncorreo@yaju.com">
							</div>							
														
														
														
														
							<button id="submit" type="submit" name="submit" class="btn btn-o btn-primary">
							Submit
							</button>
							</form>
												
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
									<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Clientes</span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>id</th>
												<th>Nombre</th>
												<th>No Documento</th>
												<th>Telefono</th>
												<th>Correo</th>
												<th>Creado por</th>
												<th>Puntos Acumulados</th>
												<th>Puntos Redimidos</th>
												
												<th>Edit/Eliminar</th>																				
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"
select c.id, c.cliente_nombre, c.cliente_nodoc,c.cliente_tel, c.cliente_correo, e.nombre_empleado as empleado_crea ,sum(p.monto_acumulado) as acumulado, sum(p.monto_redimido) as redimido
from clientes c
left join puntos_clientes p
on c.id=p.id_cliente
join tbl_empleados e
	on e.id=c.creadopor_id
group by c.id, c.cliente_nombre, c.cliente_nodoc, c.cliente_tel, c.cliente_correo, e.nombre_empleado;
");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $cnt;?>.</td>
												<td class="hidden-xs"><?php echo $row->id;?></td>
												<td class="hidden-xs"><?php echo $row->cliente_nombre;?></td>
												<td><?php echo $row->cliente_nodoc;?></td>
												<td><?php echo $row->cliente_tel;?></td>
												<td><?php echo $row->cliente_correo;?></td>
												<td><?php echo $row->empleado_crea;?></td>
												<td><?php echo $row->acumulado;?></td>
												<td><?php echo $row->redimido;?></td>
												
												<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs">
							<a href="editarclientes.php?id=<?php echo $row->id;?>" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Edit"><i class="fa fa-pencil"></i></a>
													
	<a href="clientes.php?id=<?php echo $row->id?>&del=delete" onClick="return confirm('Are you sure you want to delete?')"class="btn btn-transparent btn-xs tooltips" tooltip-placement="top" tooltip="Remove"><i class="fa fa-times fa fa-white"></i></a>
												</div>
												<div class="visible-xs visible-sm hidden-md hidden-lg">
													<div class="btn-group" dropdown is-open="status.isopen">
														<button type="button" class="btn btn-primary btn-o btn-sm dropdown-toggle" dropdown-toggle>
															<i class="fa fa-cog"></i>&nbsp;<span class="caret"></span>
														</button>
														<ul class="dropdown-menu pull-right dropdown-light" role="menu">
															<li>
																<a href="#">
																	Edit
																</a>
															</li>
															<li>
																<a href="#">
																	Share
																</a>
															</li>
															<li>
																<a href="#">
																	Remove
																</a>
															</li>
														</ul>
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
  var selectElement = document.getElementById("tipodocumento");
  var numdocInput = document.getElementById("numdoc");

  selectElement.addEventListener("change", function() {
    var selectedValue = selectElement.value;

    if (selectedValue === "1") {
      applyDuiMask('numdoc', '00000000-0');
    } else if (selectedValue === "2") {
      applyIdMask('numdoc', '0000-0000-00000');
    }
    else if (selectedValue === "3") {
      applyPasMask('numdoc', '000000');
    }
    else if (selectedValue === "4") {
      applyNrcMask('numdoc', '000000-0');
    }
    else if (selectedValue === "4") {
      applyRtnMask('numdoc', '0000-0000-000000');
    }
  });
</script>
<script>
	function habilitarCampos(){
		document.getElementById('numdoc').disabled=false;
		document.getElementById('nombre').disabled=false;
	}
</script>
	
		
		<script>
		document.addEventListener('DOMContentLoaded', function() {
  		applyTelMask('telefono', '(000)0000-0000');
});	
		
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
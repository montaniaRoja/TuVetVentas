<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}

$fecha_actual=date("Y-m-d");
if(isset($_POST['submit']))
{
    
    $consultaMaxIdCl="select MAX(id) from marcas";
    $maxIdResultado=pg_query($db,$consultaMaxIdCl);
    $maxIdCliente=pg_fetch_result($maxIdResultado, 0,0);
    $siguienteId=$maxIdCliente+1;
    
    //echo $_REQUEST[fullname];
    $query=("INSERT INTO marcas (id,marca_nombre,marca_paisorigen,proveedor_id,creadapor,fecha_creacion,activosn,sucursal_crea)
      VALUES ($siguienteId,'$_REQUEST[nuevamarca]','$_REQUEST[pais]','$_REQUEST[proveedor]','$_SESSION[login]','$fecha_actual',1,'$_SESSION[sucursal]' )");
    $query=pg_query($query);
    if(!$query){
        echo "<script>alert('Error al procesar la informacion posibles datos duplicados');</script>";
    }
    pg_close();
    if($query){
    echo "<script>alert('Su informacion ha sido enviada');</script>";
    }
    echo "<script>window.location.href='marcas.php'</script>";
}

if(isset($_GET['del']))
{
    pg_query($db,"delete from marcas where marcas.id = '".$_REQUEST['id']."'");
    $_SESSION['msg']="datos eliminados !!";
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Registrar Marcas</title>
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
		<link href="vendor/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
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
									<h1 class="mainTitle">Agregar Marcas</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Agregar Marcas</span>
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
													<h5 class="panel-title">Agregar Marcas</h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													<form role="form" name="marcas" method="post" >
														<div class="form-group">
															<label for="inputData">
																Marca
															</label>
							<input type="text" name="nuevamarca" class="form-control"  autocomplete="off" placeholder="Ingrese la marca">
														</div>
												
														<div class="form-group">
															<label for="inputData">
																Pais de Origen
															</label><br>
															<select name="pais" id="pais">
															<?php 
															$paises="SELECT id,nombre_pais FROM paises order by nombre_pais";
															$resultado=pg_query($db,$paises);
															while($obj1=pg_fetch_object($resultado)){   ?>
															
															
    														<option value="<?php echo $obj1->nombre_pais ?>"><?php echo $obj1->nombre_pais;?></option>
   															
   															<?php }?>
   															</select>
														</div>
														
														<div class="form-group">
															<label for="inputData">
																Proveedor
															</label><br>
															<select name="proveedor" id="proveedor">
															<?php 
															$query2="SELECT id,prov_nombre FROM proveedores order by prov_nombre";
															$consulta=pg_query($db,$query2);
															while($obj1=pg_fetch_object($consulta)){   ?>
															
															
    														<option value="<?php echo $obj1->id ?>"<?php if($obj1->prov_nombre=='Seleccione proveedor'){echo "selected";}?>><?php echo $obj1->prov_nombre;?></option>
   															
   															<?php }?>
   															</select>
														</div>
														
														
														
														<button type="submit" name="submit" class="btn btn-o btn-primary">
															Guardar
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
									<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Marcas</span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>Marca</th>
												<th>Pais Origen</th>
												<th>Proveedor</th>
												<th></th>
												
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select marcas.id, marca_nombre, marca_paisorigen, prov_nombre from marcas join proveedores on proveedor_id=proveedores.id where marca_nombre!='Seleccione marca';");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $cnt;?>.</td>
												<td class="hidden-xs"><?php echo $row->marca_nombre;?></td>
												
												<td><?php echo $row->marca_paisorigen;?></td>
												<td><?php echo $row->prov_nombre;?></td>
												
												<td >
												<div class="visible-md visible-lg hidden-sm hidden-xs">
							<a href="editarmarcas.php?id=<?php echo $row->id;?>" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Edit"><i class="fa fa-pencil"></i></a>
													
	<a href="marcas.php?id=<?php echo $row->id?>&del=delete" onClick="return confirm('Are you sure you want to delete?')"class="btn btn-transparent btn-xs tooltips" tooltip-placement="top" tooltip="Remove"><i class="fa fa-times fa fa-white"></i></a>
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
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
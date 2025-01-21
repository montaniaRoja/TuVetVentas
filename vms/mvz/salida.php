<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();

class salida{
    
    public $fecha;
    public $sucursal_id;
    public $codbarra;
    public $cantidad;
    public $detalle;
    public $usuario_crea;
    public $usuario_autoriza;
    public $estado;
    
    
    public function __construct($fecha, $sucursal_id, $codbarra, $cantidad, $detalle, $usuario_crea, $usuario_autoriza, $estado) {
        $this->fecha = $fecha;
        $this->sucursal_id = $sucursal_id;
        $this->codbarra = $codbarra;
        $this->cantidad = $cantidad;
        $this->detalle = $detalle;
        $this->usuario_crea = $usuario_crea;
        $this->usuario_autoriza = $usuario_autoriza;
        $this->estado = $estado;
    }
    
    
    public function guardarSalida($conexion) {
        
        $query = "INSERT INTO salidas (fecha, sucursal_id, codbarra, cantidad, detalle, usurio_procesa, usuario_autoriza, estado)
                  VALUES ($1, $2, $3, $4, $5, $6, $7, $8)";
        
        $params = array($this->fecha, $this->sucursal_id, $this->codbarra, $this->cantidad, $this->detalle, $this->usuario_crea, $this->usuario_autoriza, $this->estado);
        
        $result = pg_query_params($conexion, $query, $params);
        
        if ($result) {
            //echo "salida guardada exitosamente";
            Header("Location: salida.php");
        } else {
            echo "Error al guardar la salida: " . pg_last_error($db);
        }
        
    }
}




if(isset($_POST['submit'])){
    
    $fecha_actual=date("Y-m-d");
    $sucursal=$_SESSION['sucursal'];
    $cod_barra=$_REQUEST['codbarra'];
    $cantidad=$_REQUEST['cantidad'];
    $detalle=$_REQUEST['motivo'];
    $usuarioP=$_SESSION['login'];
    var_dump($usuarioP);
    $estado="Pendiente";
    $usuarioA="";
    $salida=new salida($fecha_actual,$sucursal,$cod_barra,$cantidad,$detalle,$usuarioP,$usuarioA,$estado);
    
    if ($db) {
        //echo "conexion ok";
        $salida->guardarSalida($db);
        pg_close($db);
        
        
    } else {
        //  echo "<script>alert('Error al procesar la informacion posibles datos duplicados');</script>";
    }
    
}//if del submit


?>
<!DOCTYPE html>	
<html lang="en">
	<head>
		<title>Admin | Salidas de Productos</title>
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
									<h1 class="mainTitle">Ajustes Salidas de Productos</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Salidas Productos</span>
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
													<h5 class="panel-title">Salidas Productos</h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
													
													<form role="form" name="productos" method="post" enctype="multipart/form-data">
														<div class="form-group">
															<label for="codbarra">
																Codigo
															</label>
							<input id="codbarra" type="text" name="codbarra" class="form-control"  autocomplete="off" placeholder="Ingrese el codigo del producto" autofocus>
							<div id="codigoStatus" class="msgalerta"></div>
														</div>
														
														
														
												<div class="form-group">
															<label for="nombre">
																Nombre
															</label>
							<input id="nombre" type="text" name="nombre" class="form-control"  autocomplete="off" placeholder="Nombre principal del producto" disabled>
														</div>
														<!-- script para que el lector de codigo de barra capture el codigo y salte al campo nombre -->
														
														
														
														
														<div class="form-group">
															<label for="motivo">
																Justificacion del ajuste
															</label>
							<input id="motivo" type="text" required name="motivo" class="form-control"  autocomplete="off" placeholder="razon del ajuste">
														</div>
														
											<!-- inicia seleccionar la marca del producto -->			
															
							
							<div class="form-group">
							<label for="cantidad">Cantidad
							<input type="number" id="cantidad" name="cantidad" class="form-control" autocomplete="off" min="0" value="0"></label>
								</div>						
														
														<button id="submit" type="submit" name="submit" class="btn btn-o btn-primary">
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
									<h5 class="over-title margin-bottom-15">Salidas <span class="text-bold">Productos</span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>	
											<tr>	
												<th class="center">#</th>
												
												<th>Fecha</th>
												
												<th>Sucursal</th>
												<th>CodBarra</th>
												<th>Prod Nombre</th>
												<th>Cantidad</th>
												<th>Razon</th>
												<th>Usuario Procesa</th>
												<th>Estado</th>
												<th>Accion</th>											
												
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select s.id, s.fecha, s.sucursal_id,su.sucursal_nombre, s.codbarra, p.prod_nombre, s.cantidad, s.detalle, s.usurio_procesa, s.estado
from salidas s join productos p on s.codbarra=p.prod_codbarra
join sucursales su on s.sucursal_id=su.id where s.estado='Pendiente';");
$cnt=1;
while($row = pg_fetch_object($sql))
{
?>

											<tr>
												<td class="center"><?php echo $cnt;?>.</td>
												
												<td><?php echo $row->fecha;?></td>
												
												<td><?php echo $row->sucursal_nombre;?></td>
												<td><?php echo $row->codbarra;?></td>
												<td><?php echo $row->prod_nombre;?></td>
												<td><?php echo $row->cantidad;?></td>
												<td><?php echo $row->detalle;?></td>
												<td><?php echo $row->usurio_procesa;?></td>
												<td><?php echo $row->estado;?></td>
												<td>
												
												<div class="visible-md visible-lg hidden-sm hidden-xs">
                                                    <form id="confirmForm" action="procesarsalida.php" method="GET" onsubmit="return confirmAction()">
                                                        <input type="hidden" name="id" value="<?php echo $row->id; ?>">
                                                        <input type="hidden" name="suc" value="<?php echo $row->sucursal_id; ?>">
                                                        <input type="hidden" name="cod" value="<?php echo $row->codbarra; ?>">
                                                        <input type="hidden" name="qty" value="<?php echo $row->cantidad; ?>">
                                                        <input type="hidden" name="det" value="<?php echo $row->detalle; ?>">
                                                        <button type="submit" class="btn btn-transparent btn-xs" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            Autorizar
                                                        </button>
                                                    </form>
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
												</div>
												</td>
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
		
		
		<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        // Este código se ejecutará cuando el DOM esté completamente cargado
        new DataTable('#example');
    });
</script>

		
			
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
		<script>
    $(document).ready(function() {
        $("#codbarra").on("input", function() {
            var codigo = $(this).val();

            if (codigo.trim() !== "") {
                $.ajax({
                    type: "POST",
                    url: "buscarproducto.php",
                    data: { codigo: codigo },
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            // Actualiza el valor del input text con el nombre del producto
                            $("#nombre").val(response.nombre);
                        } else {
                            // Limpiar el nombre si no hay coincidencia
                            $("#nombre").val("");
                            alert("Error: " + response.error);
                        }
                    },
                    error: function () {
                        // Limpiar el nombre en caso de error
                        $("#nombre").val("");
                        alert("Error en la solicitud AJAX");
                    }
                });
            } else {
                // Limpiar el nombre si el código está vacío
                $("#nombre").val("");
            }
        });
    });
</script>
<script>
    function confirmAction() {
        var confirmed = confirm("¿Estás seguro de que deseas autorizar?");
        return confirmed;
    }
</script>
	</body>
</html>

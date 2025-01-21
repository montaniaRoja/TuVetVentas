<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

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
									<h1 class="mainTitle">Historial Puntos Clientes</h1>
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
									<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Clientes</span></h5>
									
									<table id="example" class="display" style="width:100%">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>id</th>
												<th>No Documento</th>
												<th>Nombre Cliente</th>
												<th>Conteo de Transacciones</th>
												<th>Puntos Acumulados</th>
												<th>Puntos Redimidos</th>
												<th>Saldo Puntos</th>
												<th>Ver Historial</th>
											</tr>
										</thead>
										<tbody>
<?php
$sql=pg_query($db,"select c.id as id_cliente, c.cliente_nombre, c.cliente_nodoc,c.cliente_tel, c.cliente_correo, COUNT(p.id) as num_transacciones, sum(p.monto_acumulado) as acumulado, sum(p.monto_redimido) as redimido
from clientes c
join puntos_clientes p
on c.id=p.id_cliente
group by c.id, c.cliente_nombre, c.cliente_nodoc, c.cliente_tel, c.cliente_correo;");
$cnt=1;
$saldo=0;
while($row = pg_fetch_object($sql))
{ $saldo=$row->acumulado-$row->redimido;
?>

											<tr>
												<td class="center"><?php echo $cnt;?>.</td>
												<td class="hidden-xs"><?php echo $row->id_cliente;?></td>
												<td class="hidden-xs"><?php echo $row->cliente_nodoc;?></td>
												<td><?php echo $row->cliente_nombre;?></td>
												<td><?php echo $row->num_transacciones;?></td>
												<td><?php echo $row->acumulado;?></td>
												<td><?php echo $row->redimido;?></td>
												<td><?php echo $saldo;?></td>
										
												
												<td>
												<!-- Button trigger modal -->
                                                <button type="button" class="btn btn-primary" 
                                                data-toggle="modal" data-target="#exampleModal" data-id="<?php echo $row->id_cliente; ?>">Historial</button>					
                                                </td>
											</tr>
											
											<?php 
$cnt=$cnt+1;
											 }?>
											
											
										</tbody>
									</table>
									
	
									<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
   <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Historial Puntos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalContent">
      
    
      </div>
      <div class="modal-footer">
      	<form action="puntos_excel.php" method="post">
      	<input type="hidden" id="codcliente" name="codcliente">
      	<button type="submit" name="btnExcel" class="btn btn-primary" >Excel</button>
        
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
		<script type="text/javascript">
            new DataTable('#example');

		</script>
		
		<script type="text/javascript">
            new DataTable('#example2');

		</script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		
		<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
    	
        var button = $(event.relatedTarget); // Button that triggered the modal
        var idValue = button.data('id'); // Extract info from data-* attributes

        $.ajax({
            type: 'POST',
            url: 'cargar_datos_modal.php',
            data: { id: idValue },
            success: function(response) {
                $('#modalContent').html(response);
                var codigoCliente=document.getElementById('codcliente');
                codigoCliente.value=idValue;
            },
            error: function(xhr, status, error) {
                console.error("Error al cargar los datos:", status, error);
            }
        });
    });
</script>

	</body>
</html>
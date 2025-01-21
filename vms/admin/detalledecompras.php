<?php


session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');


check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
	header("Location: logout.php");
	exit();
}

if (isset($_POST['submit'])) {
	$fechaInicial = $_REQUEST['fechainicial'];
	$fechaFinal = $_REQUEST['fechafinal'];
	$provId = $_REQUEST['proveedor'];
	$marcaId= $_REQUEST['selectmarca'];


	$detalledeventas = pg_query($db, "select cd.producto_codbarra, p.prod_nombre,c.cat_nombre, sum(cd.producto_cantidad) as cantidad,
sum(cd.producto_bonificacion) as bonificacion, sum(cd.producto_cantidadtotal) as ctotal,
sum(cd.producto_subtotal) as subtotal, sum(cd.producto_porciva) as iva,sum(cd.producto_totallinea) as totallinea,pr.prov_nombre as proveedor, m.marca_nombre as marca
from comprasdetalle cd
join productos p on cd.producto_codbarra=p.prod_codbarra
join categorias c on p.id_categorias=c.id
join comprasproductos cp
on cp.id=cd.compra_id
join proveedores pr 
on cp.proveedor_id=pr.id
join marcas m
on p.id_marca=m.id
where cp.compra_fecha between '$fechaInicial' and '$fechaFinal' and cp.proveedor_id='$provId' and m.id='$marcaId'
group by cd.producto_codbarra, p.prod_nombre, pr.prov_nombre, c.cat_nombre, m.marca_nombre
order by pr.prov_nombre;");
}



?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Detalle de Compras</title>
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
		<?php include('include/sidebar.php'); ?>
		<div class="app-content">
			<?php include('include/header.php'); ?>
			<div class="main-content">
				<div class="wrap-content container" id="container">
					<!-- start: PAGE TITLE -->
					<section id="page-title">
						<div class="row">
							<div class="col-sm-8">
								<h1 class="mainTitle">Detalle de Compras</h1>
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
												<h5 class="over-title margin-bottom-15"><span class="text-bold">Detalle de compras</span></h5>


												<form role="form" name="marcas" method="post" action="" onsubmit="return setFormAction();">

													<div class="form-group">
														<label for="inputData">
															Proveedor
														</label><br>
														<select name="proveedor" id="selectprov" onchange="cargarMarcas()">
															<?php
															$query2 = "SELECT id, prov_nombre FROM proveedores ORDER BY prov_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) { ?>
																<option value="<?php echo $obj1->id; ?>" <?php if ($obj1->prov_nombre == 'Seleccione proveedor') {
																												echo "selected";
																											} ?>><?php echo $obj1->prov_nombre; ?></option>
															<?php } ?>
														</select>

														<div class="mb-3">
															<label for="selectmarca" class="form-label">Marca</label><br>
															<select id="selectmarca" name="selectmarca">
																<!-- Aquí se llenarán las marcas -->
															</select>
														</div>


													</div>

													<div class="form-group">
														<label for="inputData">
															Seleccione Rango de Fechas

															<input type="date" name="fechainicial" class="form-control" autocomplete="off"><br>


															<input type="date" name="fechafinal" class="form-control" autocomplete="off"><br></label>
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

						<div class="row">
							<div class="col-md-12">
								<h5 class="over-title margin-bottom-15"><span class="text-bold"></span></h5>

								<table id="example" class="display" style="width:100%">
									<thead>
										<tr>
											<th>cod Barra</th>
											<th>Nombre Producto</th>
											<th>Marca</th>
											<th>Categoria</th>
											<th>Cantidad</th>
											<th>Bonificacion</th>
											<th>total</th>
											<th>Subtotal</th>
											<th>Iva</th>
											<th>total </th>
											<th>Proveedor </th>
											<th>Detalle </th>

										</tr>
									</thead>
									<tbody>
										<?php

										$stotal = 0;
										$iva = 0;
										$total = 0;
										$cnt = 1;
										while ($row = pg_fetch_object($detalledeventas)) {
											$stotal += $row->subtotal;
											$iva += $row->iva;
											$total += $row->totallinea;

										?>
											<tr>
												<td><?php echo $row->producto_codbarra; ?></td>
												<td><?php echo $row->prod_nombre; ?></td>
												<td><?php echo $row->marca; ?></td>
												<td><?php echo $row->cat_nombre; ?></td>
												<td><?php echo $row->cantidad; ?></td>
												<td><?php echo $row->bonificacion; ?></td>
												<td><?php echo $row->ctotal; ?></td>
												<td><?php echo $row->subtotal; ?></td>
												<td><?php echo $row->iva; ?></td>
												<td><?php echo $row->totallinea; ?></td>
												<td><?php echo $row->proveedor; ?></td>
												<td>



													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#exampleModal"
														data-codigo="<?php echo $row->producto_codbarra; ?>"
														data-inicial="<?php echo $fechaInicial; ?>"
														data-final="<?php echo $fechaFinal; ?>"
														data-sucursal="<?php echo $row->id_sucursal; ?>">Detalle</button>



												</td>

											</tr>
										<?php
											$cnt = $cnt + 1;
										}
										?>
									</tbody>

									<tfoot>
										<tr>
											<th>Linea Totales</th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th> </th>
											<th>total</th>
											<th><?php echo '$' . number_format($stotal, 2, '.', ','); ?></th>
											<th><?php echo '$' . number_format($iva, 2, '.', ','); ?></th>
											<th><?php echo '$' . number_format($total, 2, '.', ','); ?></th>
											<th> </th>
											<th> </th>


										</tr>
									</tfoot>

								</table>
							</div>
						</div>

						<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Detalle Producto</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body" id="modalContent">


									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div> <!-- start: FOOTER -->
	<?php include('include/footer.php'); ?>
	<!-- end: FOOTER -->

	<!-- start: SETTINGS -->
	<?php include('include/setting.php'); ?>

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
		function setFormAction() {
			var selectedOption = document.getElementById('select').value;

			if (selectedOption == 1) {
				document.forms['marcas'].action = 'compras_periodo_excel.php';
			} else if (selectedOption == 2) {
				document.forms['marcas'].action = '<?php echo $_SERVER['PHP_SELF']; ?>';
			}

			return true;
		}
	</script>
	<script type="text/javascript">
		new DataTable('#example2');
	</script>

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
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); // Button that triggered the modal
			var codigo = button.data('codigo'); // Extract info from data-* attributes
			var fInicial = button.data('inicial');
			var fFinal = button.data('final');
			var sucursal = button.data('sucursal');
			console.log(codigo, fInicial, fFinal, sucursal);
			$.ajax({
				type: 'POST',
				url: 'cargar_detallecompras_modal.php',
				data: {
					codigo: codigo,
					fInicial: fInicial,
					fFinal: fFinal
				},
				success: function(response) {
					$('#modalContent').html(response);
				},
				error: function(xhr, status, error) {
					console.error("Error al cargar los datos:", status, error);
				}
			});
		});
	</script>

	<script>
		function cargarMarcas() {
    var select = document.getElementById('selectprov');
    var select2 = document.getElementById('selectmarca');
    var idProveedor = select.value;

    // Limpia el select de marcas antes de cargar nuevas opciones
    select2.innerHTML = '';

    console.log('Buscando marcas para el proveedor con ID:', idProveedor);

    // Realiza la petición al servidor para obtener las marcas
    fetch('http://tuvet.test.labanaliza.com/vms/apis/api_listamarcas.php?proveedor_id=' + idProveedor)
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            // Verificar si el formato de los datos es el esperado
            if (Array.isArray(data)) {
                // Itera sobre cada marca y agrega una opción al select de marcas
                data.forEach(function (item) {
                    console.log('ID:', item.id, 'Marca:', item.marca_nombre);

                    var option = document.createElement('option');
                    option.value = item.id;
                    option.textContent = item.marca_nombre;
                    select2.appendChild(option);
                });

                // Si estás utilizando Bootstrap-select, refresca para actualizar las opciones
                $('.selectpicker').selectpicker('refresh');
            } else {
                console.log('Los datos no tienen el formato esperado.');
            }
        })
        .catch(function (error) {
            console.error('Error al cargar las marcas:', error);
        });
}

	</script>

	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
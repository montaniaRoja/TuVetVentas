<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
	header("Location: logout.php");
	exit();
}


if (isset($_POST['submit'])) { //if del submit

	$consultaMaxIdProductos = "select MAX(id) from productos";
	$maxIdResultado = pg_query($db, $consultaMaxIdProductos);
	$maxIdProductos = pg_fetch_result($maxIdResultado, 0, 0);
	$siguienteId = $maxIdProductos + 1;

	$determinarporcimpuesto = ("select * from impuestos where imp_id='$_REQUEST[impuestos]'");
	$determinarporcimpuesto = pg_query($db, $determinarporcimpuesto);
	if (!$determinarporcimpuesto) {
		echo "<script>alert('no se extrajo el porc de impuestos');</script>";
	}

	while ($row = pg_fetch_object($determinarporcimpuesto)) {
		$porcimpuesto = $row->imp_porc; //$20
	}


	$result = ("select * from sucursales");
	$result = pg_query($db, $result);
	$filas = pg_num_rows($result); // variable filas sirve para conocer la cantidad de sucursales para crear puntos de reorden y existencias

	$compraminima = (int)$_REQUEST['compraminima']; //$5
	$distminima = (int)$_REQUEST['distminima']; //$6
	$markup = (floatval($_REQUEST['markup'])) / 100; //$7
	$descuento = (floatval($_REQUEST['descuento'])) / 100; //$8
	$puntoreorden = (int)$_REQUEST['reorden'];
	$impuestos = $_REQUEST['impuestos']; //$21
	$unifraccion = (int)$_REQUEST['unifraccion'];  //$24
	$concentracion = (floatval($_REQUEST['concentracion'])); //$25
	$contenido = $_REQUEST['contenido']; //$26
	$tipoalimento = $_REQUEST['tipoalimento'];


	if ($_REQUEST['sumainv'] == "on") {
		$sumainv = 1; //$11
	} else {
		$sumainv = 0; //$11
	}

	if ($_REQUEST['bodega'] == "on") {
		$bodega = 1; //$11
	} else {
		$bodega = 0; //$11
	}



	$codigoBarras = $_REQUEST['codbarra']; //$1
	$nombreProducto = $_REQUEST['nombrebase']; //$2
	$marca = $_REQUEST['marca']; //$3
	$categoria = $_REQUEST['categoria']; //$4
	$fecha_actual = date("Y-m-d H:i:s"); //$9
	$usuarioCrea = $_SESSION['login']; //$10
	$activo = 1; //$12
	$minimoVenta = $_REQUEST['minimoventa']; //$13
	$precio = 0; //$14
	$costo = 0; //$15
	$descUnidad = 0; //$16
	$escala = $_REQUEST['escala']; //$17
	$descprov = (floatval($_REQUEST['descproveedor'])) / 100;
	$preciosugerido = (floatval($_REQUEST['sugerido']));
	$ultimoCosto = 0; //$18
	$sucursalCrea = $_SESSION['sucursal']; //$19



	$query = ("INSERT INTO productos(id,prod_codbarra, prod_nombre,id_marca,id_categorias,
                                    prod_compraminima,prod_distminima,prod_markup,prod_porcdescuento,
                                    fecha_creacion,creado_por,prod_esinventariosn,activosn,
                                    prod_ventaminima, prod_preciopublico,prod_costopromedio,descuento_unidad,
                                    escalas,prod_ultimocosto,sucursal_crea,porcentaje_impuesto, 
                                    codigo_impuesto,bodegasn, unidad_fraccion, concentracion, contenido,tipo_alimento, prov_descuento, prov_preciosugerido)
      VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29)");

	$params = array(
		$siguienteId, $codigoBarras, $nombreProducto, $marca, $categoria, $compraminima, $distminima, $markup, $descuento, $fecha_actual, $usuarioCrea,
		$sumainv, $activo, $minimoVenta, $precio, $costo, $descUnidad, $escala, $ultimoCosto, $sucursalCrea, $porcimpuesto, $impuestos, $bodega, $unifraccion, $concentracion, $contenido, $tipoalimento, $descprov, $preciosugerido
	);
	$result = pg_query_params($db, $query, $params);


	if (!$result) {
		echo "<script>alert('Error al procesar la informacion posibles datos duplicados');</script>";
	}
	//pg_close();

	if ($result) {
		echo "<script>alert('Su informacion ha sido enviada');</script>";
	}
	//echo "<script>window.location.href='productos.php'</script>";

	// crear la fila de existencias y puntos de reorden para cada sucursal segun las sucursales existentes

	// seleccionar el ultimo id de productos
	$ultimoIdProductos = ("SELECT prod_codbarra FROM productos ORDER BY id DESC LIMIT 1;");
	$query = pg_query($db, $ultimoIdProductos);
	$codbarra = pg_fetch_result($query, 0, 0);

	//seleccionar el ultimo id de existencias
	$recuperarMaxIdExistencias = "select max(id) from existencias";
	$maxIdResultado = pg_query($db, $recuperarMaxIdExistencias);
	$maxIdExistencias = pg_fetch_result($maxIdResultado, 0, 0);


	//recuperar max id de puntos de reorden
	$recuperarMaxIdPtoR = "select max(id) from puntosdereorden";
	$maxIdResultadoPR = pg_query($db, $recuperarMaxIdPtoR);
	$maxIdPr = pg_fetch_result($maxIdResultadoPR, 0, 0);

	//enviar todas las sucursales a un array

	$sucursales = "SELECT * FROM sucursales";
	$result = pg_query($db, $sucursales);
	if ($result) {
		// Iterar sobre los resultados de la consulta utilizando pg_fetch_assoc
		while ($fila = pg_fetch_assoc($result)) {
			$maxIdExistencias += 1;
			$maxIdPr += 1;
			$sucursal = $fila['id'];

			$existencias = ("INSERT INTO existencias(id,id_sucursal,codbarra,existencia,anaquel, porc_descuento)
        VALUES ($maxIdExistencias,'$sucursal','$codbarra',0,'no asignado','$descuento')");
			$query = pg_query($db, $existencias);

			$reorden = ("INSERT INTO puntosdereorden(id,id_sucursal,codbarra,ptoreorden,fecha_creacion,creadopor)
        VALUES ($maxIdPr,'$sucursal','$codbarra',0,'$fecha_actual','$usuarioCrea')");
			$query = pg_query($db, $reorden);
		}
	}

	// guardar el punto de reorden de la sucursal actual
	$actualizarreorden = ("UPDATE puntosdereorden SET ptoreorden='$puntoreorden' where codbarra='$codigoBarras' and id_sucursal='$sucursalCrea'");
	$resultado = pg_query($db, $actualizarreorden);

	if (!$resultado) {
		echo "<script>alert('no se guardo el punto de reorden');</script>";
	}
	pg_close();

	if ($resultado) {
		echo "<script>alert('punto de reorden actualizado para esta sucursal');</script>";
	}



	echo "<script>window.location.href='productos.php'</script>";
} //if del submit


if (isset($_GET['del'])) {
	$query2 = ("delete from productos where id = '" . $_REQUEST['id'] . "'");
	$query2 = pg_query($db, $query2);
	if (!$query2) {
		echo "<script>alert('Error hay registros en otras tablas que dependen de este registro');</script>";
	}
	$_SESSION['msg'] = "datos eliminados !!";
	echo "<script>window.location.href='productos.php'</script>";
}

if (isset($_GET['mostrar'])) {

	//$resultado=pg_query($mostrarFoto);
	//if($resultado){
	//echo "<script>alert('consulta foto');</script>";
	// }
	//echo "<script>window.location.href='productos.php'</script>";
}




?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Administrar Productos</title>
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

	<style>
		.dataTables_filter input {
			width: 600px;
			/* Ajusta este valor al tamaño deseado */
			height: 50px;
			/* Ajusta este valor al tamaño deseado */
			font-size: 24px;
			/* Ajusta el tamaño de la fuente si es necesario */
		}
	</style>


</head>

<body class="bg-dark">

	<script src="js/funciones.js"></script>

	<div id="app">
		<?php include('include/sidebar.php'); ?>
		<div class="app-content">

			<?php include('include/header.php'); ?>

			<!-- end: TOP NAVBAR -->
			<div class="main-content bg-dark">
				<div class="wrap-content container" id="container">
					<!-- start: PAGE TITLE -->
					<section id="page-title">
						<div class="row">
							<div class="col-sm-8">
								<h1 class="mainTitle">Agregar Productos</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><?php echo $_SESSION['login'] ?></span>
								</li>
								<li class="active">
									<span>Agregar Productos</span>
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
												<h5 class="panel-title">Agregar Productos</h5>
											</div>
											<div class="panel-body">
												<p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
													<?php echo htmlentities($_SESSION['msg'] = ""); ?></p>

												<form role="form" name="productos" method="post" enctype="multipart/form-data">
													<div class="form-group">
														<label for="inputData">
															Codigo
														</label>
														<input id="codbarra" type="text" name="codbarra" class="form-control" autocomplete="off" placeholder="Ingrese el codigo del producto" autofocus>
														<div id="codigoStatus" class="msgalerta"></div>
													</div>



													<div class="form-group">
														<label for="inputData">
															Nombre
														</label>
														<input id="nombre" type="text" required name="nombre" class="form-control" autocomplete="off" placeholder="Nombre principal del producto">
													</div>
													<!-- script para que el lector de codigo de barra capture el codigo y salte al campo nombre -->
													<script src="js/funciones.js"></script>



													<div class="form-group">
														<label for="inputData">
															Presentacion
														</label>
														<input id="presentacion" type="text" required name="presentacion" class="form-control" autocomplete="off" placeholder="Unidad de venta del producto">
													</div>





													<!-- inicia seleccionar la marca del producto -->
													<div class="form-group">
														<label for="inputData">
															Marca
														</label><br>
														<select id="marca" name="marca" class="form-control" onchange="concatenar()">
															<?php
															$query2 = "SELECT id, marca_nombre FROM marcas ORDER BY marca_nombre";
															$consulta = pg_query($db, $query2);

															while ($obj1 = pg_fetch_object($consulta)) {
																$id = $obj1->id;
																$marca_nombre = $obj1->marca_nombre;
																$selected = ($marca_nombre == 'Seleccione marca') ? "selected" : "";

																// Agregamos la opción al select
																echo '<option value="' . $id . '" ' . $selected . '>' . $marca_nombre . '</option>';
															}
															?>
														</select>
													</div>



													<!-- termina seleccionar la marca del producto -->




													<div class="form-group">

														<input type="hidden" id="nombrebase" name="nombrebase" class="form-control" autocomplete="off">
													</div>

													<!-- inicia seleccionar la categoria del producto -->

													<div class="form-group">
														<label for="inputData">
															Categoria
														</label><br>
														<select name="categoria" id="categoria" class="form-control">
															<?php
															$query2 = "SELECT id,cat_nombre FROM categorias order by cat_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) { ?>
																<option value="<?php echo $obj1->id ?>" <?php if ($obj1->cat_nombre == 'seleccione categoria') {
																											echo "selected";
																										} ?>><?php echo $obj1->cat_nombre; ?></option>

															<?php } ?>
														</select>


													</div>
													<!-- termina seleccionar la categoria del producto -->

													<!--  <div class="form-group">
															<label>
																Imagen del producto
															</label>
							<input id="imagen" type="file" name="imagen" required>
														</div>
											
											-->


													<div class="form-group">
														<label for="inputData">
															Escalas
														</label>
														<input id="escala" type="text" name="escala" class="form-control" autocomplete="off" placeholder="Escalas o descuentos de proveedor">
													</div>

													<div class="form-group">
														<label for="tipoalimento">
															Tipo de Alimento
														</label>
														<select name="tipoalimento" class="form-control">
															<option value="Humedo">Humedo</option>
															<option value="N/A" selected>No Aplica</option>
															<option value="Seco">Seco</option>
														</select>
													</div>

													<div class="form-group">
														<label for="inputData">
															Impuestos
														</label><br>
														<select name="impuestos" id="impuestos">
															<?php
															$query2 = "SELECT imp_id,imp_nombre FROM impuestos order by imp_nombre";
															$consulta = pg_query($db, $query2);
															while ($obj1 = pg_fetch_object($consulta)) {   ?>


																<option value="<?php echo $obj1->imp_id ?>" <?php if ($obj1->imp_nombre == 'Seleccione impuesto') {
																												echo "selected";
																											} ?>><?php echo $obj1->imp_nombre; ?></option>

															<?php } ?>
														</select>
														<label><input type="checkbox" hidden="true" id="sumainv" name="sumainv" checked="checked"></label>
													</div>

													<div class="form-group">
														<label for="unifraccion">Unidad de Fraccionamiento
															<input type="number" name="unifraccion" class="form-control" autocomplete="off" min="0" value="0"></label>
														<label for="concentracion">Contenido
															<input type="number" name="concentracion" class="form-control" autocomplete="off" min="0" value="0" step="0.01"></label>
														<label for="contenido">Contenido

															<select name="contenido" class="form-control">
																<option value="gramos">gramos</option>
																<option value="Kilogramos" selected>Kilogramos</option>
																<option value="Libras">Libras</option>
																<option value="Litros">Litros</option>
																<option value="Onzas">Onzas</option>
																<option value="ml">mililitros</option>
															</select></label>
													</div>

													<div class="form-group">
														<label for="inputData">Compra Minima
															<input type="number" name="compraminima" class="form-control" autocomplete="off" min="0" value="0"></label>

														<label for="inputData">Distribucion Minima
															<input type="number" name="distminima" class="form-control" autocomplete="off" min="0" value="0"></label>
													</div>

													<div class="form-group">
														<label for="inputData">Unidad Minima de Venta
															<input type="number" name="minimoventa" class="form-control" autocomplete="off" min="0" value="0"></label>


														<label for="inputData">Punto de Reorden
															<input type="number" name="reorden" class="form-control" autocomplete="off" min="0" value="0"></label>
													</div>



													<div class="form-group">
														<label for="inputData">Markup
															<input type="number" name="markup" class="form-control" autocomplete="off" min="0" value="0" step="0.001"></label>

														<label for="inputData">Descuento al Cliente
															<input type="number" name="descuento" class="form-control" autocomplete="off" min="0" value="0" step="0.001"></label>

														<label><input type="checkbox" id="bodega" name="bodega">es de Bodega?</label>
													</div>

													<div class="form-group">
														<label for="inputData">Proveedor Descuento
															<input type="number" name="descproveedor" class="form-control" autocomplete="off" min="0" value="0" step="0.001"></label>

														<label for="inputData">Precio Sugerido
															<input type="number" name="sugerido" class="form-control" autocomplete="off" min="0" value="0" step="0.001"></label>
													</div>


													<button id="submit" type="submit" name="submit" class="btn btn-o btn-primary">
														Submit
													</button>
												</form>


												<!-- funcion para prevenir que al presionar la tecla enter se envie el formulario -->
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
								<h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Productos</span></h5>

								<table id="example" class="display" style="width:100%">
									<thead>
										<tr>
											<th class="center">#</th>
											<th>Codigo</th>
											<th>Nombre</th>
											<th>Marca</th>
											<th>Categoria</th>
											<th>Proveedor</th>
											<th>Precio de Venta</th>
											<th>Existencia</th>


											<th>Punto de reorden</th>
											<th>edit/delete/pict</th>

										</tr>
									</thead>
									<tbody>
										<?php
										$sql = pg_query($db, "SELECT productos.id, productos.prod_codbarra, productos.prod_preciopublico, productos.prod_nombre,
       marcas.marca_nombre, categorias.cat_nombre, proveedores.prov_nombre, puntosdereorden.ptoreorden, existencias.existencia
FROM productos
JOIN marcas ON productos.id_marca = marcas.id
JOIN categorias ON productos.id_categorias = categorias.id
JOIN proveedores ON marcas.proveedor_id = proveedores.id
JOIN puntosdereorden ON productos.prod_codbarra = puntosdereorden.codbarra AND puntosdereorden.id_sucursal = '$_SESSION[sucursal]'
JOIN existencias ON productos.prod_codbarra = existencias.codbarra AND existencias.id_sucursal = '$_SESSION[sucursal]'
WHERE productos.activosn = 1 and prod_esinventariosn=1
ORDER BY productos.id;");
										$cnt = 1;
										while ($row = pg_fetch_object($sql)) {
										?>

											<tr>
												<td class="center"><?php echo $row->id; ?></td>
												<td><?php echo $row->prod_codbarra; ?></td>
												<td><?php echo $row->prod_nombre; ?></td>
												<td><?php echo $row->marca_nombre; ?></td>
												<td><?php echo $row->cat_nombre; ?></td>
												<td><?php echo $row->prov_nombre; ?></td>
												<td><?php echo $row->prod_preciopublico; ?></td>
												<td><?php echo $row->existencia; ?></td>

												<td><?php echo $row->ptoreorden; ?></td>



												<td>

													<div class="visible-md visible-lg hidden-sm hidden-xs">

														<a href="editarproductos.php?id=<?php echo $row->id; ?>" class="btn btn-transparent btn-xs" tooltip-placement="top" tooltip="Edit"><i class="fa fa-pencil"></i></a>

														<a href="productos.php?id=<?php echo $row->id ?>&del=delete" onClick="return confirm('Are you sure you want to delete?')" class="btn btn-transparent btn-xs tooltips" tooltip-placement="top" tooltip="Remove"><i class="fa fa-times fa fa-white"></i></a>

														<!--<a href="productos.php?id=<?php echo $row->prod_codbarra; ?>&mostrar " class="btn btn-transparent btn-xs" 
												tooltip-placement="top" tooltip="Pict"><i class="fa fa-file-image-o" aria-hidden="true"></i></a>-->







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
											$cnt = $cnt + 1;
										} ?>


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




	<script>
		$(document).ready(function() {
			<?php if (isset($_GET['mostrar'])) : ?>
				$('#kardexModal').modal('show');
			<?php endif; ?>
		});
	</script>


	<div class="modal fade" id="kardexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">


		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Imagen del producto</h5>

				</div>
				<div class="modal-body">
					<?php
					/*echo $_REQUEST['id'];

// Establecer una conexión a la base de datos MySQL
$servername = "localhost";
$username = "adolfo";
$password = "ofloda01";
$database = "foto_productos";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta para obtener la foto
$id = $conn->real_escape_string($_REQUEST['id']);
$mostrarFoto = "SELECT imagen FROM imagenes WHERE nombre = '".$_REQUEST['id']."'";

$result = $conn->query($mostrarFoto);

while ($row = $result->fetch_assoc()) {
    ?>
    <div style="text-align: center;">
        <img src="data:image/jpg;base64,<?php echo base64_encode($row['imagen']); ?>" width="400" height="400" class="center">
    </div>
    <?php
}

// Cierra la conexión
$conn->close();
*/
					?>



				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.location();">Cerrar</button>


				</div>


			</div>
		</div>
	</div>


	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
	<script>
		$(document).ready(function() {
			$("#codbarra").on("input", function() {
				var codigo = $(this).val();

				if (codigo.trim() !== "") {
					$.ajax({
						type: "POST",
						url: "verificar_codigo.php", // Nombre del archivo PHP que verifica el código
						data: {
							codigo: codigo
						},
						success: function(response) {
							if (response === "existe") {

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
</body>

</html>
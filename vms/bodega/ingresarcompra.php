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

date_default_timezone_set('America/El_Salvador');
$fecha_actual=date("d-m-y h:i:s");
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin | Administrar Productos</title>
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
									<h1 class="mainTitle">Compras</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Agregar Compra</span>
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
										<div class="col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">Agregar Compra</h5>
												</div>
												<div class="panel-body">
                                                    <p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
                                                    <?php echo htmlentities($_SESSION['msg']="");?></p>	
														<div class="form-group">
															<label for="inputData">
																Factura
															</label>
                                                            <input id="factura" type="text" name="factura" class="form-control"  autocomplete="off" placeholder="Ingrese número de factura" autofocus>
															<notif style="color:red"></notif>
                                                        </div>    
                                                        <div class="form-group">
															<label for="inputData">
																Proveedor
															</label><br>
															<select id="proveedor" name="proveedor" class="form-control" >
							                                <?php 
															$query2="SELECT id,prov_nombre FROM proveedores order by prov_nombre";
															$consulta=pg_query($db,$query2);
															while($obj1=pg_fetch_object($consulta)){?>
																<option value="<?php echo $obj1->id ?>"<?php if($obj1->prov_nombre=='Seleccione marca'){echo "selected";}?>><?php echo $obj1->prov_nombre;?></option>
																
   															
   															<?php  }?>
   															
   															</select>
															<notip style="color:red"></notip>
														</div>                         
                                                        <div class="form-group">
															<label for="inputData">
																Condición
															</label><br>
															<select name="condicion" id="condicion" class="form-control">
                                                                <option value="Contado">Contado</option>
																<option value="Credito">Crédito</option>
   															</select>
															<notic style="color:red"></notic>
														</div> 
                                                        
                                                        <div class="form-group">
                                                            <label>
                                                            <input type="checkbox" id="retencion" name="retencion" >Retención</label>
                                                        </div>
                                                        <!-- inicia seleccionar el producto -->			
                                                        
                                                        <div class="form-group">
                                                            <label for="inputData">
                                                                Productos
                                                            </label><br>
                                                            <table class="table table-hover" id="tabla_agregar_productos_compras">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="center">Seleccionar producto</th>
                                                                        <th>Costo</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Bonificación</th>
                                                                        <th>Cantidad Total</th>
                                                                        <th>Subtotal</th>
                                                                        <th>Precio Actual</th>
                                                                        <th>Nuevo Precio</th>
                                                                        <th>Monto IVA</th>
                                                                        <th>Total</th>
                                                                        <th>Opcion</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="center"  style="width: auto;">
                                                                            <?php 
                                                                                $productos="SELECT p.id, 
                                                                                p.prod_codbarra, 
                                                                                p.prod_preciopublico,
                                                                                p.prod_nombre,
                                                                                p.prod_markup,
                                                                                p.porcentaje_impuesto,
																				p.prod_costopromedio,
																				p.prod_ultimocosto,
																				p.prod_porcdescuento,
																				e.existencia
                                                                                FROM productos AS p
																				JOIN existencias AS e ON p.prod_codbarra=e.codbarra AND e.id_sucursal=$_SESSION[sucursal] 
																				WHERE p.activosn=1 and prod_esinventariosn=1
                                                                                ORDER BY p.prod_nombre";
                                                                                $consul_productos=pg_query($db,$productos);
                                                                            ?>
                                                                            <select id="productos" name="productos" class="form-control" onChange="cargarDatosTabla()" onSelect="cargarDatosTabla()">
                                                                                <?php 
                                                                                $array = array();
                                                                                while($obj1=pg_fetch_object($consul_productos)){
                                                                                    $array[] = array(
                                                                                        'id' => $obj1->id,
                                                                                        'prod_codbarra' => $obj1->prod_codbarra,
                                                                                        'prod_nombre' => $obj1->prod_nombre,
                                                                                        'markup' => $obj1->prod_markup,
                                                                                        'paga_iva' => $obj1->porcentaje_impuesto,
                                                                                        'prod_preciopublico' => $obj1->prod_preciopublico,
																						'prod_costopromedio' => $obj1->prod_costopromedio,
																						'prod_ultimocosto' => $obj1->prod_ultimocosto,
																						'cantidad_actual' => $obj1->existencia,
																						'prod_porcdescuento' => $obj1->prod_porcdescuento
                                                                                    );
                                                                                    ?>
                                                                                    <option value="<?php echo $obj1->prod_codbarra; ?>" <?php if($obj1->prod_nombre=='Seleccione producto'){echo "selected='selected'";}?>> <?php echo $obj1->prod_codbarra." - ".$obj1->prod_nombre;?> </option>
                                                                                <?php  }
                                                                                    $arrayP = json_encode($array);
                                                                                    echo $arrayP;?>
                                                                            </select>
                                                                            <script type="text/javascript">
                                                                                var data_productos = <?php echo json_encode($arrayP);?>;
                                                                            </script>
                                                                        </td>
                                                                        <td style="width: 70px;"><input id="costo" markup="" pagaiva="" type="number" name="costo" class="form-control" autocomplete="off" placeholder="Costo" onChange="cambiarPrecioVenta()" onKeyUp="cambiarPrecioVenta()"></td>
                                                                        <td style="width: 70px;"><input id="cantidad" type="number" name="cantidad" class="form-control" autocomplete="off" placeholder="Cantidad" onChange="cambiarPrecioVenta()" onKeyUp="cambiarPrecioVenta()"></td>
                                                                        <td style="width: 70px;"><input id="bonificacion" type="number" name="bonificacion" class="form-control" autocomplete="off" placeholder="Bonificación" onChange="cambiarPrecioVenta()" onKeyUp="cambiarPrecioVenta()"></td>
                                                                        <td style="width: 70px;"><div id="cantidad_total"></div></td>
                                                                        <td style="width: 70px;"><div id="subtotal"></div></td>
                                                                        <td style="width: 70px;"><div id="prod_precioactual"></div></td>
                                                                        <td style="width: 80px;"><input id="prod_precionuevo" type="number" name="prod_precionuevo" class="form-control" autocomplete="off" placeholder="Precio Nuevo"></td>
                                                                        <td style="width: 70px;"><div id="iva"></div></td>
                                                                        <td style="width: 70px;"><div id="total"></div></td>
                                                                        <td style="width: 70px;"><input type="button" id="btn-agregar-lista-compras" onClick="agregarListaProductos()" value="Agregar"></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputData">
                                                                Lista de productos
                                                            </label><br>
                                                            <table class="table table-hover" id="tabla_lista_productos_compras" >
                                                                <thead>
                                                                    <tr>
                                                                        <th class="center">#</th>
                                                                        <th>Nombre</th>
                                                                        <th>Costo</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Bonificación</th>
                                                                        <th>Cantidad Total</th>
                                                                        <th>Subtotal</th>
                                                                        <th>Precio Actual</th>
                                                                        <th>Nuevo Precio</th>
                                                                        <th>Monto IVA</th>
                                                                        <th>Total</th>
                                                                        <th>Opcion</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <tfoot id="tfoot_compras">
                                                                </tfoot>
                                                            </table>
															<notipro style="color:red"></notipr>
                                                        </div>
                                                        <a id="btn_ingresar_compra" type="button" name="btn_ingresar_compra" class="btn btn-o btn-primary" onClick="insertarRegistro()">
                                                            Ingresar Compra
                                                        </a>
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
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
        <script src="js/compras.js"></script>	
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
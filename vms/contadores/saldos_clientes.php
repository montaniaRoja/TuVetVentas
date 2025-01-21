<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
$fecha_actual = date("Y-m-d H:i:s");


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
									<h1 class="mainTitle">Ventas al Credito</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span><?php echo $_SESSION['login']?></span>
									</li>
									<li class="active">
										<span>Ventas al Credito</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">


									<div class="row">
								<div class="col-md-12">
									<h5 class="over-title margin-bottom-15"> <span class="text-bold">Clientes</span></h5>
									
									<table id="example" class="display" style="width:100%">
    <thead>
        <tr>
            <th class="center">#</th>
            <th>id Cliente</th>
            <th>Nombre Cliente</th>
            <th>Cargos</th>
            <th>Abonos</th>
            <th>Saldo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $sql = pg_query($db, "SELECT e.cliente_id, 
                                c.cliente_nombre, 
                                SUM(e.cargo) AS cargos, 
                                SUM(e.abono) AS abonos, 
                                SUM(e.cargo) - SUM(e.abono) AS saldo
                              FROM extractosclientes e
                              JOIN clientes c ON e.cliente_id = c.id
                              LEFT JOIN hfacturas h ON e.doc_numero = h.numero_impreso AND h.pagada_sn = 1
                              WHERE e.anulada = 0
                              GROUP BY e.cliente_id, c.cliente_nombre;");

        $cnt = 1;
        $total_cargos = 0;
        $total_abonos = 0;
        $total_saldo = 0;

        while ($row = pg_fetch_object($sql)) {
            $total_cargos += $row->cargos;
            $total_abonos += $row->abonos;
            $total_saldo += $row->saldo;

            echo '<tr>';
            echo '<td class="center">' . $cnt . '.</td>';
            echo '<td class="hidden-xs">' . $row->cliente_id . '</td>';
            echo '<td class="hidden-xs">' . $row->cliente_nombre . '</td>';
            echo '<td>$' . number_format($row->cargos, 2, '.', ',') . '</td>';
            echo '<td>$' . number_format($row->abonos, 2, '.', ',') . '</td>';
            echo '<td>$' . number_format($row->saldo, 2, '.', ',') . '</td>';
            echo '<td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalHistorial"
                            data-idcliente="' . $row->cliente_id . '" 
                            data-nombre="' . $row->cliente_nombre . '">
                        Historial
                    </button>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ModalDetalle"
                            data-idclientedetalle="' . $row->cliente_id . '" 
                            data-nombredetalle="' . $row->cliente_nombre . '">
                        Detalle
                    </button>
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#ModalAbonos"
                            data-idclienteabonos="' . $row->cliente_id . '" 
                            data-nombreabonos="' . $row->cliente_nombre . '"
                            data-saldo="' . $row->saldo . '">
                        Abonos
                    </button>
                </td>';
            echo '</tr>';

            $cnt++;
        }
        ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3" style="text-align:right"><strong>Total:</strong></td>
            <td><?php echo '$' . number_format($total_cargos, 2, '.', ','); ?></td>
            <td><?php echo '$' . number_format($total_abonos, 2, '.', ','); ?></td>
            <td><?php echo '$' . number_format($total_saldo, 2, '.', ','); ?></td>
            <td></td>
        </tr>
    </tfoot>
</table>
									
	
									<!-- Modal -->
									
									
								</div>
							</div>
								</div>
							</div>
						</div>
						<!-- end: BASIC EXAMPLE -->
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>

<!-- Modal -->
<div class="modal fade" id="ModalHistorial" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Estado de Cuenta</h5>
        <div id="nombrecliente"></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalContent">
        
      </div>
      <div class="modal-footer">
        
        <form action="historial_credito_excel.php" method="post">
        <input type="hidden" id="codigocliente" name="codigocliente">
        <input type="hidden" id="ncliente" name="ncliente">
        <button type="submit" name="historialexcel" class="btn btn-primary">Excel</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </form>
      </div>
    </div>
  </div>
</div>			
	
<!-- Modal -->
<div class="modal fade" id="ModalDetalle" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Detalle de Productos</h5>
        <div id="nombreclientedetalle"></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalDetalleContent">
        ...
      </div>
      <div class="modal-footer">
        <form action="detalle_credito_excel.php" method="post">
        <input type="hidden" id="id_cliente" name="id_cliente">
        <input type="hidden" id="n_cliente" name="n_cliente">
        <button type="submit" name="detalleexcel" class="btn btn-primary">Excel</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </form>
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="ModalAbonos" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registrar Abonos a Cuenta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  <div class="panel-body">
	  <form role="form" name="productos" method="post" action="registrar_abonos.php">

	  <div class="form-group">
		<label for="idcliente">Id Cliente</label>
			<input type="text" id="idcliente" name="idcliente" class="form-control"  readonly>
	</div>
	
	  <div class="form-group">
		<label for="nombrecliente">Nombre Cliente</label>
			<input type="text" id="clientenombre" name="clientenombre" class="form-control"  readonly>
	</div>
	
	<div class="form-group">
		<label for="saldocliente">Saldo Adeudado</label>
			<input type="number" id="saldocliente" name="saldocliente" class="form-control"  readonly>
	</div>

	<div class="form-group">
		<label for="abonocliente">Monto Abonar</label>
		<input type="number" id="abonocliente" name="abonocliente" class="form-control" min="0" step="0.01" oninput="habilitarBoton()">

	</div>

	<div class="form-group">
		<label for="referenciacliente">Referencia</label>
			<input type="text" id="referenciacliente" name="referenciacliente" class="form-control">
	</div>

	<button type="submit" id="abonar" name="abonar" class="btn btn-o btn-primary" disabled>
		Registrar Abono
	</button>

		</form>		
	  </div>								 
	 </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
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

		<script src="js/saldos_clientes.js"></script>



</body>
</html>

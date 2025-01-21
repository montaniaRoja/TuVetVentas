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

if (isset($_POST['cargar'])) {

    $sucursales = $_POST['selectsucursal'];
    $sucursalList = implode(",", $sucursales);
    $categorias = $_POST['selectcategoria'];
    $categoriaList = implode(",", $categorias);
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];


    $sql = pg_query($db, "SELECT m.monitoreo_id, m.monitoreo_sucursal_id,
s.sucursal_nombre,
m.monitoreo_codbarra,
p.prod_nombre,
c.cat_nombre,
p.prod_preciopublico*(1+p.porcentaje_impuesto) as precio_tuvet,
m.monitoreo_empresa_id,
e.empresa_nombre,
e.empresa_direccion,
m.monitoreo_precio,
m.monitoreo_usuario_crea,
m.monitoreo_ultima_actualizacion
FROM monitoreo m 
INNER JOIN sucursales s ON s.id = m.monitoreo_sucursal_id
INNER JOIN productos p ON p.prod_codbarra = m.monitoreo_codbarra
INNER JOIN monitoreo_empresas e ON e.empresa_id = m.monitoreo_empresa_id
INNER JOIN categorias c ON p.id_categorias=c.id
WHERE monitoreo_sucursal_id IN ($sucursalList)
AND c.id IN ($categoriaList)
AND monitoreo_ultima_actualizacion BETWEEN '$fechaInicial' AND '$fechaFinal'
order by monitoreo_id desc;");
}



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Monitoreo</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <!-- DataTables CSS y JS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Otras hojas de estilo y bibliotecas -->
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

    <script src="js/funciones.js"></script>
    <div id="app">
        <?php include('include/sidebar.php'); ?>
        <div class="app-content">

            <?php include('include/header.php'); ?>

            <!-- end: TOP NAVBAR -->
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Monitoreo</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span><?php echo $_SESSION['login'] ?></span>
                                </li>
                                <li class="active">
                                    <span>Monitoreo</span>
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
                                                <h5 class="panel-title">Monitoreo</h5>
                                            </div>
                                            <div id="notificacion">

                                            </div>
                                            <div class="panel-body">
                                                <p style="color:red;"><?php echo htmlentities($_SESSION['msg']); ?>
                                                    <?php echo htmlentities($_SESSION['msg'] = ""); ?></p>
                                                <form role="form" name="categorias" method="post">
                                                    <div class="form-group">
                                                        <label for="sucursal">Sucursal</label><br>
                                                        <select name="selectsucursal[]" id="selectsucursal" class="form-control" multiple data-live-search="true">
                                                            <?php
                                                            $codigoCd = 7;
                                                            $query2 = "SELECT id, sucursal_nombre FROM sucursales where id!='$codigoCd' ORDER BY sucursal_nombre";
                                                            $consulta = pg_query($db, $query2);

                                                            while ($obj1 = pg_fetch_object($consulta)) {
                                                            ?>
                                                                <option value="<?php echo $obj1->id; ?>">
                                                                    <?php echo $obj1->sucursal_nombre; ?>
                                                                </option>
                                                            <?php } ?>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="categoria">Categoria</label><br>
                                                        <select name="selectcategoria[]" id="selectcategoria" class="form-control" multiple data-live-search="true">
                                                            <?php
                                                            $query2 = "SELECT id, cat_nombre FROM categorias ORDER BY cat_nombre";
                                                            $consulta = pg_query($db, $query2);
                                                            while ($obj1 = pg_fetch_object($consulta)) {
                                                            ?>
                                                                <option value="<?php echo $obj1->id ?>" <?php if ($obj1->prov_nombre == 'Seleccione Categoria') {
                                                                                                            echo "selected";
                                                                                                        } ?>><?php echo $obj1->cat_nombre; ?></option>
                                                            <?php } ?>
                                                        </select>
                                                        <button type="button" onclick="seleccionarTodas()">Seleccionar Todas</button>
                                                        <script>
                                                            function seleccionarTodas() {

                                                                let todasSeleccionadas = true;
                                                                $("#selectcategoria option").each(function() {
                                                                    if (!$(this).prop("selected")) {
                                                                        todasSeleccionadas = false;
                                                                    }
                                                                });

                                                                if (todasSeleccionadas) {
                                                                    $("#selectcategoria option").prop("selected", false);
                                                                } else {
                                                                    $("#selectcategoria option").prop("selected", true);
                                                                }

                                                                $("#selectcategoria").trigger('change');

                                                            }
                                                        </script>
                                                    </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="fechainicial">
                                                    Desde

                                                    <input type="date" id="fechainicial" name="fechainicial" class="form-control" autocomplete="off"></label>
                                                <label for="fechafinal">Hasta

                                                    <input type="date" id="fechafinal" name="fechafinal" class="form-control" autocomplete="off"></label>
                                            </div>


                                            <button type="submit" name="cargar" class="btn btn-o btn-primary">
                                                Listar
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
                            <h5 class="over-title margin-bottom-15">Administrar <span class="text-bold">Monitoreo</span></h5>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Agregar Monitoreo
                            </button>

                            <table id="example" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Sucursal</th>
                                        <th>Código</th>
                                        <th>Producto</th>
                                        <th>Categoria</th>
                                        <th>Empresa</th>
                                        <th>Dirección</th>
                                        <th>Precio Competencia</th>
                                        <th>Precio TuVet</th>
                                        <th>Creado Por</th>
                                        <th>Ultima Actualización</th>
                                        <th>Opción</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_monitoreo">
                                    <?php

                                    $cnt = 1;
                                    while ($row = pg_fetch_object($sql)) {
                                    ?>

                                        <tr>
                                            <td class="center"><?php echo $cnt; ?>.</td>
                                            <td><?php echo $row->sucursal_nombre; ?></td>
                                            <td><?php echo $row->monitoreo_codbarra; ?></td>
                                            <td><?php echo $row->prod_nombre; ?></td>
                                            <td><?php echo $row->cat_nombre; ?></td>
                                            <td><?php echo $row->empresa_nombre; ?></td>
                                            <td><?php echo $row->empresa_direccion; ?></td>
                                            <td><?php echo '$' . number_format($row->monitoreo_precio, 2); ?></td>
                                            <td><?php echo '$' . number_format($row->precio_tuvet, 2); ?></td>
                                            <td><?php echo $row->monitoreo_usuario_crea; ?></td>
                                            <td><?php echo $row->monitoreo_ultima_actualizacion; ?></td>
                                            <td>
                                                <?php
                                                echo '<button class="btn btn-warning btnEditarMonitoreo" data-toggle="modal" data-target="#modalEditarMonitoreo" 
														        onClick="cargarDatosModalEditarMonitoreo(' . $row->monitoreo_id . ')">Editar</button>';

                                                ?>
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

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formulario" role="form" method="post" enctype="multipart/form-data">

                            <div class="modal-body">

                                <div class="card-body">
                                    <input type="hidden" name="id_monitoreo" id="id_monitoreo">
                                    <div class="form-group">
                                        <label for="inputData">
                                            Sucursal
                                        </label>
                                        <select name="selectsucursal01" id="selectsucursal01" class="selectpicker form-control" data-live-search="true">
                                            <?php
                                            $codigoCd = 7;
                                            $query2 = "SELECT id, sucursal_nombre FROM sucursales where id!='$codigoCd' ORDER BY sucursal_nombre";
                                            $consulta = pg_query($db, $query2);

                                            while ($obj1 = pg_fetch_object($consulta)) {
                                            ?>
                                                <option value="<?php echo $obj1->id; ?>">
                                                    <?php echo $obj1->sucursal_nombre; ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                        <noti_suc style="color:red"></noti_suc>
                                    </div>
                                    <div class="form-group">
                                        <label for="producto">
                                            Producto
                                        </label>
                                        <select name="producto01" id="producto01" class="selectpicker form-control" style="width: 100%" data-live-search="true" onchange="buscarprecio()">

                                            <?php
                                            $query2 = "SELECT id, prod_nombre, prod_codbarra FROM productos ORDER BY prod_nombre";
                                            $consulta = pg_query($db, $query2);
                                            while ($obj1 = pg_fetch_object($consulta)) { ?>
                                                <option value="<?php echo $obj1->prod_codbarra ?>"><?php echo $obj1->prod_nombre; ?></option>
                                            <?php } ?>
                                        </select>
                                        <noti_pro style="color:red"></noti_pro>

                                        <div class="form-group">
                                            <label for="preciotuvet">Precio TuVet</label>
                                            <input type="text" name="preciotuvet" id="preciotuvet" class="form-control" readonly>
                                        </div>



                                        <div class="form-group">
                                            <label for="inputData">
                                                Empresa
                                            </label>
                                            <div class="input-group" style="width: 100%">
                                                <select name="selectempresa" id="selectempresa" class="selectpicker form-control" style="width: 70%">
                                                    <option value="Seleccione empresa" selected>Seleccione empresa</option>
                                                    <?php
                                                    $query1 = "SELECT empresa_id,empresa_nombre FROM monitoreo_empresas order by empresa_id desc";
                                                    $consulta1 = pg_query($db, $query1);
                                                    $arrayEmp = array();
                                                    while ($obj1 = pg_fetch_object($consulta1)) {
                                                        $arrayEmp[] = array(
                                                            'empresa_id' => $obj1->empresa_id,
                                                            'empresa_nombre' => $obj1->empresa_nombre
                                                        );
                                                    ?>
                                                        <option value="<?php echo $obj1->empresa_id ?>"><?php echo $obj1->empresa_nombre; ?></option>
                                                    <?php  }
                                                    $arrayE = json_encode($arrayEmp); ?>
                                                </select>
                                                <script type="text/javascript">
                                                    var data_empresas = <?php echo json_encode($arrayE); ?>;
                                                </script>
                                                <a type="buttom" onClick="crearEmpresa()" style="width: 30%; height: 30px;" class="form-control btn btn-sm btn-o btn-success" data-toggle="modal" data-target="#modalCrearEmpresa">
                                                    Crear Empresa
                                                </a>
                                            </div>
                                            <noti_empre style="color:red"></noti_empre>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputData">
                                                Precio
                                            </label>
                                            <input type="number" min="0" name="precio" id="precio" class="form-control">
                                            <noti_precio style="color:red"></noti_precio>
                                        </div>
                                    </div>
                                </div>
                        </form>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-success" id="btn_crear_monitoreo" onClick="insertarRegistroMonitoreo()">Crear</button>
                            
                        </div>
                        <?php
                        ?>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>
        <!-- end: BASIC EXAMPLE -->
        <!-- end: SELECT BOXES -->

    </div>
    <div id="modalCrearEmpresa" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <!--=====================================
									CABEZA DEL MODAL
									======================================-->
                <div class="modal-header">
                    <h4 class="modal-title">Empresa</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!--=====================================
									CUERPO DEL MODAL
									======================================-->
                <form id="formulario" role="form" method="post" enctype="multipart/form-data">

                    <div class="modal-body">

                        <div class="card-body">

                            <input type="hidden" id="id_empresa" name="id_empresa">
                            <div class="form-group">
                                <label for="inputData">
                                    Nombre Empresa
                                </label>
                                <input type="text" class="form-control" id="nombre" name="nombre">
                                <noti_e_nom style="color:red"></noti_e_nom>
                            </div>
                            <div class="form-group">
                                <label for="inputData">
                                    Dirección
                                </label>
                                <input type="text" class="form-control" id="direccion" name="direccion">
                                <noti_e_dir style="color:red"></noti_e_dir>
                            </div>
                            <div class="form-group">
                                <label for="inputData">
                                    Teléfono
                                </label>
                                <input type="text" class="form-control" id="telefono" name="telefono">
                                <noti_e_tel style="color:red"></noti_e_tel>
                            </div>
                            <div class="form-group">
                                <label for="inputData">
                                    Cantidad Sucursales
                                </label>
                                <input type="number" class="form-control" id="cantidad_sucursales" name="cantidad_sucursales">
                                <noti_e_cant_suc style="color:red"></noti_e_cant_suc>
                            </div>
                        </div>
                    </div>
                </form>
                <!--=====================================
									PIE DEL MODAL
									======================================-->
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-success" id="btn_crear_empresa" onClick="insertarRegistroEmpresa()">Crear</button>
                    <button type="button" class="btn btn-success" id="btn_editar_empresa" onClick="editarRegistroEmpresa()">Editar</button>
                </div>
                <?php
                ?>
            </div>
        </div>
    </div>
    </div>
    
    <!-- start: FOOTER -->
    <?php include('include/footer.php'); ?>
    <!-- end: FOOTER -->

    <!-- start: SETTINGS -->
    <?php include('include/setting.php'); ?>

    <!-- end: SETTINGS -->

   <!-- start: MAIN JAVASCRIPTS -->
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
    <script src="js/monitoreo.js"></script>

    <script>
        jQuery(document).ready(function() {
            Main.init();
            FormElements.init();
            // Inicializa DataTable después de que el DOM esté listo
            $('#example').DataTable();
        });
    </script>

    <script>
        function buscarprecio() {
            console.log('buscando precio');
            var select = document.getElementById('producto01');
            var selectedOption = select.options[select.selectedIndex];
            var codigo = selectedOption.value;
            console.log(codigo);

            // Realizar la solicitud AJAX
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'obtener_precio.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // Procesar la respuesta del servidor
                    var response = JSON.parse(xhr.responseText);
                    var precio = response.precio;
                    console.log('Precio obtenido:', precio);

                    // Asignar el precio al campo de entrada preciotuvet
                    document.getElementById('preciotuvet').value = precio;
                    document.getElementById('preciotuveteditar').value = precio;
                } else {
                    console.log('Error al obtener el precio. Código de estado:', xhr.status);
                }
            };
            // Enviar los datos mediante POST
            xhr.send('codigo=' + encodeURIComponent(codigo));
        }
    </script>
</body>

</html>
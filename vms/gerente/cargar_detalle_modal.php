<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['codigo'])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    $fechaInicial = date('Y-m-d', strtotime($_POST['fInicial']));
    $fechaFinal = date('Y-m-d', strtotime($_POST['fFinal']));
    $sucursal = $_POST['sucursal'];
    
    $consulta = "SELECT d.fecha, d.id_hfactura, d.cod_barra, p.prod_nombre, d.cantidad, h.numero_impreso, h.cobrada_por
                 FROM dfacturas d
                 JOIN productos p ON d.cod_barra = p.prod_codbarra
                  JOIN hfacturas h on d.id_hfactura=h.id
                 WHERE d.fecha BETWEEN $1 AND $2
                 AND d.cod_barra = $3 AND d.sucursal_id = $4 ORDER BY d.fecha;";
    
    // Parámetros de la consulta
    $params = array($fechaInicial, $fechaFinal, $codigo, $sucursal);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>Numero</th>';
    $html .= '<th>Usuario</th>';
    $html .= '<th>Codigo</th>';
    $html .= '<th>Nombre</th>';
    $html .= '<th>Cantidad</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->fecha . '</td>';
        $html .= '<td>' . $row->numero_impreso . '</td>';
        $html .= '<td>' . $row->cobrada_por . '</td>';
        $html .= '<td>' . $row->cod_barra . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '<td>' . $row->cantidad . '</td>';
        $html .= '</tr>';
    }
    
    $html .= '</tbody>';
    $html .= '</table>';
    
    echo $html;
} else {
    echo "Error: No se recibió el codigo producto.";
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Título de tu página</title>
    <!-- Incluye primero jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Luego incluye DataTables -->
    <script src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>
    <!-- Además, incluye el CSS de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
</head>
<body>


<script>
   new DataTable('#example2');
</script>

</body>
</html>

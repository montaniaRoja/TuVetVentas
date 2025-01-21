<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['user'])) {
    $detalle = array();
    $user = $_POST['user'];
    $fechaInicial = date('Y-m-d', strtotime($_POST['fInicial']));
    $fechaFinal = date('Y-m-d', strtotime($_POST['fFinal']));
    
    
    $consulta = "select h.fecha_creacion, h.numero_impreso, h.total_linea from hfacturas h where creada_por=$3 and h.pagada_sn=1 and h.fecha_cobro between $1 and $2
AND h.anulada=0 order by id desc;";
    
    // Parámetros de la consulta
    $params = array($fechaInicial, $fechaFinal, $user);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>Numero</th>';
    $html .= '<th>Total</th>';    
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->fecha_creacion . '</td>';
        $html .= '<td>' . $row->numero_impreso . '</td>';
        $html .= '<td>' . $row->total_linea . '</td>';        
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

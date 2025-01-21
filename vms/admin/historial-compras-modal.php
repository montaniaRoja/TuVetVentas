<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['codigo'])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    
    
    $consulta = "select doc_numero, fecha, cargo, abono, usuario from extractosproveedores where prov_id=$1 order by id, fecha;";
    
    // Parámetros de la consulta
    $params = array($codigo);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>Numero de CCF</th>';
    $html .= '<th>Credito</th>';
    $html .= '<th>Abono</th>';
    $html .= '<th>Saldo</th>';
    $html .= '<th>Usuario</th>';    
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    $saldo=0;
    
    while ($row = pg_fetch_object($result)) {
        $saldo+=$row->cargo-$row->abono;
        $html .= '<tr>';
        $html .= '<td>' . $row->fecha . '</td>';
        $html .= '<td>' . $row->doc_numero . '</td>';
        $html .= '<td>' . "$ ".number_format($row->cargo,2) . '</td>';
        $html .= '<td>' . "$ ".number_format($row->abono,2) . '</td>';
        $html .= '<td>' . "$ ".number_format($saldo,2) . '</td>';
        $html .= '<td>' . $row->usuario . '</td>';
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

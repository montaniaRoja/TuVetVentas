<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['codigo'])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    $fechaInicial = date('Y-m-d', strtotime($_POST['fInicial']));
    $fechaFinal = date('Y-m-d', strtotime($_POST['fFinal']));
    //$sucursal = $_POST['sucursal'];

    $consulta = "SELECT cp.compra_fecha, cp.compra_nodoc, cd.producto_codbarra, p.prod_nombre, cd.producto_cantidad, cd.producto_bonificacion, 
cd.producto_cantidadtotal, cd.producto_costo
from comprasdetalle cd join comprasproductos cp
on cd.compra_id=cp.id
join productos p
on cd.producto_codbarra=p.prod_codbarra
WHERE cp.compra_fecha BETWEEN $1 AND $2
                 AND cd.producto_codbarra = $3 ORDER BY cp.compra_fecha;";

    // Parámetros de la consulta
    $params = array($fechaInicial, $fechaFinal, $codigo);

    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);

    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>Doc</th>';
    $html .= '<th>Codigo</th>';
    $html .= '<th>Nombre</th>';
    $html .= '<th>Cantidad</th>';
    $html .= '<th>Bonificacion</th>';
    $html .= '<th>Total</th>';
    $html .= '<th>Costo</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';

    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->compra_fecha . '</td>';
        $html .= '<td>' . $row->compra_nodoc . '</td>';
        $html .= '<td>' . $row->producto_codbarra . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '<td>' . $row->producto_cantidad . '</td>';
        $html .= '<td>' . $row->producto_bonificacion . '</td>';
        $html .= '<td>' . $row->producto_cantidadtotal . '</td>';
        $html .= '<td>' . $row->producto_costo . '</td>';
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
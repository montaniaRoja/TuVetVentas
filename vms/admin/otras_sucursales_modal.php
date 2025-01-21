<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['codigo'])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    $sucursal = $_POST['sucursal'];
    
    $consulta = "SELECT
    h.id_sucursal,
    s.sucursal_nombre,
    d.cod_barra,
    p.prod_nombre,
    d.cantidad as cantidad,
    d.fecha,
    CASE
        WHEN d.fecha >= CURRENT_DATE - INTERVAL '30 days' THEN ' Menos de 30 días'
        WHEN d.fecha >= CURRENT_DATE - INTERVAL '60 days' THEN 'Mas de 30 días'
        ELSE 'Más de 60 días atrás'
    END AS rango
FROM
    dfacturas d
JOIN
    productos p ON d.cod_barra = p.prod_codbarra
JOIN
    hfacturas h ON d.id_hfactura = h.id
JOIN
    sucursales s ON h.id_sucursal = s.id
WHERE
    d.cod_barra = $1
    AND d.fecha >= CURRENT_DATE - INTERVAL '60 days'
    AND d.validado_sn = 1
    AND h.id_sucursal != $2
ORDER BY
    d.cod_barra;";
    
    // Parámetros de la consulta
    $params = array($codigo, $sucursal);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th>Nombre Sucursal</th>';
    $html .= '<th>Codigo</th>';
    $html .= '<th>Nombre Producto</th>';
    $html .= '<th>Cantidad</th>';
    $html .= '<th>Fecha de Venta</th>';
    $html .= '<th>Rango de Venta</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->sucursal_nombre . '</td>';
        $html .= '<td>' . $row->cod_barra . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '<td>' . $row->cantidad . '</td>';
        $html .= '<td>' . $row->fecha . '</td>';
        $html .= '<td>' . $row->rango . '</td>';
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

<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['codigo'])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    

    $consulta = "select d.producto_codbarra, p.prod_nombre, d.producto_cantidad, d.producto_bonificacion,
d.producto_cantidadtotal, d.producto_costo, d.producto_subtotal, d.producto_porciva,
d.producto_totallinea, m.marca_nombre
from comprasdetalle d
join productos p
on d.producto_codbarra=p.prod_codbarra
join marcas m
on p.id_marca=m.id
where d.compra_id=$1;";

    // Parámetros de la consulta
    $params = array($codigo);

    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);

    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Codigo</th>';
    $html .= '<th>Nombre</th>';
    $html .= '<th>Marca</th>';
    $html .= '<th>Cantidad</th>';
    $html .= '<th>Bonificacion</th>';
    $html .= '<th>C. Total</th>';
    $html .= '<th>Costo U</th>';
    $html .= '<th>SubTotal</th>';
    $html .= '<th>Iva</th>';
    $html .= '<th>Total</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';

    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->producto_codbarra . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '<td>' . $row->marca_nombre . '</td>';
        $html .= '<td style="text-align: right;">' . $row->producto_cantidad . '</td>';
        $html .= '<td style="text-align: right;">' . $row->producto_bonificacion . '</td>';
        $html .= '<td style="text-align: right;">' . $row->producto_cantidadtotal . '</td>';
        $html .= '<td style="text-align: right;">$' . number_format($row->producto_costo, 2) . '</td>';
        $html .= '<td style="text-align: right;">$' . number_format($row->producto_subtotal, 2) . '</td>';
        $html .= '<td style="text-align: right;">$' . number_format($row->producto_porciva, 2) . '</td>';
        $html .= '<td style="text-align: right;">$' . number_format($row->producto_totallinea, 2) . '</td>';
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
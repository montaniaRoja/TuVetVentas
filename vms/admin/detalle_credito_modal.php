<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['idcliente'])) {
    
    $codigo = $_POST['idcliente'];
    
    $consulta="select d.cod_barra, p.prod_nombre, d.cantidad, d.total_linea, h.numero_impreso, s.sucursal_nombre, h.pago_credito 
    from dfacturas d
    join productos p
    on d.cod_barra=p.prod_codbarra
    join hfacturas h
    on d.id_hfactura=h.id
    join sucursales s
    on h.id_sucursal=s.id
    where h.id_cliente=$1
        and d.validado_sn=1 and d.anulada_sn=0
        and h.pago_credito>0;";
    
    
    
    // Parámetros de la consulta
    $params = array($codigo);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    // Construir el HTML para mostrar los datos
$html = '<table id="exampleDetalle" class="table" style="width:100%">';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Codigo de Barra</th>';
$html .= '<th>Nombre Producto</th>';
$html .= '<th>Cantidad</th>';
$html .= '<th>Total Linea</th>';
$html .= '<th>Numero de Factura</th>';
$html .= '<th>Sucursal</th>';
$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';

$total_cargo = 0;

while ($row = pg_fetch_object($result)) {
    $formatted_cargo = number_format($row->total_linea, 2, '.', ',');

    $html .= '<tr>';
    $html .= '<td>' . $row->cod_barra . '</td>';
    $html .= '<td>' . $row->prod_nombre . '</td>';
    $html .= '<td>' . $row->cantidad . '</td>';
    $html .= '<td>$' . $formatted_cargo . '</td>';
    $html .= '<td>' . $row->numero_impreso . '</td>'; // Corrección aquí
    $html .= '<td>' . $row->sucursal_nombre . '</td>';
    $html .= '</tr>';

    $total_cargo += $row->total_linea;
}

$formatted_total_cargo = number_format($total_cargo, 2, '.', ',');

$html .= '</tbody>';
$html .= '<tfoot>';
$html .= '<tr>';
$html .= '<td colspan="3" style="text-align:right"><strong>Total:</strong></td>';
$html .= '<td>$' . $formatted_total_cargo . '</td>';
$html .= '<td></td>'; // Ajustar columnas aquí
$html .= '<td></td>'; // Ajustar columnas aquí
$html .= '</tr>';
$html .= '</tfoot>';
$html .= '</table>';

echo $html;

    
    
} else {
    echo "Error: No se recibió el id del cliente.";
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
   new DataTable('#exampleDetalle');
</script>

</body>
</html>
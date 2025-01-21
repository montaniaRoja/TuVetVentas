<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['idcliente'])) {
    
    $codigo = $_POST['idcliente'];
    
    $consulta="SELECT e.fecha, e.sucursal, s.sucursal_nombre, e.cargo, e.abono, e.usuario, e.doc_numero
    FROM extractosclientes e
    JOIN sucursales s
    ON e.sucursal=s.id
    WHERE e.cliente_id=$1 AND
        e.anulada=0
    ORDER BY fecha;";
    
    
    
    // Parámetros de la consulta
    $params = array($codigo);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="exampleHistorial" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>Sucursal</th>';
    $html .= '<th>Nombre Sucursal</th>';
    $html .= '<th>Numero Factura</th>';
    $html .= '<th>Cargo</th>';
    $html .= '<th>Abono</th>';
    $html .= '<th>Usuario</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    $total_cargo = 0;
    $total_abono = 0;
    
    while ($row = pg_fetch_object($result)) {
        $formatted_cargo = number_format($row->cargo, 2, '.', ',');
        $formatted_abono = number_format($row->abono, 2, '.', ',');
    
        $html .= '<tr>';
        $html .= '<td>' . $row->fecha . '</td>';
        $html .= '<td>' . $row->sucursal . '</td>';
        $html .= '<td>' . $row->sucursal_nombre . '</td>';
        $html .= '<td>' . $row->doc_numero . '</td>';
        $html .= '<td>$' . $formatted_cargo . '</td>';
        $html .= '<td>$' . $formatted_abono . '</td>';
        $html .= '<td>' . $row->usuario . '</td>';
        $html .= '</tr>';
    
        $total_cargo += $row->cargo;
        $total_abono += $row->abono;
    }
    
    $formatted_total_cargo = number_format($total_cargo, 2, '.', ',');
    $formatted_total_abono = number_format($total_abono, 2, '.', ',');
    $difference = $total_cargo - $total_abono;
    $formatted_difference = number_format($difference, 2, '.', ',');
    
    $html .= '</tbody>';
    $html .= '<tfoot>';
    $html .= '<tr>';
    $html .= '<td colspan="4" style="text-align:right"><strong>Total:</strong></td>';
    $html .= '<td>$' . $formatted_total_cargo . '</td>';
    $html .= '<td>$' . $formatted_total_abono . '</td>';
    $html .= '</tr>';
    $html .= '<tr>';
    $html .= '<td colspan="4" style="text-align:right"><strong>Saldo:</strong></td>';
    $html .= '<td colspan="2">$' . $formatted_difference . '</td>';
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
   new DataTable('#exampleHistorial');
</script>

</body>
</html>
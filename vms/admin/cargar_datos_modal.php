<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['id'])) {
    $idFromButton = intval($_POST['id']);
    
    // Realizar la consulta para obtener los datos del cliente
    $query = pg_query($db, "SELECT p.fecha, c.cliente_nombre, p.id_factura, p.monto_factura, p.monto_acumulado, p.monto_redimido, p.usuario_crea, p.id_cliente
            FROM puntos_clientes p JOIN clientes c ON p.id_cliente = c.id
            WHERE p.id_cliente = '$idFromButton'");
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Fecha</th>';
    $html .= '<th>ID Cliente</th>';
    $html .= '<th>Cliente</th>';
    $html .= '<th>No Factura</th>';
    $html .= '<th>Monto Factura</th>';
    $html .= '<th>Monto Acumulado</th>';
    $html .= '<th>Monto Redimido</th>';
    $html .= '<th>Usuario</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    $totalAcumulado = 0;
    $totalRedimido = 0;
    $saldoPuntos = 0;
    
    while ($row = pg_fetch_object($query)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->fecha . '</td>';
        $html .= '<td>' . $row->id_cliente . '</td>';
        $html .= '<td>' . $row->cliente_nombre . '</td>';
        $html .= '<td>' . $row->id_factura . '</td>';
        $html .= '<td>' . $row->monto_factura . '</td>';
        $html .= '<td>' . $row->monto_acumulado . '</td>';
        $html .= '<td>' . $row->monto_redimido . '</td>';
        $html .= '<td>' . $row->usuario_crea . '</td>';
        $html .= '</tr>';
        
        $totalAcumulado += $row->monto_acumulado;
        $totalRedimido += $row->monto_redimido;
    }
    
    $saldoPuntos = $totalAcumulado - $totalRedimido;
    $html .= '</tbody>';
    $html .= '<tfoot>';
    $html .= '<tr>';
    $html .= '<td colspan="5">Total Acumulado  Redimido Saldo</td>';
    $html .= '<td>' . $totalAcumulado . '</td>';
    $html .= '<td>' . $totalRedimido . '</td>';
    $html .= '<td>' . $saldoPuntos . '</td>';
    $html .= '</tr>';
    $html .= '</tfoot>';
    
    $html .= '</table>';
    
    echo $html;
} else {
    echo "Error: No se recibió el ID del cliente.";
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
<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['btnExcel'])) {
    
    $codigoCliente = $_REQUEST['codcliente'];
    
    $queryCliente = pg_query($db, "SELECT p.fecha, c.cliente_nombre, p.id_factura, p.monto_factura, p.monto_acumulado, p.monto_redimido, p.usuario_crea, p.id_cliente
            FROM puntos_clientes p JOIN clientes c ON p.id_cliente = c.id
            WHERE p.id_cliente = '$codigoCliente' limit(1)");
    
    // Obtener el nombre del cliente
    $cliente_nombre = ''; // Inicializar la variable
    if ($row = pg_fetch_object($queryCliente)) {
        $cliente_nombre = $row->cliente_nombre; // Asignar el nombre del cliente
    }
    
    $reporte = "reporte_puntos_cliente_" . $cliente_nombre . ".xls";
    
    $query = pg_query($db, "SELECT p.fecha, c.cliente_nombre, p.id_factura, p.monto_factura, p.monto_acumulado, p.monto_redimido, p.usuario_crea, p.id_cliente
            FROM puntos_clientes p JOIN clientes c ON p.id_cliente = c.id
            WHERE p.id_cliente = '$codigoCliente'");
    
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="8">Reporte entradas de Productos</th>';
    echo '</tr>';
    echo '<tr>
    <th>Fecha</th>
    <th>Id Cliente</th>
    <th>Nombre Cliente</th>
    <th>No Factura</th>
    <th>Monto Factura</th>
    <th>Puntos Acumulado</th>
    <th>Puntos Redimidos</th>
    <th>Usuario Proceso</th>
    </tr>';
    
    $totalAcumulado = 0;
    $totalRedimido = 0;
    
    while ($row = pg_fetch_object($query)) {
        echo '<tr>';
        echo '<td>' . $row->fecha . '</td>';
        echo '<td>' . $row->id_cliente . '</td>';
        echo '<td>' . $row->cliente_nombre . '</td>';
        echo '<td>' . $row->id_factura . '</td>';
        echo '<td>' . $row->monto_factura . '</td>';
        echo '<td>' . $row->monto_acumulado . '</td>';
        echo '<td>' . $row->monto_redimido . '</td>';
        echo '<td>' . $row->usuario_crea . '</td>';
        
        $totalAcumulado += $row->monto_acumulado;
        $totalRedimido += $row->monto_redimido;
        
        echo '</tr>';
    }
    
    echo '<tr>';
    echo '<td colspan="5">Total Acumulado</td>';
    echo '<td>' . $totalAcumulado . '</td>';
    echo '<td colspan="2"></td>'; // Ajusta según la cantidad de columnas
    echo '</tr>';
    
    echo '<tr>';
    echo '<td colspan="5">Total Redimido</td>';
    echo '<td>' . $totalRedimido . '</td>';
    echo '<td colspan="2"></td>'; // Ajusta según la cantidad de columnas
    echo '</tr>';
    
    echo '<tr>';
    echo '<td colspan="5">Diferencia</td>';
    echo '<td>' . ($totalAcumulado - $totalRedimido) . '</td>';
    echo '<td colspan="2"></td>'; // Ajusta según la cantidad de columnas
    echo '</tr>';
    
    echo '</table>';
    
}

?>
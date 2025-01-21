<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['historialexcel'])) {
    
    $codigo = intval($_REQUEST['codigocliente']);
    $nombre=$_POST['ncliente'];
    
    
    $reporte = "reporte_historial_credito" . $nombre .".xls";
    
    $query = pg_query($db, "SELECT e.fecha, e.sucursal, s.sucursal_nombre, e.cargo, e.abono, e.usuario, e.doc_numero
    FROM extractosclientes e
    JOIN sucursales s
    ON e.sucursal=s.id
    WHERE e.cliente_id='$codigo' AND
        e.anulada=0
    ORDER BY fecha;");
    
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="7">Historial Creditos'.' '.$nombre.'</th>';
    echo '</tr>';
    echo '<tr>
    <th>Fecha</th>
    <th>Sucursal</th>
    <th>Nombre Sucursal</th>
    <th>Factura</th>
    <th>Cargo</th>
    <th>Abono</th>
    <th>Usuario</th>
    </tr>';
    
        
    while ($row = pg_fetch_object($query)) {
        echo '<tr>';
        echo '<td>' . $row->fecha . '</td>';
        echo '<td>' . $row->sucursal . '</td>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->doc_numero . '</td>';
        echo '<td>' . $row->cargo . '</td>';
        echo '<td>' . $row->abono . '</td>';
        echo '<td>' . $row->usuario . '</td>';
        echo '</tr>';
    }
    
        
    echo '</table>';
    
}

?>
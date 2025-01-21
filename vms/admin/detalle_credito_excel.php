<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['detalleexcel'])) {
    
    $codigo = intval($_REQUEST['id_cliente']);
    $nombre=$_POST['n_cliente'];
    
    
    $reporte = "reporte_detalle_credito" . $nombre .".xls";
    
    $query = pg_query($db, "select d.cod_barra, p.prod_nombre, d.cantidad, d.total_linea, h.numero_impreso, s.sucursal_nombre, h.pago_credito 
    from dfacturas d
    join productos p
    on d.cod_barra=p.prod_codbarra
    join hfacturas h
    on d.id_hfactura=h.id
    join sucursales s
    on h.id_sucursal=s.id
    where h.id_cliente='$codigo'
        and d.validado_sn=1 and d.anulada_sn=0
        and h.pago_credito>0;");
    
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="6">Historial Creditos'.' '.$nombre.'</th>';
    echo '</tr>';
    echo '<tr>
    <th>Codigo</th>
    <th>Nombre Producto</th>
    <th>Cantidad</th>
    <th>Total Linea</th>
    <th>Documento No.</th>
    <th>Sucursal</th>
    </tr>';
    
        
    while ($row = pg_fetch_object($query)) {
        echo '<tr>';
        echo '<td>' . $row->cod_barra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->cantidad . '</td>';
        echo '<td>' . $row->total_linea . '</td>';
        echo '<td>' . $row->numero_impreso . '</td>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '</tr>';
    }
    
        
    echo '</table>';
    
}

?>
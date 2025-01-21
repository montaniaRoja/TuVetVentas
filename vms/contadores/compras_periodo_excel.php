<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');



check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}


if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    
    
        
        
        $detalledeventas = pg_query($db, "select cd.producto_codbarra, p.prod_nombre, sum(cd.producto_cantidad) as cantidad,
sum(cd.producto_bonificacion) as bonificacion, sum(cd.producto_cantidadtotal) as ctotal,
sum(cd.producto_subtotal) as subtotal, sum(cd.producto_porciva) as iva,sum(cd.producto_totallinea) as totallinea,pr.prov_nombre as proveedor
from comprasdetalle cd
join productos p on cd.producto_codbarra=p.prod_codbarra
join comprasproductos cp
on cp.id=cd.compra_id
join proveedores pr 
on cp.proveedor_id=pr.id
where cp.compra_fecha between '$fechaInicial' and '$fechaFinal'
group by cd.producto_codbarra, p.prod_nombre, pr.prov_nombre
order by pr.prov_nombre;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "detalledecompras_" . $fechaInicial ."__".$fechaFinal. ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="9">Reporte Detalle de compras</th>';
        echo '</tr>';
        echo '<tr>
                         <th>cod Barra</th>
                        <th>Nombre Producto</th>
                        <th>Cantidad</th>
                        <th>Bonificacion</th>
                        <th>total</th>
                        <th>Subtotal</th>
                        <th>Iva</th>
                        <th>total </th>
                        <th>Proveedor </th>
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->producto_codbarra . '</td>';
            echo '<td>' . $row->prod_nombre . '</td>';
            echo '<td>' . $row->cantidad . '</td>';
            echo '<td>' . $row->bonificacion . '</td>';
            echo '<td>' . $row->ctotal . '</td>';
            echo '<td>' . $row->subtotal . '</td>';
            echo '<td>' . $row->iva . '</td>';
            echo '<td>' . $row->totallinea . '</td>';
            echo '<td>' . $row->proveedor . '</td>';
            echo '</tr>';
        }
        
        echo '</table>';
        
        
        
    
    
}
?>
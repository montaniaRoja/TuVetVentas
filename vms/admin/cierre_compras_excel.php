<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
$fechaHoraActual = date('Y-m-d H:i:s');


check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}


if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    
    // Opción seleccionada: Excel
        $guardarLog=pg_query($db,"insert into log (fecha, descripcion) values ('$fechaHoraActual','imprimir cierre de compras excel')");
        
        $detalledeventas = pg_query($db, "select c.compra_fecha, c.compra_condicion,c.proveedor_id,p.prov_nombre ,c.compra_nodoc, 
c.compra_subtotal, c.compra_montoiva, c.compra_montoretencion, c.compra_total,
c.sucursal_id, s.sucursal_nombre
from comprasproductos as c join proveedores p
on c.proveedor_id=p.id
join sucursales s on c.sucursal_id=s.id
where c.compra_fecha ='$fechaInicial';");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "cierredecompras_" . $fechaHoraActual . ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="9">Cierre de Compras</th>';
        echo '</tr>';
        echo '<tr>
    
                        <th>Fecha</th>
                        <th>Condicion</th>
                        <th>id Proveedor</th>
                        <th>Nombre Proveedor</th>
                        <th>CCF o Factura</th>
                        <th>Subtotal</th>
                        <th>Iva</th>
                        <th>Retencion</th>
                        <th>Total</th>
                        <th>Sucursal</th>
            
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->compra_fecha . '</td>';
            echo '<td>' . $row->compra_condicion . '</td>';
            echo '<td>' . $row->proveedor_id . '</td>';
            echo '<td>' . $row->prov_nombre . '</td>';
            echo '<td>' . $row->compra_nodoc . '</td>';
            echo '<td>' . $row->compra_subtotal . '</td>';
            echo '<td>' . $row->compra_montoiva . '</td>';
            echo '<td>' . $row->compra_montoretencion . '</td>';
            echo '<td>' . $row->compra_total . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '</tr>';
        }
        
        echo '</table>';
        
       
    
}


?>
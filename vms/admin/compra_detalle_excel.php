<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');

check_login();


if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];


    $detalledeventas = pg_query($db, "select c.id, c.compra_fecha, p.prov_nombre, c.compra_nodoc,
c.compra_condicion, c.compra_subtotal, c.compra_montoiva, c.compra_montoretencion,
c.compra_total
from comprasproductos c
join proveedores p
on c.proveedor_id=p.id
where c.compra_fecha between '$fechaInicial' and '$fechaFinal'
order by id;");
            
            $fechaHoraActual = date("Y-m-d_H-i-s");
            $reporte = "compras_por_periodo_" . $fechaHoraActual . ".xls";
            
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment; filename="' . $reporte . '"');
            header('Pragma: no-cache');
            header('Expires: 0');
            
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="9">Reporte Lista de Compras</th>';
            echo '</tr>';
            echo '<tr>
    <th>id Compra</th>
    <th>Fecha</th>
    <th>Proveedor</th>
    <th># Documento</th>
    <th>Condicion</th>
    <th>Subtotal</th>
    <th>iva</th>
    <th>Retencion</th>
    <th>Total Compra</th>
    
    </tr>';
            
            while ($row = pg_fetch_object($detalledeventas)) {
                echo '<tr>';
                echo '<td>' . $row->id . '</td>';
                echo '<td>' . $row->compra_fecha . '</td>';
                echo '<td>' . $row->prov_nombre . '</td>';
                echo '<td>' . $row->compra_nodoc . '</td>';
                echo '<td>' . $row->compra_condicion . '</td>';
                echo '<td>' . $row->compra_subtotal . '</td>';
                echo '<td>' . $row->compra_montoiva . '</td>';
                echo '<td>' . $row->compra_montoretencion . '</td>';
                echo '<td>' . $row->compra_total . '</td>';                
                echo '</tr>';
            }
            
            echo '</table>';
            
            
            
        }
    

?>
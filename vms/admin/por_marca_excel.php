<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');



check_login();


if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
        
    $proveedorId = $_POST['proveedor'];
    $proveedorList = implode(",", $proveedorId);
        
        $detalledeventas = pg_query($db, "select m.id as marcaid, m.marca_nombre, pr.prov_nombre, sum(d.total_linea) as total from
                                        dfacturas d
                                        join productos p
                                        on d.cod_barra=p.prod_codbarra
                                        join marcas m
                                        on p.id_marca=m.id
										join proveedores pr
										on m.proveedor_id=pr.id
                                        WHERE d.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
                                        and d.validado_sn=1 and d.anulada_sn=0
										and pr.id IN ($proveedorList)
                                        group by m.marca_nombre, marcaid, pr.prov_nombre
                                        order by total desc;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "detalledeventas_pormarca" . $fechaHoraActual . ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="4">Reporte Detalle de Ventas</th>';
        echo '</tr>';
        echo '<tr>
    <th>Marca id</th>
    <th>Proveedor</th>
    <th>Nombre Marca</th>
    <th>total ventas</th>
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->marcaid . '</td>';
            echo '<td>' . $row->prov_nombre . '</td>';
            echo '<td>' . $row->marca_nombre . '</td>';
            echo '<td>' . $row->total . '</td>';
            echo '</tr>';
        }
        
        echo '</table>';
    
    
}
?>
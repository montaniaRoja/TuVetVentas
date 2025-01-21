<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');



check_login();


if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal=$_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);

        
     
        
        $detalledeventas = pg_query($db, "select c.id as catid, s.id as sucursalid, s.sucursal_nombre, c.cat_nombre as categoria, sum(d.total_linea) as total from dfacturas d
        join productos p
        on d.cod_barra=p.prod_codbarra
        join categorias c
        on p.id_categorias=c.id
        join sucursales s on d.sucursal_id=s.id
        where d.fecha between '$fechaInicial' and '$fechaFinal'
        and d.sucursal_id IN($sucursalList)
        and d.validado_sn=1 and anulada_sn='0'
            group by c.cat_nombre, c.id, s.sucursal_nombre, s.id
            order by categoria;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "detalledeventas_porcategoria" . $fechaHoraActual . ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="3">Reporte Ventas por Categoria</th>';
        echo '</tr>';
        echo '<tr>
    <th>Marca id</th>
    <th>Nombre Sucursal</th>
    <th>Nombre Categoria</th>
    <th>total ventas</th>
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->catid . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '<td>' . $row->categoria . '</td>';
            echo '<td>' . $row->total . '</td>';
            echo '</tr>';
        }
        
        echo '</table>';
    
    
}
?>
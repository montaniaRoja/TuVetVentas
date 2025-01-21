<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');

check_login();

if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];

    $detalledeventas = pg_query($db, "select c.id, c.cat_nombre, sum(d.total_linea) as total
from dfacturas d join productos p
on d.cod_barra=p.prod_codbarra
join categorias c
on p.id_categorias=c.id
where d.validado_sn=1 and d.anulada_sn=0
and d.fecha between '$fechaInicial' and '$fechaFinal'
group by c.cat_nombre, c.id
order by c.cat_nombre;");

    $fechaHoraActual = date("Y-m-d_H-i-s");
    $reporte = "detalledeventas_" . $fechaHoraActual . ".xls";

    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');

    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="3">Consolidado ventas categoría</th>';
    echo '</tr>';
    echo '<tr>    
    <th>Cat id</th>
    <th>Categoría</th>
    <th>Total</th>    
    </tr>';

    while ($row = pg_fetch_object($detalledeventas)) {
        echo '<tr>';
        echo '<td>' . htmlspecialchars($row->id) . '</td>';
        echo '<td>' . htmlspecialchars($row->cat_nombre) . '</td>';
        // Asegurarse de imprimir el total como número
        echo '<td>' . number_format((float)$row->total, 2, '.', '') . '</td>';
        echo '</tr>';
    }

    echo '</table>';
}
?>
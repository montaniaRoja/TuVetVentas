<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['categoria'])) {
    $detalle = array();
    $categoria = $_POST['categoria'];
    $fechaInicial = date('Y-m-d', strtotime($_POST['fInicial']));
    $fechaFinal = date('Y-m-d', strtotime($_POST['fFinal']));

    $consulta = "select s.sucursal_nombre, c.id, c.cat_nombre, sum(d.total_linea) as total
from dfacturas d join productos p
on d.cod_barra=p.prod_codbarra
join categorias c
on p.id_categorias=c.id
join sucursales s
on d.sucursal_id=s.id
where d.validado_sn=1 and d.anulada_sn=0
and c.id=$3
and d.fecha between $1 and $2
group by c.cat_nombre, c.id, s.sucursal_nombre
order by c,cat_nombre;";

    // Parámetros de la consulta
    $params = array($fechaInicial, $fechaFinal, $categoria);

    // Ejecutar la consulta
    $result = pg_query_params($db, $consulta, $params);

    // Inicializar la variable para la suma total
    // Inicializar la variable para la suma total
    $totalSuma = 0;

    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Sucursal</th>';
    $html .= '<th>Categoria</th>';
    $html .= '<th>Monto</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';

    // Ciclo para generar las filas del cuerpo de la tabla
    while ($row = pg_fetch_object($result)) {
        $html .= '<tr>';
        $html .= '<td>' . htmlspecialchars($row->sucursal_nombre) . '</td>';
        $html .= '<td>' . htmlspecialchars($row->cat_nombre) . '</td>';
        $html .= '<td>$' . number_format((float)$row->total, 2, '.', ',') . '</td>';
        $html .= '</tr>';

        // Acumular el total
        $totalSuma += (float)$row->total;
    }

    $html .= '</tbody>';

    // Agregar el pie de tabla con el total
    $html .= '<tfoot>';
    $html .= '<tr>';
    $html .= '<td colspan="2" class="text-right"><strong>Total:</strong></td>';
    $html .= '<td><strong>$' . number_format($totalSuma, 2, '.', ',') . '</strong></td>';
    $html .= '</tr>';
    $html .= '</tfoot>';

    $html .= '</table>';

    // Imprimir el HTML generado
    echo $html;
} else {
    echo "Error: No se recibió el codigo producto.";
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
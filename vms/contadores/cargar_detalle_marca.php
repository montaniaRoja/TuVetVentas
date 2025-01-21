<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['codigo'])) {
    $idFromButton = intval($_POST['codigo']);
    $fechaInicial = $_POST['fInicial'];
    $fechaFinal = $_POST['fFinal'];
    
    // Realizar la consulta para obtener los datos del cliente
    $query = pg_query($db, "select d.cod_barra, p.prod_nombre, m.marca_nombre, sum(d.cantidad) as cantidad, sum(d.total_linea) as total
                                from dfacturas d
                                join productos p
                                on d.cod_barra=p.prod_codbarra
                                join marcas m
                                on p.id_marca=m.id
                                where m.id='$idFromButton'
                                and d.fecha between '$fechaInicial' and '$fechaFinal'
                                and d.validado_sn=1 and d.anulada_sn=0
                                group by d.cod_barra, p.prod_nombre, m.marca_nombre
                                order by d.cod_barra");
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Cod Barra</th>';
    $html .= '<th>Nombre Producto</th>';
    $html .= '<th>Marca</th>';
    $html .= '<th>Cantidad</th>';
    $html .= '<th>Total $</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
    $totalAcumulado = 0;
    $totalRedimido = 0;
    
    
    while ($row = pg_fetch_object($query)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->cod_barra . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '<td>' . $row->marca_nombre . '</td>';
        $html .= '<td>' . $row->cantidad . '</td>';
        $html .= '<td><strong>'."$ " . $row->total . '</strong></td>';
        $html .= '</tr>';
        
        $totalAcumulado += $row->cantidad;
        $totalRedimido += $row->total;
    }
    
    
    $html .= '</tbody>';
    $html .= '<tfoot>';
    $html .= '<tr>';
    $html .= '<td colspan="2">cantidad  Total S</td>';
    $html .= '<td>' .   '</td>';
    $html .= '<td><strong>' . $totalAcumulado . '</strong></td>';
    $html .= '<td><strong>' ."$ ". $totalRedimido . '</strong></td>';
    $html .= '</tr>';
    $html .= '</tfoot>';
    
    $html .= '</table>';
    
    echo $html;
} else {
    echo "Error: No se recibió el ID del cliente.";
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
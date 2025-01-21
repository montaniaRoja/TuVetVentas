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
    
    
    // Opción seleccionada: Excel
    $query = "INSERT INTO fechas (fecha_inicial, fecha_final)
              VALUES ($1, $2)";
    
    
    $params = array("'" . $fechaInicial . "'", "'" . $fechaFinal . "'");
    
    $result = pg_query_params($db, $query, $params);
    
    if ($result) {
        
        
        $guardarLog=pg_query($db,"insert into log (fecha, descripcion) values ('$fechaHoraActual','imprimir detalle ventas en excel')");
        
        
        $buscarFechas = "SELECT fecha_inicial, fecha_final FROM fechas WHERE id = (SELECT MAX(id) FROM fechas);";
        $fechaResultado = pg_query($db, $buscarFechas);
        $fila = pg_fetch_assoc($fechaResultado);
        $fechaInicial = $fila['fecha_inicial'];
        $fechaFinal = $fila['fecha_final'];
        
        
        
        
        
        $detalledeventas = pg_query($db, "SELECT
    vp.fecha,
    vp.sucursal,
    s.sucursal_nombre,
    vp.codigoprod,
    vp.nombreprod,
    pr.id_marca,
    m.marca_nombre,
    vp.cantidad,
    vp.usuario,
    vp.notas
FROM
    ventaperdida vp
LEFT JOIN productos pr ON vp.codigoprod = pr.prod_codbarra
LEFT JOIN marcas m ON pr.id_marca = m.id
LEFT JOIN sucursales s ON vp.sucursal = s.id
WHERE fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
AND vp.sucursal = ANY(ARRAY[$sucursalList]::int[])
ORDER BY vp.id;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "DetalleVentaPerdida_" . $fechaInicial .$fechaFinal. ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="8">Reporte Ventas Perdida</th>';
        echo '</tr>';
        echo '<tr>
                        
                        <th>Fecha</th>
                        <th>Sucursal Nombre</th>
                        <th>Codigo Producto</th>
                        <th>Nombre Producto</th>
                        <th>Marca</th>
                        <th>Cantidad</th>
                        <th>Usuario</th>
                        <th>Notas</th>
            
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->fecha . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '<td>' . $row->codigoprod . '</td>';
            echo '<td>' . $row->nombreprod . '</td>';
            echo '<td>' . $row->marca_nombre . '</td>';
            echo '<td>' . $row->cantidad . '</td>';
            echo '<td>' . $row->usuario . '</td>';
            echo '<td>' . $row->notas . '</td>';
            
            echo '</tr>';
        }
        
        echo '</table>';
        
        
        
    }
    
}
?>
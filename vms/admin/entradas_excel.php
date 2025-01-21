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
    $sucursalList = implode("','", $sucursal);
    $sucursalList = "('$sucursalList')";
    
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
        
        
        
        
        
        $detalledeventas = pg_query($db, "SELECT s.fecha, su.sucursal_nombre, s.codbarra, p.prod_nombre, s.cantidad, s.detalle, s.usuario_procesa, s.usuario_autoriza
FROM entradas s
JOIN sucursales su ON s.sucursal_id = su.id
JOIN productos p ON s.codbarra = p.prod_codbarra
WHERE estado = 'Procesado' AND s.sucursal_id IN $sucursalList AND s.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
ORDER BY fecha;;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "reporte_entradas_" . $fechaInicial .$fechaFinal. ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="8">Reporte entradas de Productos</th>';
        echo '</tr>';
        echo '<tr>
    <th>Fecha</th>
    <th>Nombre Sucursal</th>
    <th>Codigo</th>
    <th>Nombre</th>
    <th>Cantidad</th>
    <th>Detalle</th>
    <th>Usuario Proceso</th>
    <th>Usuario Autorizo</th>
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->fecha . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '<td>' . $row->codbarra . '</td>';
            echo '<td>' . $row->prod_nombre . '</td>';
            echo '<td>' . $row->cantidad . '</td>';
            echo '<td>' . $row->detalle . '</td>';
            echo '<td>' . $row->usuario_procesa . '</td>';
            echo '<td>' . $row->usuario_autoriza . '</td>';
            
            
            
            echo '</tr>';
        }
        
        echo '</table>';
        
        
        
    }
    
}
?>


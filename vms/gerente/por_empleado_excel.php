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
        
        
        
        
        
        $detalledeventas = pg_query($db, "select h.id_sucursal, s.sucursal_nombre ,h.creada_por, sum(h.pago_efectivo)+sum(h.pago_tarjeta)+sum(h.pago_credito) as total from hfacturas h
join sucursales s 
on h.id_sucursal=s.id
where pagada_sn=1 and fecha_cobro between '$fechaInicial' and '$fechaFinal'
AND h.id_sucursal IN ($sucursalList)
group by h.creada_por, h.id_sucursal, s.sucursal_nombre
order by total asc;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "detalledeventas_" . $fechaInicial .$fechaFinal. ".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="4">Reporte Ventas por Empleado</th>';
        echo '</tr>';
        echo '<tr>
    <th>idSucursal</th>
    <th>Nombre Sucursal</th>
    <th>Empleado</th>
    <th>Total</th>
    
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->id_sucursal . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '<td>' . $row->creada_por . '</td>';
            echo '<td>' . $row->total . '</td>';
            
            echo '</tr>';
        }
        
        echo '</table>';
        
        
        
    }
    
}
?>
<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
$fechaHoraActual = date('Y-m-d H:i:s');



check_login();
if ($_SESSION['usuario'] == "ATENCION") {
    header("Location: logout.php");
    exit();
}



if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal=$_POST['sucursal'];
    
    
    
    
    // Opción seleccionada: Excel
    $query = "INSERT INTO fechas (fecha_inicial, fecha_final)
              VALUES ($1, $2)";
    
    
    $params = array("'" . $fechaInicial . "'", "'" . $fechaFinal . "'");
    
    $result = pg_query_params($db, $query, $params);
    
    if ($result) {
        
        
        $guardarLog=pg_query($db,"insert into log (fecha, descripcion) values ('$fechaHoraActual','imprimir ventas por tipo de pago excel')");
        
        
        $buscarFechas = "SELECT fecha_inicial, fecha_final FROM fechas WHERE id = (SELECT MAX(id) FROM fechas);";
        $fechaResultado = pg_query($db, $buscarFechas);
        $fila = pg_fetch_assoc($fechaResultado);
        $fechaInicial = $fila['fecha_inicial'];
        $fechaFinal = $fila['fecha_final'];
        
        
        
        $sucursalList = implode(",", $sucursal);
        
        $detalledeventas = pg_query($db, "select h.id_sucursal,s.sucursal_nombre, sum(h.pago_efectivo) as efectivo, sum(h.pago_puntos) as puntos ,sum(h.pago_tarjeta) as tarjeta, sum(h.pago_credito) as credito,
sum(h.pago_efectivo)+sum(h.pago_tarjeta)+sum(h.pago_credito) as total
from hfacturas h 
join sucursales s on h.id_sucursal=s.id
where pagada_sn=1 and anulada=0
AND h.id_sucursal IN ($sucursalList)
and h.fecha_cobro BETWEEN '$fechaInicial' AND '$fechaFinal'
group by h.id_sucursal, s.sucursal_nombre
order by h.id_sucursal;");
        
        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "consolidado_tipo_pago_" . $fechaInicial ."__" .$fechaFinal.".xls";
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');
        
        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="7">Reporte Ventas por tipo de pago</th>';
        echo '</tr>';
        echo '<tr>
    <th>idSucursal</th>
    <th>Nombre Sucursal</th>
    
    <th>Efectivo</th>
    <th>Tarjeta</th>
    <th>Credito</th>
    <th>Puntos</th>
    <th>total</th>
            
    </tr>';
        
        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->id_sucursal . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '<td>' . $row->efectivo . '</td>';
            echo '<td>' . $row->tarjeta . '</td>';
            echo '<td>' . $row->credito . '</td>';
            echo '<td>' . $row->puntos . '</td>';
            echo '<td>' . $row->total . '</td>';
            
            echo '</tr>';
        }
        
        echo '</table>';
        
        
        
    }
    
    
    
}


?>
<?php
session_start();

// Control de errores y excepciones
// error_reporting(E_ALL); // Descomenta esta línea para mostrar todos los errores

include_once('include/config.php');
include('include/checklogin.php');

check_login();

if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}

if (isset($_POST['submit'])) {
    
    $fechaHoraActual = date("Y-m-d");
    $sucursal = $_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);
    $dias = intval($_POST['cars']);
    
    // Validar y limpiar datos del formulario para prevenir inyección de SQL
   
    $consulta = "SELECT e.id_sucursal, s.sucursal_nombre, e.codbarra, p.prod_nombre, e.existencia, p.prod_costopromedio, e.existencia * p.prod_costopromedio AS costototal,
    MAX(k.fecha_transaccion) AS ultimoingreso, MAX(v.fecha) AS ultimaventa
FROM existencias e
JOIN productos p ON e.codbarra = p.prod_codbarra
LEFT JOIN dfacturas v ON e.codbarra = v.cod_barra AND e.id_sucursal = v.sucursal_id
JOIN kardex k ON e.codbarra = k.codbarra AND k.cant_ingreso > 0 AND e.id_sucursal = k.sucursal_id
JOIN sucursales s ON e.id_sucursal = s.id
WHERE e.existencia > 0 AND e.id_sucursal IN ($sucursalList) AND p.prod_esinventariosn = 1
    AND p.prod_codbarra NOT IN (
        SELECT DISTINCT e.codbarra
        FROM existencias e
        JOIN dfacturas v ON e.codbarra = v.cod_barra
        JOIN kardex k ON e.codbarra = k.codbarra AND k.cant_ingreso > 0 AND e.id_sucursal = k.sucursal_id
        WHERE v.fecha >= CURRENT_DATE - INTERVAL '$dias days'
        OR k.fecha_transaccion >= CURRENT_DATE - INTERVAL '$dias days'
    )
GROUP BY e.id_sucursal, e.codbarra, p.prod_nombre, e.existencia, p.prod_costopromedio, s.sucursal_nombre;";
    
    $resultado = pg_query($db, $consulta);
    
    $reporte = "inv_muerto_" . $fechaHoraActual . ".xls";
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="8">Reporte Inv Muerto</th>';
    echo '</tr>';
    echo '<tr>
        <th>Sucursal</th>
        <th>Codigo</th>
        <th>Nombre Producto</th>
        <th>Existencia</th>
        <th>Costo</th>
        <th>Total</th>
        <th>fecha ultimo ingreso</th>
        <th>fecha ultima venta</th>
        </tr>';
    
    while ($row = pg_fetch_object($resultado)) {
        echo '<tr>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->codbarra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->existencia . '</td>';
        echo '<td>' . $row->prod_costopromedio . '</td>';
        echo '<td>' . $row->costototal . '</td>';
        echo '<td>' . $row->ultimoingreso . '</td>';
        echo '<td>' . $row->ultimaventa . '</td>';
        echo '</tr>';
    }
    
    echo '</table>';
}
?>
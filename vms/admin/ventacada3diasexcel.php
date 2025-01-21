<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['submit'])) {
    $sucursal=$_POST['sucursal'];
    $sucursalList = implode(",", $sucursal);
    $ventas = array();
    
    // Definir un array asociativo para las consultas
    $consultas = [
        ["30 days", "28 days"],
        ["27 days", "24 days"],
        ["23 days", "20 days"],
        ["19 days", "16 days"],
        ["15 days", "12 days"],
        ["11 days", "8 days"],
        ["7 days", "4 days"],
        ["3 days", "0 days"]
    ];
    
    foreach ($consultas as $rango) {
        // Construct the SQL query dynamically
        $consulta = "
        SELECT
            s.sucursal_nombre,
            d.cod_barra,
            p.prod_nombre,
            SUM(d.cantidad) as total_cantidad,
            h.id_sucursal,
            s.sucursal_nombre,
            current_date - INTERVAL '{$rango[0]}' as fecha_inicial,
            current_date - INTERVAL '{$rango[1]}' as fecha_final
        FROM
            dfacturas d
        JOIN
            productos p ON d.cod_barra = p.prod_codbarra
        JOIN
            hfacturas h ON d.id_hfactura = h.id
        JOIN
            sucursales s ON h.id_sucursal = s.id
        WHERE
            fecha BETWEEN current_date - INTERVAL '{$rango[0]}' AND current_date - INTERVAL '{$rango[1]}'
            AND h.id_sucursal IN ($sucursalList)
        GROUP BY
            d.cod_barra, p.prod_nombre, h.id_sucursal, s.sucursal_nombre";
        
        // Execute the query and handle errors
        $resultado = pg_query($db, $consulta);
        
        if (!$resultado) {
            die("Error en la consulta: " . pg_last_error($db));
        }
        
        // Process the results as needed
        while ($row = pg_fetch_assoc($resultado)) {
            // Handle the data (e.g., add it to your array $ventas)
            $ventas[] = $row;
        }
    }
    
    // Continue with any further processing or output
    
    $resultado = pg_query($db, $consulta);
    
    while ($row = pg_fetch_assoc($resultado)) {
        $ventas[] = $row;
    }
    
    
    // Generar un archivo Excel
    $reporte = "ventas_30_dias.xls";
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="5">Ventas 30 días</th>';
    echo '</tr>';
    
    echo '<tr>
    <th>sucursal</th>
    <th>Código</th>
    <th>Nombre</th>
    <th>Cantidad</th>
    <th>Fecha Inicial</th>
    <th>Fecha Final</th>
    </tr>';
    
    foreach ($ventas as $venta) {
        echo '<tr>';
        echo '<td>' . $venta['sucursal_nombre'] . '</td>';
        echo '<td>' . $venta['cod_barra'] . '</td>';
        echo '<td>' . $venta['prod_nombre'] . '</td>';
        echo '<td>' . $venta['total_cantidad'] . '</td>';
        echo '<td>' . $venta['fecha_inicial'] . '</td>';
        echo '<td>' . $venta['fecha_final'] . '</td>';
        echo '</tr>';
    }
    
    echo '</table>';
}
    
?>
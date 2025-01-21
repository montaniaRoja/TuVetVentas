<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include_once('include/checklogin.php');
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}
check_login();

$sucursal=$_POST['sucursal'];

$sucursales = pg_query($db, "SELECT * FROM sucursales where id='$sucursal'");

$ventas = array();
$contador=0;
// Determinar la cantidad de productos


// Mientras haya filas en el resultado
while ($filaSucursal = pg_fetch_assoc($sucursales)){
    // Acceder a las propiedades del arreglo asociativo con corchetes
    $nombreSucursal = $filaSucursal['sucursal_nombre'];
    $sucursalId = $filaSucursal['id'];
    
    $productos = pg_query($db, "SELECT p.prod_codbarra, p.prod_nombre, m.marca_nombre, e.existencia FROM productos p 
                                join existencias e
                                on p.prod_codbarra=e.codbarra
                                join marcas m
                                on p.id_marca=m.id
                                where e.id_sucursal=7;");
    
    while ($filaProducto = pg_fetch_assoc($productos)) {
        $codBarra = $filaProducto['prod_codbarra'];
        $nombreProducto = $filaProducto['prod_nombre'];
        $marcaProducto=$filaProducto['marca_nombre'];
        $existenciaBodega=$filaProducto['existencia'];
        $contador += 1;
        
        $venta30dias = pg_query($db, "SELECT sum(cantidad) as cantidad FROM dfacturas WHERE cod_barra='$codBarra' AND sucursal_id='$sucursalId' AND fecha >= current_date-30 AND validado_sn=1");
        
        while ($filaVenta = pg_fetch_assoc($venta30dias)) {
            $cantidad = ($filaVenta['cantidad'] > 0) ? $filaVenta['cantidad'] : 0;
            
            $existencias = pg_query($db, "SELECT * FROM existencias WHERE id_sucursal='$sucursalId' AND codbarra='$codBarra'");
            while ($filaExistencias = pg_fetch_assoc($existencias)) {
                $inv = $filaExistencias['existencia'];
                
                $reorden = pg_query($db, "SELECT * FROM puntosdereorden WHERE id_sucursal='$sucursalId' AND codbarra='$codBarra'");
                while ($filaReorden = pg_fetch_assoc($reorden)) {
                    $ptoreorden = $filaReorden['ptoreorden'];
                    
                    $topVentas = pg_query($db, "SELECT * FROM dfacturas WHERE cod_barra='$codBarra'
                                                AND sucursal_id='$sucursalId' AND fecha >= current_date-30
                                                AND validado_sn=1 ORDER BY cantidad DESC LIMIT 3");
                    
                    $cont = 0;
                    $topUno = $topDos = $topTres = 0; // Inicializar las variables
                    
                    while ($filaTop = pg_fetch_assoc($topVentas)) {
                        if ($cont == 0) {
                            $topUno = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                        } elseif ($cont == 1) {
                            $topDos = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                        } elseif ($cont == 2) {
                            $topTres = ($filaTop['cantidad'] > 0) ? $filaTop['cantidad'] : 0;
                        }
                        $cont++;
                    }
                    
                    
                    // Crear un array asociativo para cada iteración y agregarlo al array principal
                    $venta = array(
                        'contador' => $contador,
                        'sucursalId' => $sucursalId,
                        'nombreSucursal' => $nombreSucursal,
                        'codBarra' => $codBarra,
                        'nombreProducto' => $nombreProducto,
                        'marcaProducto' => $marcaProducto,
                        'existenciaBodega' => $existenciaBodega,
                        'cantidad' => $cantidad,
                        'inv' => $inv,
                        'ptoreorden' => $ptoreorden,
                        'topUno' => $topUno,
                        'topDos' => $topDos,
                        'topTres' => $topTres,
                        'sugerencia' => ($inv == 0) ? ($ptoreorden - $inv) : ($inv - $ptoreorden),
                        'pedidobodega' => $ptoreorden - $inv,
                    );
                    
                    
                    // Agregar el array al array principal
                    $ventas[] = $venta;
                }
            }
        }
    }
    
    $contador = 0;
}


//Generar un archivo Excel
$reporte = "ventas_30_dias.xls";

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment; filename="' . $reporte . '"');
header('Pragma: no-cache');
header('Expires: 0');

echo '<table border="1">';
echo '<tr>';
echo '<th colspan="15">Ventas 30 días</th>';
echo '</tr>';

echo '<tr>
    <th>contador</th>
    <th>Id Sucursal</th>
    <th>Nombre Sucursal</th>
    <th>cod Barra</th>
    <th>Producto</th>
    <th>Marca</th>
    <th>Existencia bodega</th>
    <th>Venta 30 dias</th>
    <th>Existencia</th>
    <th>Punto Reorden</th>
    <th>Venta maxima</th>
    <th>Venta Segunda</th>
    <th>Venta Tercera</th>
    <th>Sugerencia Pedido</th>
    <th>Pedido a Bodega</th>

    </tr>';

foreach ($ventas as $venta) {
    if($venta['pedidobodega']>0){
    echo '<tr>';
    echo '<td>' . $venta['contador'] . '</td>';
    echo '<td>' . $venta['sucursalId'] . '</td>';
    echo '<td>' . $venta['nombreSucursal'] . '</td>';
    echo '<td>' . $venta['codBarra'] . '</td>';
    echo '<td>' . $venta['nombreProducto'] . '</td>';
    echo '<td>' . $venta['marcaProducto'] . '</td>';
    echo '<td>' . $venta['existenciaBodega'] . '</td>';
    echo '<td>' . $venta['cantidad'] . '</td>';
    echo '<td>' . $venta['inv'] . '</td>';
    echo '<td>' . $venta['ptoreorden'] . '</td>';
    echo '<td>' . $venta['topUno'] . '</td>';
    echo '<td>' . $venta['topDos'] . '</td>';
    echo '<td>' . $venta['topTres'] . '</td>';
    echo '<td>' . $venta['sugerencia'] . '</td>';
    echo '<td>' . $venta['pedidobodega'] . '</td>';
    echo '</tr>';
    }
}

echo '</table>';

?>
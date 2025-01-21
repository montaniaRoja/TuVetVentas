<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');

if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}


check_login();


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
            
            
            $guardarLog=pg_query($db,"insert into log (fecha, descripcion) values ('$fechaHoraActual','imprimir detalle ventas en excel')");
            
            
            $buscarFechas = "SELECT fecha_inicial, fecha_final FROM fechas WHERE id = (SELECT MAX(id) FROM fechas);";
            $fechaResultado = pg_query($db, $buscarFechas);
            $fila = pg_fetch_assoc($fechaResultado);
            $fechaInicial = $fila['fecha_inicial'];
            $fechaFinal = $fila['fecha_final'];
            
            
            
            $sucursalList = implode(",", $sucursal);
            
            $detalledeventas = pg_query($db, "SELECT h.id_sucursal, s.sucursal_nombre, d.cod_barra, p.prod_nombre, sum(d.cantidad) as cantidad,
    p.prod_preciopublico, sum(monto_costo) as costo, sum(iva) as iva, sum(monto_descuento) as descuento,
    sum(d.total_linea) as total
    FROM dfacturas d
    JOIN productos p ON d.cod_barra = p.prod_codbarra
    JOIN hfacturas h ON d.id_hfactura = h.id
    JOIN sucursales s ON h.id_sucursal = s.id
    WHERE d.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
    AND h.id_sucursal IN ($sucursalList)
    AND d.validado_sn=1
    GROUP BY d.cod_barra, p.prod_preciopublico, h.id_sucursal, s.sucursal_nombre, p.prod_nombre
    ORDER BY d.cod_barra;");
            
            $fechaHoraActual = date("Y-m-d_H-i-s");
            $reporte = "detalledeventas_" . $fechaHoraActual . ".xls";
            
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment; filename="' . $reporte . '"');
            header('Pragma: no-cache');
            header('Expires: 0');
            
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="10">Reporte Detalle de Ventas</th>';
            echo '</tr>';
            echo '<tr>
    <th>idSucursal</th>
    <th>Nombre Sucursal</th>
    <th>Cod Barra</th>
    <th>Nombre Producto</th>
    <th>Cantidad Vendida</th>
    <th>Precio Unidad</th>
    <th>Costo</th>
    <th>Iva pagado por el cliente</th>
    <th>Monto Descuentos otorgados</th>
    <th>Suma Total pagado por el cliente</th>
    </tr>';
            
            while ($row = pg_fetch_object($detalledeventas)) {
                echo '<tr>';
                echo '<td>' . $row->id_sucursal . '</td>';
                echo '<td>' . $row->sucursal_nombre . '</td>';
                echo '<td>' . $row->cod_barra . '</td>';
                echo '<td>' . $row->prod_nombre . '</td>';
                echo '<td>' . $row->cantidad . '</td>';
                echo '<td>' . $row->prod_preciopublico . '</td>';
                echo '<td>' . $row->costo . '</td>';
                echo '<td>' . $row->iva . '</td>';
                echo '<td>' . $row->monto_descuento . '</td>';
                echo '<td>' . $row->total . '</td>';
                echo '</tr>';
            }
            
            echo '</table>';
            
            
            
        }
    
}
?>
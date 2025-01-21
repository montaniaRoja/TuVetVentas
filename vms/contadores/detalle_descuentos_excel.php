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
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    
    // Validar y limpiar datos del formulario para prevenir inyección de SQL
    $fechaInicial = htmlspecialchars($fechaInicial);
    $fechaFinal = htmlspecialchars($fechaFinal);
    
    $sucursalList = implode(",", $_POST['sucursal']);
    
    $detalledeventas = pg_query($db, "select c.cliente_nombre, d.cod_barra, p.prod_nombre, d.precio, d.cantidad, round(d.precio*d.cantidad,2) as tot,d.monto_descuento,round(d.monto_descuento/(d.precio*d.cantidad)*100,2) as porcdescuento ,d.total_linea, d.sucursal_id, s.sucursal_nombre ,h.creada_por 
from dfacturas d join productos p
on d.cod_barra=p.prod_codbarra
join hfacturas h on h.id=d.id_hfactura
join clientes c on h.id_cliente=c.id
join sucursales s on d.sucursal_id=s.id
    WHERE d.fecha BETWEEN '$fechaInicial' AND '$fechaFinal' and d.validado_sn=1 and d.anulada_sn=0
    AND d.sucursal_id IN ($sucursalList)");
    
    $reporte = "detalle_de_descuentos_" . $fechaHoraActual . ".xls";
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="11">Reporte Detalle de Descuentos</th>';
    echo '</tr>';
    echo '<tr>
        <th>Nombre Cliente</th>
        <th>Codigo Barra</th>
        <th>Nombre Producto</th>
        <th>Precio</th>
        <th>Cantidad</th>
        <th>Total</th>
        <th>Descuento</th>
        <th>Porc Descuento</th>
        <th>Total Pagado</th>
        <th>Sucursal</th>
        <th>Empelado Facturo</th>
        </tr>';
    
    while ($row = pg_fetch_object($detalledeventas)) {
        echo '<tr>';
        echo '<td>' . $row->cliente_nombre . '</td>';
        echo '<td>' . $row->cod_barra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->precio . '</td>';
        echo '<td>' . $row->cantidad . '</td>';
        echo '<td>' . $row->tot . '</td>';
        echo '<td>' . $row->monto_descuento . '</td>';
        echo '<td>' . $row->porcdescuento . '</td>';
        echo '<td>' . $row->total_linea . '</td>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->creada_por . '</td>';
        echo '</tr>';
    }
    
    echo '</table>';
}
?>
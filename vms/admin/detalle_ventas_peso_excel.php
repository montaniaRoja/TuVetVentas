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
    $proveedor=$_POST['proveedor'];
    
    $detalledeventas = pg_query($db, "SELECT
        h.fecha_creacion, h.fecha_cobro, h.id_sucursal, h.hora_inicio, h.hora_final, h.numero_impreso, h.nombre_cliente,
        d.cod_barra, d.cantidad, d.monto_costo, d.monto_descuento, d.total_linea,
        p.prod_nombre, p.prod_preciopublico, p.concentracion, p.contenido,
        m.marca_nombre,
        c.cat_nombre,
        v.prov_nombre,
        s.sucursal_nombre
    FROM hfacturas h
    JOIN dfacturas d ON h.id = d.id_hfactura
    JOIN productos p ON d.cod_barra = p.prod_codbarra
    JOIN marcas m ON p.id_marca = m.id
    JOIN categorias c ON p.id_categorias = c.id
    JOIN proveedores v ON m.proveedor_id = v.id
    JOIN sucursales s on h.id_sucursal=s.id
    WHERE h.fecha_cobro BETWEEN '$fechaInicial' AND '$fechaFinal' and d.validado_sn=1 and d.anulada_sn=0
    AND p.prod_esinventariosn=1
    AND h.id_sucursal IN ($sucursalList)
    AND m.proveedor_id='$proveedor'
    ORDER BY h.numero_impreso");
    
    $reporte = "detalledeventas_" . $fechaHoraActual . ".xls";
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="13">Reporte Detalle de Ventas por peso</th>';
    echo '</tr>';
    echo '<tr>
        
        <th>Fecha Cobro</th>        
        <th>Sucursal</th>
        
        <th>Cliente</th>
        
        <th>Nombre Producto</th>
        <th>Marca</th>
        <th>Categoria</th>
        <th>Concentracion</th>
        <th>Contenido</th>
        <th>Proveedor</th>
        <th>Cantidad</th>
        <th>Precio Marcado</th>
        <th>Costo</th>        
        <th>Total Linea</th>
        </tr>';
    
    while ($row = pg_fetch_object($detalledeventas)) {
        echo '<tr>';
        
        echo '<td>' . $row->fecha_cobro . '</td>';        
        echo '<td>' . $row->sucursal_nombre . '</td>';
        
        echo '<td>' . $row->nombre_cliente . '</td>';
        
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->marca_nombre . '</td>';
        echo '<td>' . $row->cat_nombre . '</td>';
        echo '<td>' . $row->concentracion . '</td>';
        echo '<td>' . $row->contenido . '</td>';
        echo '<td>' . $row->prov_nombre . '</td>';
        echo '<td>' . $row->cantidad . '</td>';
        echo '<td>' . $row->prod_preciopublico . '</td>';
        echo '<td>' . $row->monto_costo . '</td>';        
        echo '<td>' . $row->total_linea . '</td>';
        echo '</tr>';
    }
    
    echo '</table>';
}
?>
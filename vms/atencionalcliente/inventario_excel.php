<?php
session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
check_login();
//comentario de prueba github
$fechaHoraActual = date("Y-m-d_H-i-s");

if(isset($_POST['submit'])){
    
    $codigoSucursal = $_REQUEST['sucursal'];
    $sql = pg_query($db, "SELECT
    s.sucursal_nombre,
    p.prod_codbarra,
    p.prod_nombre,
    m.marca_nombre,
    c.cat_nombre,
    v.prov_nombre,
    p.prod_costopromedio,
    p.prod_preciopublico,
	e.existencia,
    p.prod_porcdescuento * 100 AS descuento,
	r.ptoreorden
FROM
    productos p
JOIN marcas m ON p.id_marca = m.id
JOIN existencias e ON p.prod_codbarra = e.codbarra
JOIN sucursales s ON e.id_sucursal = s.id
JOIN puntosdereorden r on p.prod_codbarra = r.codbarra and s.id=r.id_sucursal
JOIN categorias c ON p.id_categorias = c.id
JOIN proveedores v ON m.proveedor_id = v.id
WHERE
    p.prod_esinventariosn = 1 AND s.id IN (" . implode(',', $codigoSucursal) . ")
GROUP BY
    s.sucursal_nombre,
    p.prod_codbarra,
    p.prod_nombre,
    m.marca_nombre,
    c.cat_nombre,
    v.prov_nombre,
    p.prod_costopromedio,
    p.prod_preciopublico,
	r.ptoreorden,
    e.existencia,
    p.prod_porcdescuento * 100
	ORDER BY
    p.prod_codbarra, s.sucursal_nombre;");
                            
    
    
    $reporte = "inventario_" . $fechaHoraActual . " Sucursal No." . $codigoSucursal . ".xls";
    
    // Configurar las cabeceras para la descarga del archivo
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    // Comenzar la salida del archivo Excel
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="10">Reporte Inventario Sucursal</th>';
    echo '</tr>';
    
    echo '<tr>
    <th>Codigo</th>
    <th>Nombre</th>
    <th>Marca</th>
    <th>Existencia</th>
    <th>costo promedio</th>
    <th>precio sin iva</th>
    <th>sucursal id</th>
    <th>nombre sucursal</th>
    <th>proveedor</th>
    <th>punto reorden</th>
</tr>';
    
    while ($row = pg_fetch_object($sql)) {
        echo '<tr>';
        echo '<td>' . $row->prod_codbarra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->marca_nombre . '</td>';
        echo '<td>' . $row->existencia . '</td>';
        echo '<td>' . $row->prod_costopromedio . '</td>';
        echo '<td>' . $row->prod_preciopublico . '</td>';
        echo '<td>' . $row->id_sucursal . '</td>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->prov_nombre . '</td>';
        echo '<td>' . $row->ptoreorden . '</td>';
        echo '</tr>';
    }
    
    echo '</table>';
    
    
}

?>
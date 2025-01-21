<?php

session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION") {
    header("Location: logout.php");
    exit();
}

//comentario de prueba github
$fechaHoraActual = date("Y-m-d_H-i-s");

if(isset($_POST['submit'])){
    
    $codigoSucursal = $_REQUEST['sucursal'];
    $sql = pg_query($db, "SELECT 
    p.prod_codbarra, 
    s.sucursal_nombre, 
    p.prod_nombre, 
    e.existencia, 
    r.ptoreorden,
    p.bodegasn, 
    m.marca_nombre, 
    pr.prov_nombre 
FROM 
    productos p
JOIN 
    existencias e ON p.prod_codbarra = e.codbarra
JOIN 
    (
        SELECT codbarra, ptoreorden, id_sucursal
        FROM puntosdereorden
    ) r ON p.prod_codbarra = r.codbarra AND e.id_sucursal = r.id_sucursal
JOIN 
    marcas m ON p.id_marca = m.id
JOIN 
    proveedores pr ON pr.id = m.proveedor_id
JOIN 
    sucursales s ON e.id_sucursal = s.id
WHERE 
    e.existencia <= r.ptoreorden
    AND s.id IN (" . implode(',', $codigoSucursal) . ") AND
    p.prod_esinventariosn=1
ORDER BY 
    p.prod_codbarra, s.sucursal_nombre;");
    
    
    $reporte = "Existencia menor reorden_" . $fechaHoraActual . " Varias Sucursales."  . ".xls";
    
    // Configurar las cabeceras para la descarga del archivo
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    // Comenzar la salida del archivo Excel
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="8">Productos con existencia menor a punto de reorden</th>';
    echo '</tr>';
    
    echo '<tr>	
												<th>Sucursal</th>
												<th>CodBarra</th>
												<th>Nombre</th>
												<th>Marca</th>
												<th>Proveedor</th>
												<th>Existencia</th>
												<th>Minimo</th>
												<th>Proveedor a Sucursal</th>
																			
												
											</tr>';
    
    while ($row = pg_fetch_object($sql)) {
        $proveedor="Bodega";
        if($row->bodega==0){
            $proveedor="externo";
        }
        echo '<tr>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->prod_codbarra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->marca_nombre . '</td>';
        echo '<td>' . $row->prov_nombre . '</td>';
        echo '<td>' . $row->existencia . '</td>';
        echo '<td>' . $row->ptoreorden . '</td>';
        
        echo '<td>' . $proveedor . '</td>';
        
        echo '</tr>';
    }
    
    echo '</table>';
    
    
}

?>
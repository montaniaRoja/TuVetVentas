<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['btnExcel'])) {
    
    $codigoMarca = $_REQUEST['codcliente'];
    $fechaInicial=$_REQUEST['inicial'];
    $fechaFinal=$_REQUEST['final'];
    $sucursal=$_REQUEST['modalsucursal'];
    
    $queryCliente = pg_query($db, "SELECT * from categorias where id='$codigoMarca'");
    
    // Obtener el nombre del cliente
    $marca_nombre = ''; // Inicializar la variable
    if ($row = pg_fetch_object($queryCliente)) {
        $marca_nombre = $row->cat_nombre; // Asignar el nombre del cliente
    }
    
    $reporte = "reporte_detalle_categoria_" . $marca_nombre ." desde ".$fechaInicial." hasta ".$fechaFinal.".xls";
    
    $query = pg_query($db, "select p.prod_codbarra, p.prod_nombre, c.cat_nombre, r.ptoreorden, sum(d.cantidad) as cantidad, sum(d.total_linea) as total
    from productos p
    join dfacturas d
    on p.prod_codbarra=d.cod_barra
    join categorias c on
        p.id_categorias=c.id
        join puntosdereorden r
	on p.prod_codbarra=r.codbarra and d.sucursal_id=r.id_sucursal
    where
        p.id_categorias='$codigoMarca' and
        d.fecha between '$fechaInicial' and '$fechaFinal' and
        d.sucursal_id='$sucursal' and
        d.validado_sn=1 and d.anulada_sn=0	
    group by p.prod_codbarra, p.prod_nombre, c.cat_nombre, r.ptoreorden;");
    
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="5">Reporte detalle de categoria</th>';
    echo '</tr>';
    echo '<tr>
    <th>Codigo Barra</th>
    <th>Nombre Producto</th>
    <th>Pto Reorden</th>
    <th>Cantidad</th>
    <th>total</th>
    </tr>';
    
    
    
    while ($row = pg_fetch_object($query)) {
        echo '<tr>';
        echo '<td>' . $row->prod_codbarra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->ptoreorden . '</td>';
        echo '<td>' . $row->cantidad . '</td>';
        echo '<td>' . $row->total . '</td>';
                
        
        
        echo '</tr>';
    }
    
    
    
    echo '</table>';
    
}

?>
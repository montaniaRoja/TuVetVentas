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
    
    $queryCliente = pg_query($db, "SELECT * from marcas where id='$codigoMarca'");
    
    // Obtener el nombre del cliente
    $marca_nombre = ''; // Inicializar la variable
    if ($row = pg_fetch_object($queryCliente)) {
        $marca_nombre = $row->marca_nombre; // Asignar el nombre del cliente
    }
    
    $reporte = "reporte_detalle_marca_" . $marca_nombre ." desde ".$fechaInicial." hasta ".$fechaFinal.".xls";
    
    $query = pg_query($db, "select d.cod_barra, p.prod_nombre, m.marca_nombre, sum(d.cantidad) as cantidad, sum(d.total_linea) as total
                                from dfacturas d
                                join productos p
                                on d.cod_barra=p.prod_codbarra
                                join marcas m
                                on p.id_marca=m.id
                                where m.id='$codigoMarca'
                                and d.fecha between '$fechaInicial' and '$fechaFinal'
                                and d.validado_sn=1 and d.anulada_sn=0
                                group by d.cod_barra, p.prod_nombre, m.marca_nombre
                                order by d.cod_barra");
    
    
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="5">Reporte detalle de Marca</th>';
    echo '</tr>';
    echo '<tr>
    <th>Codigo Barra</th>
    <th>Nombre Producto</th>
    <th>Marca</th>
    <th>Cantidad</th>
    <th>total</th>
    </tr>';
    
    $totalAcumulado = 0;
    $totalRedimido = 0;
    
    while ($row = pg_fetch_object($query)) {
        echo '<tr>';
        echo '<td>' . $row->cod_barra . '</td>';
        echo '<td>' . $row->prod_nombre . '</td>';
        echo '<td>' . $row->marca_nombre . '</td>';
        echo '<td>' . $row->cantidad . '</td>';
        echo '<td>' . $row->total . '</td>';
                
        $totalAcumulado += $row->monto_acumulado;
        $totalRedimido += $row->monto_redimido;
        
        echo '</tr>';
    }
    
    
    
    echo '</table>';
    
}

?>
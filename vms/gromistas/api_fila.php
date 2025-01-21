<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('include/config.php');

try {
    // Prepara la consulta con marcadores de posición
    $query = "select s.id, s.fecha, g.nombre_gromista, m.nombre_mascota, s.hora_inicio, s.hora_cambio_status, s.sesion_status  
from tbl_sesionesgrooming s
join tbl_gromistas g
on s.id_gromista=g.id
join clientes c
on s.id_cliente=c.id
join mascotas m
on s.id_mascota=m.id
where sesion_status='En Proceso'
or sesion_status='En Recepcion';";
    $consultaPreparada = pg_prepare($db, "", $query);
    
    if (!$consultaPreparada) {
        throw new Exception("Error al preparar la consulta.");
    }
    
    // Ejecuta la consulta preparada
    $resultado = pg_execute($db, "", array());
    
    if (!$resultado) {
        throw new Exception("Error al ejecutar la consulta.");
    }
    
    $resultados = array();
    
    while ($fila = pg_fetch_assoc($resultado)) {
        $resultados[] = $fila;
    }
    
    echo json_encode($resultados);
} catch (Exception $e) {
    die("Error: " . $e->getMessage());
} finally {
    // Cierra la conexión a la base de datos
    pg_close($db);
}
?>
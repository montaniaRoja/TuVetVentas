<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('../admin/include/config.php');

$propietario_id = $_GET['proveedor_id'];

try {
    
    $query = "SELECT id, marca_nombre 
              FROM marcas
              WHERE proveedor_id=$1";
    $consultaPreparada = pg_prepare($db, "", $query);
    
    if (!$consultaPreparada) {
        throw new Exception("Error al preparar la consulta.");
    }
    
    // Ejecuta la consulta preparada
    $resultado = pg_execute($db, "", array($propietario_id));
    
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
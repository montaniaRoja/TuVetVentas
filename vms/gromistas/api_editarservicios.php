<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");

error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('include/config.php');

// Obtiene el parámetro 'id_sesion' de la URL
$id_sesion = isset($_GET['id_sesion']) ? $_GET['id_sesion'] : null;

if ($id_sesion) {

    $item = $id_sesion;

    try {
        // Prepara la consulta con marcadores de posición
        $query = "SELECT 
        p.id, 
        p.prod_nombre, 
        CASE 
            WHEN td.id_servicioprestado IS NOT NULL THEN 1 
            ELSE 0 
        END AS seleccion
            FROM 
                productos p
            LEFT JOIN 
                tbl_detallesesiones td
            ON 
                p.id = td.id_servicioprestado 
                AND td.id_sesion = $1
            WHERE 
                p.id_categorias = 18
            ORDER BY 
                seleccion desc, p.prod_nombre;";

        // Prepara la consulta
        $consultaPreparada = pg_prepare($db, "consulta_sesion", $query);

        if (!$consultaPreparada) {
            throw new Exception("Error al preparar la consulta.");
        }

        // Ejecuta la consulta preparada con el valor del parámetro
        $resultado = pg_execute($db, "consulta_sesion", array($item));

        if (!$resultado) {
            throw new Exception("Error al ejecutar la consulta.");
        }

        $resultados = array();

        while ($fila = pg_fetch_assoc($resultado)) {
            $resultados[] = $fila;
        }

        echo json_encode($resultados);
    } catch (Exception $e) {
        echo json_encode(array("message" => "Error: " . $e->getMessage()));
    } finally {
        // Cierra la conexión a la base de datos
        pg_close($db);
    }
} else {
    echo json_encode(array("message" => "El parámetro 'id_sesion' no está definido."));
}
?>
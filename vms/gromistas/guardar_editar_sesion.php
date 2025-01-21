<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('include/config.php');



$decoded_json = json_decode(file_get_contents("php://input"), true);
$contador = 0;

if ($decoded_json) {
    $sesion = $decoded_json['idSesion'];
    $servicios = $decoded_json['servicios'];

    
    $deleteQuery = "DELETE FROM tbl_detallesesiones where id_sesion=$1";
    $executeDelete = pg_query_params($db, $deleteQuery, array($sesion));
    if (!$executeDelete) {
        echo "Error: " . pg_last_error($db);
    }else{
        foreach ($servicios as $servicio) {
            
            $idservicio=$servicio;
        
            $updateQuery = "INSERT INTO tbl_detallesesiones (id_sesion, id_servicioprestado) VALUES ($1, $2)";
            $exceuteUpdate = pg_query_params($db, $updateQuery, array($sesion, $idservicio));
            if (!$executeDelete) {
                echo "Error: " . pg_last_error($db);
            } else {
                $contador += 1;
            }
        }    
    }
   

    if ($contador > 0) {
        echo "exito al actualizar la sesion";
    }
}

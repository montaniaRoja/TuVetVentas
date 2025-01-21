<?php
session_start();
//error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

// Obtener los datos JSON del cuerpo de la solicitud POST
$json_data = file_get_contents("php://input");

// Decodificar los datos JSON a un array de PHP
$data = json_decode($json_data, true);

// Extraer el array de componentes


$lista_componentes = $data['lista_componentes'];
$lineas=count($lista_componentes);
$contador=0;
for ($i = 0; $i < $lineas; $i++) {
$idproducto=$lista_componentes[$i]['idProducto'];
$idcomponente=$lista_componentes[$i]['codigoComponente'];
$concentracion=$lista_componentes[$i]['concentracion'];
$unidades=$lista_componentes[$i]['unidad'];

$guardar=("insert into tbl_prodcomponentes (id_producto, id_componente, concentracion, unidades) values ('$idproducto','$idcomponente','$concentracion','$unidades');");
$guardar=pg_query($db, $guardar);
if($guardar){
    $contador++;
}

}

if($contador>0){
echo json_encode(['status' => 'success', 'message' => 'componentes agregados al producto']);
        pg_close();

}else{
    echo json_encode(['status' => 'error', 'message' => 'error al agregar los componentes al producto']);
}


?>
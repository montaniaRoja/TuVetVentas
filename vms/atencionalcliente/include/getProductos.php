<?php
// Obtener el valor del campo desde el formulario
include_once('config.php');

$campo = $_POST["codigo"];


// Establecer la conexión con la base de datos PostgreSQL
//$db = pg_connect("host=localhost port=5432 dbname=tuvet user=adolfo password=ofloda01");




// Preparar la consulta SQL
$sql = "SELECT prod_codbarra, prod_nombre FROM productos WHERE prod_codbarra LIKE $1 OR prod_nombre LIKE $2 ORDER BY prod_nombre ASC LIMIT 5";
$query = pg_prepare($db, "my_query", $sql);

// Ejecutar la consulta con parámetros
$result = pg_execute($db, "my_query", array("%$campo%", "%$campo%"));

if (!$result) {
    die("Error en la consulta.");
}

$html = "";


// Procesar los resultados
while ($row = pg_fetch_assoc($result)) {
    $html .= "<li onclick=\"mostrar('" . $row["prod_nombre"] . "','" . $row["prod_codbarra"] . "')\">" . " - " . $row["prod_nombre"] . "</li>";
}

// Cerrar la conexión a la base de datos
pg_close($db);

echo json_encode($html, JSON_UNESCAPED_UNICODE);

?>


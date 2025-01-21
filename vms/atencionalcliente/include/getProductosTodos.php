<?php
// Obtener el valor del campo desde el formulario
session_start();
include_once('config.php');
include('checklogin.php');
//check_login();
$sucursal = $_SESSION['sucursal'];
$code = $_POST["code"];

// Establecer la conexión con la base de datos PostgreSQL


// Preparar la consulta SQL
$sql = "SELECT
    p.prod_codbarra,
    p.prod_nombre,
    e.existencia,
    p.prod_preciopublico,
    p.prod_porcdescuento,
    p.prod_esinventariosn,
    p.prod_costopromedio,
    p.porcentaje_impuesto
FROM
    productos p
JOIN
    existencias e ON p.prod_codbarra = e.codbarra
WHERE
    (p.prod_codbarra LIKE $1)";


$query = pg_prepare($db, "my_query", $sql);

// Ejecutar la consulta con parámetros
$result = pg_execute($db, "my_query", array("%$code%"));

if (!$result) {
    // Manejo de errores
    die("Error en la consulta: " . pg_last_error($db));
}

$html = "";

// Procesar los resultados
while ($row = pg_fetch_assoc($result)) {
    $html .= "<li onclick=\"mostrarproducto('" . $row["prod_nombre"] . "','" . $row["prod_codbarra"] . "','"
        . $row["existencia"] . "','". $row["prod_preciopublico"] ."','". $row["prod_porcdescuento"] ."','". $row["porcentaje_impuesto"] ."','". $row["prod_esinventariosn"] ."','". $row["prod_costopromedio"] ."')
            \">" . " - " . $row["prod_nombre"] . "</li>";
}

// Cerrar la conexión a la base de datos
pg_close($db);

echo json_encode($html, JSON_UNESCAPED_UNICODE);
?>

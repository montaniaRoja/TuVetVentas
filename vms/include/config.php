<?php


//$db = pg_connect("host=localhost port=5432 dbname=tuvet user=adolfo password=ofloda01");



$host = getenv('PGHOST');
$port = getenv('PGPORT');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$password = getenv('PGPASSWORD');

if (!$host || !$port || !$dbname || !$user || !$password) {
    die("Faltan variables de entorno para la conexión a la base de datos.");
}

$db = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$db) {
    die("No se pudo conectar a la base de datos.");
}



?>









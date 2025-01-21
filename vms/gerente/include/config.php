<?php
$ip = $_SERVER['REMOTE_ADDR'];
$ip_locales = array('127.0.0.1', '::1');
$is_localhost = in_array($ip, $ip_locales);

if ($is_localhost) {
    // Para entorno local
    $db = pg_connect("host=localhost port=5432 dbname=tuvet user=adolfo password=ofloda01");
} else {
    // Para entorno remoto (Google Cloud SQL o IP pública)
    $host = getenv('PGHOST');
    $port = getenv('PGPORT');
    $dbname = getenv('PGDATABASE');
    $user = getenv('PGUSER');
    $password = getenv('PGPASSWORD');

    if (!$host || !$port || !$dbname || !$user || !$password) {
        die('Faltan variables de entorno');
    }

    $db = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

    if (!$db) {
        die('Error de conexión: ' . pg_last_error());
    }
}
?>


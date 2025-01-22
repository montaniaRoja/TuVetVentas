<?php
function loadEnv($file)
{
    if (!file_exists($file)) {
        die("Archivo .env no encontrado");
    }

    $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue; // Ignorar comentarios
        }
        list($key, $value) = explode('=', $line, 2);
        putenv(trim($key) . '=' . trim($value));
    }
}

// Cargar variables de entorno
loadEnv(__DIR__ . '/.env');

$ip = $_SERVER['REMOTE_ADDR'];
$ip_locales = array('127.0.0.1', '::1');
$is_localhost = in_array($ip, $ip_locales);

if ($is_localhost) {
    $db = pg_connect("host=localhost port=5432 dbname=tuvet user=adolfo password=ofloda01");
} else {
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

<?php
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
    $db = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
}
?>
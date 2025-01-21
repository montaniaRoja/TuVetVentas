<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if (isset($_POST['provId'])) {
    $provId = intval($_POST['provId']);

    // Consulta para obtener las facturas pendientes
    $query = pg_query($db, "SELECT id, doc_numero, cargo FROM extractosproveedores WHERE prov_id = '$provId' AND pagada = 0 ORDER BY id DESC");

    if (!$query) {
        echo '<option value="">Error al cargar facturas</option>';
        exit;
    }

    // Generar opciones del select
    $options = '';
    while ($row = pg_fetch_assoc($query)) {
        $id = htmlspecialchars($row['id']);
        $numeroFactura = htmlspecialchars($row['doc_numero']);
        $monto = $row['cargo'];

        $options .= "<option value=\"$id\" data-monto=\"$monto\">CCF $numeroFactura - Monto: $" .number_format($monto,2)."</option>";
    }

    // Verificar si hay facturas
    if ($options === '') {
        $options = '<option value="">No hay facturas pendientes</option>';
    }

    echo $options;
}

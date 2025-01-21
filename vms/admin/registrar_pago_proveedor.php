<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();
$fecha_actual = date("Y-m-d");
$usuarioCrea = $_SESSION['login'];
$sucursal = $_SESSION['sucursal'];

if (isset($_POST['btnPago'])) {
    $estado = 1;
    $provId = $_POST['provId'];
    $facturas = $_POST['listaFacturas'];
    //print_r($facturas);
    $total = floatval($_POST['montoTotal']);
    //print_r($facturasList);
    $cheque = "Cheque No " . $_POST['nocheque'];
    $cargo = 0;
    $numeroValidador = $_POST['validacion'];



    $query = "INSERT INTO extractosproveedores (prov_id, doc_numero, fecha, cargo, abono, usuario, sucursal, pagada, validacion)
        VALUES ($1, $2, $3, $4, $5, $6, $7,$8, $9)";
    $result1 = pg_query_params($db, $query, array($provId, $cheque, $fecha_actual, $cargo, $total, $usuarioCrea, $sucursal, $estado, $numeroValidador));

    foreach ($facturas as $idFactura) {
        $update = "UPDATE extractosproveedores set pagada=1, cheque_numero='$cheque' where id='$idFactura'";
        $result2 = pg_query($db, $update);
    }

    if ($result1 && $result2) {
        echo "Abono registrado exitosamente.";
        Header("Location: estado_cuenta_proveedores.php");
    } else {
        echo "Error al registrar el abono: " . pg_last_error($db);
    }
}

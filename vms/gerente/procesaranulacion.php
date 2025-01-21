<?php

session_start();
error_reporting(0);
include_once ('include/config.php');
include ('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ") {
    header("Location: logout.php");
    exit();
}
$numeroImpreso=$_SESSION['$noFactura'];
$anulada=1;

$fecha_actual = date("Y-m-d");

if (isset($_POST['anular'])) {
    // Obtener el ID de la factura a anular
    $facturaAnular = $_SESSION['$anular'];

    // Verificar si pago_puntos es mayor que cero
    $queryVerificar = pg_query($db, "SELECT pago_puntos FROM hfacturas WHERE id='$facturaAnular'");
    $resultVerificar = pg_fetch_assoc($queryVerificar);

    if ($resultVerificar && $resultVerificar['pago_puntos'] > 0) {
        //borrar la transaccion del historial de puntos

        $queryBorrar=pg_query($db, "DELETE FROM puntos_clientes WHERE id_factura='$numeroImpreso';");
    }

    //devolver los puntos al cliente



    // Marcar la factura como anulada
    $seleccionarHfactura = pg_query($db, "UPDATE hfacturas SET anulada=1, anulada_por='$_SESSION[login]', 
                                        fecha_anulacion='$fecha_actual' WHERE id='$facturaAnular'");

    $seleccionarDfactura = pg_query($db, "UPDATE dfacturas SET anulada_sn=1 WHERE id_hfactura='$facturaAnular'");

    $actualizarKardex = pg_query($db, "UPDATE kardex SET anulada=1 WHERE id_hfactura='$facturaAnular'");

    //si es a credito la factura marcarla como anulada

    $anularfacturacredito=pg_query($db, "UPDATE extractosclientes set anulada='$anulada' WHERE doc_numero='$facturaAnular'");

    //borrar la transaccion que acumulo los puntos
    $devolverpuntos= pg_query($db,"DELETE FROM puntos_clientes WHERE id_factura='$numeroImpreso'");

    // Devolver las cantidades al inventario
    $buscarCantidades = "SELECT * FROM dfacturas WHERE id_hfactura='$facturaAnular'";
    $result = pg_query($db, $buscarCantidades);

    if ($result) {
        while ($fila = pg_fetch_assoc($result)) {
            $codBarra = $fila['cod_barra'];
            $cantidad = $fila['cantidad'];
            $sucursal = $_SESSION['sucursal'];

            $query = pg_query($db, "UPDATE existencias SET existencia = existencia + $cantidad WHERE codbarra = '$codBarra' AND id_sucursal = '$sucursal'");

            if (!$query) {
                echo "<script>alert('Error en la consulta');</script>";
            } else {
                echo "Consulta ejecutada con éxito.";
            }
        }
    }

    echo "<script>alert('La factura ha sido anulada');</script>";
    echo "<script>window.location.href='dashboard.php'</script>";
    exit();
}

?>
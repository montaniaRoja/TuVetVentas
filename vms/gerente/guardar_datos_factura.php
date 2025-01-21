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

// Extraer el array de cotización
$lista_cotizacion = $data['lista_cotizacion'];
$condicion = $data['condicion'];
$cliente = $data['cliente'];
$identidad = $data['identidad'];
$fecha = $data['fecha'];
$hora = $data['hora'];
$lineas = count($lista_cotizacion);
$buscarcliente = pg_query($db, "SELECT id, darcreditosn FROM clientes WHERE cliente_nodoc = '$identidad'");
$row = pg_fetch_object($buscarcliente);
$sucursal = $_SESSION['sucursal'];
$cerrada = "S";

if (!$row) {
} else {

    $darcredito = $row->darcreditosn;
    $idCliente = $row->id;

    $consultaMaxIdCl = "select MAX(id) from hfacturas";
    $maxIdResultado = pg_query($db, $consultaMaxIdCl);
    $maxIdCliente = pg_fetch_result($maxIdResultado, 0, 0);
    $siguienteId = $maxIdCliente + 1;

    if ($condicion == 'Contado' || ($condicion == 'Credito' && $darcredito == 1)) {
        $crearfactura = "INSERT INTO hfacturas (id,fecha_creacion, id_sucursal, creada_por, nombre_cliente, condicion_pago, hora_inicio, id_cliente,lineas_factura,f_cerrada)
            VALUES ('$siguienteId','$fecha', '$_SESSION[sucursal]', '$_SESSION[login]', '$cliente', '$condicion', '$hora', '$idCliente','$lineas','$cerrada' )";
        $crearfactura = pg_query($db, $crearfactura);


        $obtenerId = ("SELECT id AS max_id, nombre_cliente, condicion_pago FROM hfacturas
                    WHERE id_sucursal='$_SESSION[sucursal]' AND creada_por='$_SESSION[login]'
                    AND id = (SELECT MAX(id) FROM hfacturas WHERE id_sucursal='$_SESSION[sucursal]'
                    AND creada_por='$_SESSION[login]');");

        $obtenerId = pg_query($db, $obtenerId);

        $row = pg_fetch_assoc($obtenerId);

        $idfactura = $row['max_id'];

        $idfactura = $row['max_id'];
        $_SESSION['idfactura'] = $idfactura;
        $condicion = $row['condicion_pago'];
        $hsubtotal = 0;
        $hmontogravado = 0;
        $himpuesto = 0;
        $hmontonogravado = 0;
        $htotallinea = 0;
        $hcosto = 0;
        $hmontodescuento = 0;


        for ($i = 0; $i < count($lista_cotizacion); $i++) {
            $barCode = $lista_cotizacion[$i]['barcode'];
            $nombreProducto = $lista_cotizacion[$i]['nombreproducto'];
            $cantidad = $lista_cotizacion[$i]['cantidad'];
            $montodescuento = $lista_cotizacion[$i]['montodescuento'];
            if ($montodescuento > 0) {
                $descuento = 1;
            } else {
                $descuento = 0;
            }
            $precio = $lista_cotizacion[$i]['precio'];
            $iva = $lista_cotizacion[$i]['iva'];
            $cantidad = $lista_cotizacion[$i]['cantidad'];
            if ($iva > 0) {
                $nogravado = 0;
                $gravado = ($precio * $cantidad) - $montodescuento;
            } else {
                $nogravado = ($precio * $cantidad) - $montodescuento;
                $gravado = 0;
            }

            $costo = $lista_cotizacion[$i]['costototal'];

            $hsubtotal += ($precio * $cantidad) - $montodescuento;
            $hmontogravado += $gravado;
            $himpuesto += $iva;
            $hmontonogravado += $nogravado;
            $htotallinea += ($precio * $cantidad) - $montodescuento + $iva;
            $hcosto += $costo;
            $hmontodescuento += $montodescuento;

            $guardar = ("insert into dfacturas (fecha,id_hfactura,cod_barra,cantidad,precio,iva,subtotal,
                total_linea,validado_sn,monto_costo,suma_nogravado, suma_gravado,monto_descuento,descuento,sucursal_id)
            values ('$fecha','$idfactura','$barCode','$cantidad','$precio','$iva',
            ($precio*$cantidad)-$montodescuento,($precio*$cantidad)-$montodescuento+$iva,0,'$costo','$nogravado','$gravado','$montodescuento','$descuento','$sucursal')");

            $guardar = pg_query($db, $guardar);
        }

        $actualizarfactura = "update hfacturas set subtotal='$hsubtotal', monto_gravado='$hmontogravado', 
                            impuesto='$himpuesto', monto_nogravado='$hmontonogravado',total_linea='$htotallinea', costo='$hcosto', descuentos='$hmontodescuento' where id='$siguienteId'";
        $actualizar = pg_query($db, $actualizarfactura);
        // Imprimir todo el array
        // print_r($lista_cotizacion);

        if ($crearfactura) {
            $mensaje = "se creo una factura desde cotizaciones";
            $tipo = "EXITO";
            $log = pg_query($db, "insert into erroreslog (id_factura, descripcion, tipo) values ('$siguienteId','$mensaje','$tipo')");
        } else {
            $mensaje = "error al intentar crear el encabexado de factura";
            $tipo = "ERROR";
            $log = pg_query($db, "insert into erroreslog (id_factura, descripcion, tipo) values ('$siguienteId','$mensaje','$tipo')");
            // echo "<script>alert('No se pudo crear la nueva factura');</script>";
        }
        echo json_encode(['status' => 'success', 'message' => 'sera redirigido a cobros']);
        pg_close();
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Cliente no tiene crédito habilitado']);
        //echo "<script>alert('Cliente no tiene crédito habilitado');</script>";
        //header("location: dashboard.php");
    }
}

<?php

session_start();
//error_reporting(0);

include_once('include/config.php');
include('include/checklogin.php');

check_login();



if(isset($_POST['cobrar'])){
    $sepuedeprocesar = false;
    $facturaId = $_REQUEST['idFactura'];
    $facturaimprimir=$_REQUEST['factura'];
    $fecha_actual = $_REQUEST['fecha'];
    $hora_actual = $_REQUEST['hora'];
    $pagoefectivo=0;
    $pagotarjeta=0;
    $pagocredito=0;
    $pagopuntos=0;
    $tipodepago=$_REQUEST['tipodepago'];
    $sucursal=$_SESSION['sucursal'];
    $condicion=$_REQUEST['condicion'];
    $nombre=$_REQUEST['nombreCliente'];
    $idCliente=$_REQUEST['idcliente'];
    $pedidoNo=$_REQUEST['nopedido'];
    
    $errorMensaje="";
    
    
    
    
    
    switch($tipodepago){
        case "Efectivo":
            $pagoefectivo=$_REQUEST['efectivo'];
            $pagotarjeta=0;
            $pagocredito=0;
            $pagopuntos=0;   
            break;
        case "Tarjeta":
            $pagoefectivo=0;
            $pagotarjeta=$_REQUEST['tarjeta'];
            $pagocredito=0;
            $pagopuntos=0;
            break;
        case "Tarjeta/Efectivo":
            $pagoefectivo=$_REQUEST['efectivo'];
            $pagotarjeta=$_REQUEST['tarjeta'];
            $pagocredito=0;
            $pagopuntos=0;
            break;
        case "Credito":
            $pagoefectivo=0;
            $pagotarjeta=0;
            $pagocredito=$_REQUEST['total02'];
            $pagopuntos=0;
            break;
        case "Puntos":
            $pagoefectivo=0;
            $pagotarjeta=0;
            $pagocredito=0;
            $pagopuntos=$_REQUEST['puntos'];
            break;
        case "Efectivo/Puntos":
            $pagoefectivo=$_REQUEST['efectivo'];
            $pagotarjeta=0;
            $pagocredito=0;
            $pagopuntos=$_REQUEST['puntos'];
            break;
        case "Tarjeta/Puntos":
            $pagoefectivo=0;
            $pagotarjeta=$_REQUEST['tarjeta'];
            $pagocredito=0;
            $pagopuntos=$_REQUEST['puntos'];
            break;
            
    }//switch
    
    $autorizacion=$_REQUEST['autorizacion'];
    
    $total=$_REQUEST['total02'];
    $sumaPagos=($pagocredito+$pagoefectivo+$pagotarjeta+$pagopuntos);
    if(round($total,2) == round($sumaPagos,2)){
        
        $sepuedeprocesar=true;
        
    }
    
    
    
    // Poner las cantidades de dfacturas en un array
    //si se puede procesar hay que verificar que hay cantida de producto para suplir la factura
    $cantidadbuscar = pg_query($db, "SELECT * FROM dfacturas WHERE id_hfactura='$facturaId'");
    
    if ($cantidadbuscar && $sepuedeprocesar) {
        
        
        while ($fila = pg_fetch_assoc($cantidadbuscar)) {
            $cantidadb = $fila['cantidad'];
            $codbarrab = $fila['cod_barra'];
            
            //revisar si es servicio
            
            $esservicio = pg_query($db, "SELECT prod_esinventariosn FROM productos WHERE prod_codbarra='$codbarrab'");
            $row = pg_fetch_object($esservicio);
            $esinventario = $row->prod_esinventariosn;
            
            if($esinventario==1){
                // Consultar existencias
                $cantidadcomparar = pg_query($db, "SELECT existencia FROM existencias WHERE id_sucursal='$sucursal' AND codbarra='$codbarrab'");
                
                if ($cantidadcomparar) {
                    $row = pg_fetch_object($cantidadcomparar);
                    $existencia = $row->existencia;
                    
                    // Verificar existencias
                    if ($existencia < $cantidadb) {
                        $sepuedeprocesar = false;
                        $errorMensaje="Verifique las existencias de producto";
                        break;
                    }
                    
                }
            }
        }//while
        
        
    }
    
    //verificar que la factura no se haya usado
    if($sepuedeprocesar){
        $consultaDuplicado = pg_query($db, "SELECT * FROM hfacturas WHERE numero_impreso = '$facturaimprimir' AND id != '$facturaId'");
        $duplicado = pg_fetch_object($consultaDuplicado);
        
        if ($duplicado) {
            $sepuedeprocesar = false;
            $errorMensaje="Numero de factura duplicado";
            echo $errorMensaje;
        }
    }
    
    //verificar que el detalle de facturas no este en blanco
    if ($sepuedeprocesar) {
        
        $detallecorrecto = pg_query($db, "SELECT * FROM dfacturas WHERE id_hfactura='$facturaId'");
        
        if ($detallecorrecto) {
            $numFilas = pg_num_rows($detallecorrecto);
            
            if ($numFilas == 0) {
                $sepuedeprocesar = false;
                $errorMensaje="factura sin detalle asociado";
                $error = "No hay líneas asociadas en el detalle de esta factura";
                $tipo = "ERROR";
                $logerror = pg_query($db, "INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$facturaId', '$error', '$tipo')");
            }
        } else {
            $error = pg_last_error($db);
            $mensaje = "Hay registros en el detalle coincidentes con el encabezado";
            $tipo = "EXITO";
            $logerror = pg_query($db, "INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$facturaId', '$mensaje', '$tipo')");
        }
    }
    
    //ver que la factura no haya sido cobrada
    
    if ($sepuedeprocesar) {
        $ya=1;
        $facturaCobrada = pg_query($db, "SELECT * FROM hfacturas WHERE pagada_sn='$ya' and id='$facturaId'");
        
        if ($facturaCobrada) {
            $numFilasCobrada = pg_num_rows($facturaCobrada);
            
            if ($numFilasCobrada > 0) {
                $sepuedeprocesar = false;
                $errorMensaje="se intento cobrar una factura dos veces";
                $error = "Esta factura ya fue cobrada";
                $tipo = "ERROR";
                $logerror = pg_query($db, "INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$facturaId', '$error', '$tipo')");
            }
        } else {
            $error = pg_last_error($db);
            $mensaje = "factura cobrada solo una vez";
            $tipo = "EXITO";
            $logerror = pg_query($db, "INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$facturaId', '$mensaje', '$tipo')");
        }
    }
    
    
    
    if($sepuedeprocesar) {
        $contador=0;
        $imprimir="Y";
        $tipo1="ERROR";
        $tipo2="EXITO";
        if ($pagopuntos == 0 && $tipodepago != "Credito") {
            guardarPuntos($db, $facturaimprimir, $fecha_actual, $facturaId);
        }
        
        
        
        pg_query($db, "BEGIN");
        
        $validar=pg_query($db,"update dfacturas set validado_sn=1, fecha='$fecha_actual', sucursal_id='$sucursal' where id_hfactura='$facturaId'");
        if(!$validar){
            $contador+=1;
            
            $error="no se valido el detalle de factura";
            $logerror=pg_query($db,"insert into erroreslog (id_factura, descripcion, tipo) values ('$facturaId','$error','$tipo1')");
        }else{
            
            $error="se valido el detalle de factura";
            $logexito=pg_query($db,"insert into erroreslog (id_factura, descripcion,tipo) values ('$facturaId','$error','$tipo2')");
        }
        
        // sustituir los valores de la tabla hfacturas con los valores del formulario
        $actualizar=pg_query($db,"update hfacturas set numero_impreso='$facturaimprimir',
                                    numero_autorizacion='$autorizacion',pagada_sn=1, cobrada_por='$_SESSION[login]',
                                        pago_efectivo='$pagoefectivo',
                                        hora_final='$hora_actual',
                                        pago_tarjeta='$pagotarjeta',
                                        pago_credito='$pagocredito',
                                        pago_puntos='$pagopuntos',
                                        imprimir='$imprimir',
                                        numero_pedido='$pedidoNo',
                                        fecha_cobro='$fecha_actual' where id='$facturaId'");
        
        if(!$actualizar){
            $contador+=1;
            
            $error="no se actualizo  el encabezado de factura";
            $logerror=pg_query($db,"insert into erroreslog (id_factura, descripcion, tipo) values ('$facturaId','$error','$tipo1')");
            
        }else{
            $error="se actualizo  el encabezado de factura";
            $logexito=pg_query($db,"insert into erroreslog (id_factura, descripcion,tipo) values ('$facturaId','$error','$tipo2')");
        }
        
        
        $buscarcantidades = pg_query($db, "SELECT * FROM dfacturas WHERE id_hfactura='$facturaId'");
        if($buscarcantidades){
            
            while ($fila = pg_fetch_assoc($buscarcantidades)) {
                
                $restar = $fila['cantidad'];
                $barcode=$fila['cod_barra'];
                
                $servicio=pg_query($db, "SELECT prod_esinventariosn FROM productos WHERE prod_codbarra='$barcode'");
                $row = pg_fetch_object($servicio);
                $inventario=$row->prod_esinventariosn;
                
                if ($inventario == 1) {
                    // Actualizar existencias
                    $actualizarexistencias = pg_query($db, "UPDATE existencias SET existencia = existencia - $restar WHERE id_sucursal = '$sucursal' AND codbarra = '$barcode'");
                    
                    // Verificar y manejar errores de actualización de existencias
                    if (!$actualizarexistencias) {
                        $contador+=1;
                        $error="no se actualizaron las existencias de productos";
                        $logerror=pg_query($db,"insert into erroreslog (id_factura, descripcion, tipo) values ('$facturaId','$error','$tipo1')");
                    }else{
                        $error="se actualizaron las existencias de productos";
                        $logexito=pg_query($db,"insert into erroreslog (id_factura, descripcion,tipo) values ('$facturaId','$error','$tipo2')");
                    }
                    
                    // Insertar registro en kardex
                    $consultaMaxIdCl = "SELECT MAX(id) FROM kardex";
                    $maxIdResultado = pg_query($db, $consultaMaxIdCl);
                    $maxIdCliente = pg_fetch_result($maxIdResultado, 0, 0);
                    $siguienteId = $maxIdCliente + 1;
                    
                    $kardex = pg_query($db, "INSERT INTO kardex (id, sucursal_id, fecha_transaccion, codbarra, doc_no, cant_ingreso, cant_salio, id_hfactura, descripcion) VALUES
        ($siguienteId, '$sucursal', '$fecha_actual', '$barcode', '$facturaimprimir', 0, $restar, $facturaId,'VENTA')");
                    
                    // Verificar y manejar errores de inserción en kardex
                    if (!$kardex) {
                        $contador+=1;
                        $error="no se actualizaron el kardex de productos";
                        $logerror=pg_query($db,"insert into erroreslog (id_factura, descripcion, tipo) values ('$facturaId','$error','$tipo1')");
                        
                    }else{
                        $error="se actualizaron el kardex de productos";
                        $logexito=pg_query($db,"insert into erroreslog (id_factura, descripcion,tipo) values ('$facturaId','$error','$tipo2')");
                    }
                }
                
                
            }// while de las cantidades
        }else{
            $contador+=1;
            $error="error al actualizar cantidades y kardex";
            $logerror=pg_query($db,"insert into erroreslog (id_factura, descripcion, tipo) values ('$facturaId','$error','$tipo1')");
            
        }
        //si la factura es al credito cargar el saldo al cliente
        
        
        $consulta = pg_query($db, "SELECT SUM(cargo) as suma_cargo, SUM(abono) as suma_abono FROM extractosclientes WHERE nombre_cliente = '$nombre'");
        $resultado = pg_fetch_assoc($consulta);
        $versaldo = $resultado['suma_cargo'] - $resultado['suma_abono'];
        
        if($condicion=='Credito '){
            $verIdCliente=pg_query($db,"select id_cliente from hfacturas where id='$facturaId'");
            $row = pg_fetch_object($verIdCliente);
            $clienteId=$row->id_cliente;
            $cargo=pg_query($db,"insert into extractosclientes (doc_numero, fecha, cargo, abono, saldo, usuario, sucursal,nombre_cliente,cliente_id )
                            values('$facturaimprimir','$fecha_actual','$pagocredito',
                                    0,$versaldo+$pagocredito,'$_SESSION[login]','$_SESSION[sucursal]','$nombre','$clienteId')");
            
            $saldocliente=pg_query($db,"update clientes set cliente_saldos=cliente_saldos+'$pagocredito' where cliente_nombre='$nombre'");
            if(!$saldocliente){
                $contador+=1;
            }
            
            //actulizar tabla de puntos restar los puntos del cliente
            
        }
        
        if($pagopuntos>0){
            $montoAcumulado=0;
            $rebajarpuntos=pg_query($db,"insert into puntos_clientes (fecha, id_cliente, id_factura, monto_factura, monto_acumulado, monto_redimido, usuario_crea)
                                            values ('$fecha_actual','$idCliente','$facturaimprimir','$sumaPagos','$montoAcumulado','$pagopuntos','$_SESSION[login]')");
        }
        
        if($contador==0){
            pg_query($db, "COMMIT");
            
            header("Location: imprimir_factura2.php?variable={$facturaId}");
            exit();
        }else{
            pg_query($db, "ROLLBACK");
            echo "<script>alert('hubo un error al procesar la factura');</script>";
            header("Location: dashboard.php");
            exit();
        }
        
    } else {
        
        
        
        header("Location: dashboard.php");
        exit();
    }
    
}// primer if

function guardarPuntos($db,$facturaimprimir, $fecha_actual,$facturaId){
    $consultaPuntos="select d.total_linea as detalle, h.id_cliente, h.total_linea as total, p.prod_esinventariosn, c.gana_puntos from dfacturas d join hfacturas h on d.id_hfactura= h.id
join clientes c on h.id_cliente=c.id
join productos p on d.cod_barra=p.prod_codbarra
where d.id_hfactura='$facturaId';";
    $monto_acumulado=0;
    $resultado=pg_query($db,$consultaPuntos);
    if($resultado){
        while ($linea = pg_fetch_assoc($resultado)){
            $id_cliente = $linea['id_cliente'];
            $monto_factura=$linea['total'];
            if($linea['prod_esinventariosn']==0){
                $monto_acumulado+=$linea['detalle']*0.05/1.13;
            }else{
                $monto_acumulado+=$linea['detalle']*0.05/1.13;
            }
            $monto_redimido=0;
            $usuario_crea=$_SESSION['login'];
            $gana_puntos=$linea['gana_puntos'];
            
        }
        if($gana_puntos==1){
            $consultaActualizarPuntos=pg_query($db,"insert into puntos_clientes (fecha, id_cliente, id_factura,monto_factura, monto_acumulado, monto_redimido, usuario_crea)
                                            values('$fecha_actual','$id_cliente','$facturaimprimir','$monto_factura','$monto_acumulado','$monto_redimido','$usuario_crea')");
        }
        
    }else{
        echo "Error al actualizar los puntos";
    }
}

?>

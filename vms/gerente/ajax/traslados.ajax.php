<?php
session_start();
error_reporting(0);
require_once "../include/config.php";
require_once "../include/checklogin.php";
check_login();
date_default_timezone_set('America/El_Salvador');
$fecha_actual=date("d-m-y h:i:s");
class InsertarTraslado{

 	/*=============================================
 	 INSERTAR COMPRA
  	=============================================*/ 

    public $insertarTraslado;

	public function insertarRegistroTraslados(){
        $ar = $this->general_factura;
        $arrayg= json_decode($ar,true);
        // Generar un código único
        $codigoUnico = time(); // Timestamp
        $codigoUnico .= substr(uniqid(), 0, 3); // Hash único
        $query=("INSERT INTO htraslado(codigo,fecha_enviado, cod_origen, cod_destino, usuario_crea, estado)
        VALUES ('$codigoUnico',now(),'$this->suc_origen','$this->suc_destino','$_SESSION[login]','Pendiente')");
        $query=pg_query($query);
        
        if(!$query){
            echo "Error al procesar la informacion 1, ".pg_last_error($db)."";
        }
        //pg_close();
        
        if($query){
            echo "Su informacion ha sido enviada general";
            $arl = $this->lista_productos;
            $arrayl= json_decode($arl,true);
            $queryuid = ("select max(id) as id from htraslado");
            $queryuid = pg_query($queryuid);
            $queryuid = pg_fetch_object($queryuid);
            if(!$queryuid){
                echo "Error al procesar la informacion i, ".pg_last_error($db)."";
            }
            for ($i=0; $i < count($arrayl); $i++) { 
                $codbarra = strval($arrayl[$i]['codbarra']);  
                $cantidad = intval($arrayl[$i]['cantidad']);            

                $query2=("INSERT INTO dtraslados(id_traslado, cod_barra, cantidad, status)
                    VALUES ($queryuid->id,'$codbarra',$cantidad,'Enviado')");
                $query2=pg_query($query2);

                if(!$query2){
                    echo "Error al procesar la informacion 2, ".pg_last_error($db)."";
                }
                
                if ($query2) {
                    echo "Su informacion ha sido enviada especifico";

                    // crear la fila de existencias y puntos de reorden para cada sucursal segun las sucursales existentes
                    $query4=("UPDATE existencias SET existencia = existencia - $cantidad WHERE codbarra='$codbarra' AND id_sucursal='$this->suc_origen'");
                    $query4=pg_query($query4);

                    if(!$query4){
                        echo "Error al procesar la informacion 4, ".pg_last_error($db)."";
                    }

                    $queryuidc = ("select max(id) as id from kardex");
                    $queryuidc = pg_query($queryuidc);
                    $queryuidc = pg_fetch_object($queryuidc);
                    $queryuidc = $queryuidc->id+1;
                    if(!$queryuid){
                        echo "Error al procesar la informacion i, ".pg_last_error($db)."";
                    }
                    $query5=("INSERT INTO kardex(id, sucursal_id, codbarra, doc_no, cant_ingreso, cant_salio, fecha_transaccion, descripcion)
                        VALUES ($queryuidc, $this->suc_origen,'$codbarra','$codigoUnico',0,$cantidad,'now()', 'Salida por Traslado')");
                    $query5=pg_query($query5);

                    if(!$query5){
                        echo "Error al procesar la informacion 5, ".pg_last_error($db)."";
                    }
                }
            }
        }
        
    }

}

/*=============================================
ACTIVAR INSERTAR REGISTRO TRASLADO
=============================================*/ 
if(isset($_POST["insertarRegistroTraslados"])){
    $insertarTraslado = new InsertarTraslado();
    $insertarTraslado -> suc_origen = $_POST["salida"];
    $insertarTraslado -> suc_destino = $_POST["ingreso"];
    $insertarTraslado -> lista_productos = $_POST["lista_productos"];
    $insertarTraslado -> insertarRegistroTraslados();
}
<?php
session_start();
error_reporting(0);
require_once "../include/config.php";
require_once "../include/checklogin.php";
check_login();
date_default_timezone_set('America/El_Salvador');
$fecha_actual=date("d-m-y h:i:s");
class Monitoreo{

 	/*=============================================
 	 INSERTAR EMPRESA
  	=============================================*/ 

    public $insertarEmpresa;

	public function insertarRegistroEmpresa(){

        $query=("INSERT INTO monitoreo_empresas(empresa_nombre, empresa_direccion, empresa_telefono, empresa_cantidad_sucursales, empresa_fecha, empresa_estado)
        VALUES ('$this->nombre','$this->direccion','$this->telefono',$this->cantidad,'now()', true)");
        $query=pg_query($query);

        if(!$query){
            echo "Error al procesar la informacion 1, ".pg_last_error($db)."";
        }
        $queryuid = ("select max(empresa_id) as id from monitoreo_empresas");
        $queryuid = pg_query($queryuid);
        $id = pg_fetch_object($queryuid);
        if(!$id){
            echo "Error al procesar la informacion id, ".pg_last_error($db)."";
        }
        // Construye una consulta para obtener el registro recién insertado
        $query1 = "SELECT empresa_id,empresa_nombre FROM monitoreo_empresas WHERE empresa_id = $id->id order by empresa_id desc";
        $result = pg_query($query1);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registro = pg_fetch_assoc($result);
        if(!$query){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        
        $array = array(
            'mensaje' => 'ok',
            'registro' => $registro);
        echo json_encode($array);
        
    }

    /*=============================================
 	 INSERTAR MONITOREO
  	=============================================*/ 

    public $insertarMonitoreo;

    public function insertarRegistroMonitoreo(){

        $query=("INSERT INTO monitoreo(monitoreo_sucursal_id, monitoreo_codbarra, monitoreo_empresa_id, monitoreo_precio, monitoreo_usuario_crea, monitoreo_ultima_actualizacion, monitoreo_fecha)
        VALUES ('$this->sucursal','$this->producto','$this->empresa','$this->precio','$_SESSION[login]','now()', 'now()')");
        $query=pg_query($query);

        if(!$query){
            echo "Error al procesar la informacion 1, ".pg_last_error($db)."";
        }
        $queryuid = ("select max(monitoreo_id) as id from monitoreo");
        $queryuid = pg_query($queryuid);
        $id = pg_fetch_object($queryuid);
        if(!$id){
            echo "Error al procesar la informacion id, ".pg_last_error($db)."";
        }
        $query2=("INSERT INTO monitoreo_bitacora(bitacora_sucursal_id, bitacora_codbarra, bitacora_empresa_id, bitacora_precio, bitacora_usuario_crea, bitacora_fecha, bitacora_monitoreo_id)
        VALUES ('$this->sucursal','$this->producto','$this->empresa',$this->precio,'$_SESSION[login]','now()', $id->id)");
        $query2=pg_query($query2);

        if(!$query2){
            echo "Error al procesar la informacion 2, ".pg_last_error($db)."";
        }

        if(!$query||!$query2){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        // Construye una consulta para obtener el registro recién insertado
        $query3 = "SELECT m.monitoreo_id,
                m.monitoreo_sucursal_id,
                s.sucursal_nombre,
                m.monitoreo_codbarra,
                p.prod_nombre,
                m.monitoreo_empresa_id,
                e.empresa_nombre,
                e.empresa_direccion,
                m.monitoreo_precio,
				m.monitoreo_usuario_crea,
                m.monitoreo_ultima_actualizacion
                FROM monitoreo m 
                INNER JOIN sucursales s ON s.id = m.monitoreo_sucursal_id
                INNER JOIN productos p ON p.prod_codbarra = m.monitoreo_codbarra
                INNER JOIN monitoreo_empresas e ON e.empresa_id = m.monitoreo_empresa_id
                WHERE m.monitoreo_sucursal_id = '$_SESSION[sucursal]'
                order by monitoreo_id desc";
        $result = pg_query($query3);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registros = pg_fetch_assoc($result);
        
        $array = array(
            'mensaje' => 'ok',
            'registro' => $registros);
        echo json_encode($array);
        
    }

    /*=============================================
 	 EDITAR MONITOREO
  	=============================================*/ 

    public $editarMonitoreo;

    public function editarRegistroMonitoreo(){

        $query=("UPDATE monitoreo SET monitoreo_sucursal_id = $this->sucursal, monitoreo_codbarra = '$this->producto', monitoreo_empresa_id = $this->empresa, monitoreo_precio = $this->precio, monitoreo_usuario_crea = '$_SESSION[login]', monitoreo_ultima_actualizacion = 'now()' WHERE monitoreo_id = $this->id");
        $query=pg_query($query);

        if(!$query){
            echo "Error al procesar la informacion 1, ".pg_last_error($db)."";
        }
        
        $query2=("INSERT INTO monitoreo_bitacora(bitacora_sucursal_id, bitacora_codbarra, bitacora_empresa_id, bitacora_precio, bitacora_usuario_crea, bitacora_fecha, bitacora_monitoreo_id)
        VALUES ($this->sucursal,'$this->producto',$this->empresa,$this->precio,'$_SESSION[login]','now()', $this->id)");
        $query2=pg_query($query2);

        if(!$query2){
            echo "Error al procesar la informacion 2, ".pg_last_error($db)."";
        }

        if(!$query||!$query2){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        // Construye una consulta para obtener el registro recién insertado
        $query3 = "SELECT m.monitoreo_id,
                m.monitoreo_sucursal_id,
                s.sucursal_nombre,
                m.monitoreo_codbarra,
                p.prod_nombre,
                m.monitoreo_empresa_id,
                e.empresa_nombre,
                e.empresa_direccion,
                m.monitoreo_precio,
                m.monitoreo_usuario_crea,
                m.monitoreo_ultima_actualizacion
                FROM monitoreo m 
                INNER JOIN sucursales s ON s.id = m.monitoreo_sucursal_id
                INNER JOIN productos p ON p.prod_codbarra = m.monitoreo_codbarra
                INNER JOIN monitoreo_empresas e ON e.empresa_id = m.monitoreo_empresa_id
                WHERE m.monitoreo_sucursal_id = '$_SESSION[sucursal]'
                order by monitoreo_id desc";
        $result = pg_query($query3);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registros = pg_fetch_all($result);
        
        $array = array(
            'mensaje' => 'ok',
            'registros' => $registros);
        echo json_encode($array);
        
    }

    /*=============================================
 	 CARGAR MONITOREO
  	=============================================*/ 

    public $cargarMonitoreo;

    public function cargarDatosMonitoreo(){
        // Construye una consulta para obtener el registro recién insertado
        $query = "SELECT * FROM monitoreo WHERE monitoreo_id = $this->id";
        $result = pg_query($query);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registro = pg_fetch_assoc($result);
        if(!$query){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        
        $array = array(
            'mensaje' => 'ok',
            'registro' => $registro);
        echo json_encode($array);
        
    }

    /*=============================================
 	 CARGAR EMPRESA
  	=============================================*/ 

    public $cargarEmpresa;

    public function cargarDatosEmpresa(){
        // Construye una consulta para obtener el registro recién insertado
        $query = "SELECT * FROM monitoreo_empresas WHERE empresa_id = $this->id";
        $result = pg_query($query);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registro = pg_fetch_assoc($result);
        if(!$query){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        
        $array = array(
            'mensaje' => 'ok',
            'registro' => $registro);
        echo json_encode($array);
        
    }

    /*=============================================
 	 CARGAR HISTORIAL
  	=============================================*/ 

    public $cargarHistorial;

    public function cargarDatosHistorial(){
        // Construye una consulta para obtener el registro recién insertado
        $query = "SELECT b.bitacora_monitoreo_id,
        b.bitacora_sucursal_id,
        s.sucursal_nombre,
        b.bitacora_codbarra,
        p.prod_nombre,
        b.bitacora_empresa_id,
        e.empresa_nombre,
        e.empresa_direccion,
        b.bitacora_precio,
        b.bitacora_usuario_crea,
        b.bitacora_fecha
        FROM monitoreo_bitacora b
        INNER JOIN sucursales s ON s.id = b.bitacora_sucursal_id
        INNER JOIN productos p ON p.prod_codbarra = b.bitacora_codbarra
        INNER JOIN monitoreo_empresas e ON e.empresa_id = b.bitacora_empresa_id
        WHERE bitacora_monitoreo_id = $this->id
        order by bitacora_monitoreo_id desc";
        $result = pg_query($query);

        // Verifica si la consulta fue exitosa
        if (!$result) {
            die("Error al ejecutar la consulta: " . pg_last_error());
        }

        // Obtén los datos del registro insertado
        $registros = pg_fetch_all($result);
        if(!$query){
            echo json_encode(array('mensaje' => 'Ocurrio un error'.pg_last_error($db).''));
        }
        
        $array = array(
            'mensaje' => 'ok',
            'registros' => $registros);
        echo json_encode($array);
        
    }
}

/*=============================================
ACTIVAR INSERTAR REGISTRO EMPRESA
=============================================*/ 
if(isset($_POST["insertarRegistroEmpresa"])){
    $insertarEmpresa = new Monitoreo();
    $insertarEmpresa -> nombre = $_POST["nombre"];
    $insertarEmpresa -> direccion = $_POST["direccion"];
    $insertarEmpresa -> telefono = $_POST["telefono"];
    $insertarEmpresa -> cantidad = $_POST["cantidad"];
    $insertarEmpresa -> insertarRegistroEmpresa();
}

/*=============================================
ACTIVAR INSERTAR REGISTRO MONITOREO
=============================================*/ 
if(isset($_POST["insertarRegistroMonitoreo"])){
    $insertarMonitoreo = new Monitoreo();
    $insertarMonitoreo -> sucursal = $_POST["sucursal"];
    $insertarMonitoreo -> producto = $_POST["producto"];
    $insertarMonitoreo -> empresa = $_POST["empresa"];
    $insertarMonitoreo -> precio = $_POST["precio"];
    $insertarMonitoreo -> insertarRegistroMonitoreo();
}

/*=============================================
ACTIVAR CARGAR MONITOREO
=============================================*/ 
if(isset($_POST["cargarDatosMonitoreo"])){
    $cargarMonitoreo = new Monitoreo();
    $cargarMonitoreo -> id = $_POST["id"];
    $cargarMonitoreo -> cargarDatosMonitoreo();
}

/*=============================================
ACTIVAR CARGAR EMPRESA
=============================================*/ 
if(isset($_POST["cargarDatosEmpresa"])){
    $cargarEmpresa = new Monitoreo();
    $cargarEmpresa -> id = $_POST["id"];
    $cargarEmpresa -> cargarDatosEmpresa();
}

/*=============================================
ACTIVAR CARGAR HISTORIAL
=============================================*/ 
if(isset($_POST["cargarDatosHistorial"])){
    $cargarHistorial = new Monitoreo();
    $cargarHistorial -> id = $_POST["id"];
    $cargarHistorial -> cargarDatosHistorial();
}

/*=============================================
ACTIVAR EDITAR REGISTRO MONITOREO
=============================================*/ 
if(isset($_POST["editarRegistroMonitoreo"])){
    $editarMonitoreo = new Monitoreo();
    $editarMonitoreo -> id = $_POST["id"];
    $editarMonitoreo -> sucursal = $_POST["sucursal"];
    $editarMonitoreo -> producto = $_POST["producto"];
    $editarMonitoreo -> empresa = $_POST["empresa"];
    $editarMonitoreo -> precio = $_POST["precio"];
    $editarMonitoreo -> editarRegistroMonitoreo();
}

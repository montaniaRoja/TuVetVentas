<?php
session_start();
error_reporting(0);
require_once "../include/config.php";
require_once "../include/checklogin.php";
check_login();
date_default_timezone_set('America/El_Salvador');
$fecha_actual = date("d-m-y h:i:s");

class General {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function cambiarSucursal($id, $id_suc) {
        $query = "UPDATE tbl_empleados SET sucursal_asignada = $1 WHERE id = $2";
        $result = pg_prepare($this->db, "cambiarSucursal", $query);
        $result = pg_execute($this->db, "cambiarSucursal", array($id_suc, $id));

        if (!$result) {
            echo "Error al procesar la información: " . pg_last_error($this->db);
        }
    }
}

//$db = pg_connect("host=localhost dbname=yourdbname user=yourdbuser password=yourdbpassword");

if (isset($_POST["cambiarSucursal"])) {
    $general = new General($db);
    $gerente_id = $_POST["gerente_id"];
    $id_suc = $_POST["id_suc"];
    $general->cambiarSucursal($gerente_id, $id_suc);
}

if (isset($_POST["cambiarSucursalA"])) {
    $general = new General($db);
    $atencion_id = $_POST["atencion_id"];
    $id_suc = $_POST["id_suc"];
    $general->cambiarSucursal($atencion_id, $id_suc);
}

if (isset($_POST["cambiarSucursalV"])) {
    $general = new General($db);
    $veterinario_id = $_POST["veterinario_id"];
    $id_suc = $_POST["id_suc"];
    $general->cambiarSucursal($veterinario_id, $id_suc);
}

pg_close($db);

<?php

session_start();
//error_reporting(0);
include_once('../include/config.php');
include('../include/checklogin.php');
check_login();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    
    $consultaMaxIdCl = "SELECT MAX(id) FROM proveedores";
    $maxIdResultado = pg_query($db, $consultaMaxIdCl);
    $maxIdCliente = pg_fetch_result($maxIdResultado, 0, 0);
    $siguienteId = $maxIdCliente + 1;
    // Aquí podrías hacer cualquier procesamiento adicional con los datos recibidos
    
    
    $nombreProveedor = $_POST['vendorname'];
    $nitProveedor = $_POST['vendornit'];
    $nrcProveedor = $_POST['vendornrc'];
    $nombreCheque = $_POST['vendoremitir'];
    $dirUno = $_POST['vendordireccion1'];
    $dirDos = $_POST['vendordireccion2'];
    $telProveedor = $_POST['vendortelefono'];
    $contactoProveedor = $_POST['vendorcontacto'];
    $usuarioCrea = $_SESSION['login'];
    $correoProveedor = $_POST['vendorcorreo'];
    $sucursalCrea = $_SESSION['sucursal'];
    $fecha_actual = date("Y-m-d");
    $activo = 1;
    
    $query = "INSERT INTO proveedores (id, prov_nombre, prov_nit, prov_nrc, prov_nombrecheque, prov_ldireccion1, prov_ldireccion2, prov_telefono, prov_nombrecontacto, creadapor, fecha_creacion, activosn, prov_correo, sucursal_crea)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13,$14)";
    
    $params = array(
        $siguienteId,
        $nombreProveedor,
        $nitProveedor,
        $nrcProveedor,
        $nombreCheque,
        $dirUno,
        $dirDos,
        $telProveedor,
        $contactoProveedor,
        $usuarioCrea,
        $fecha_actual,
        $activo,
        $correoProveedor,
        $sucursalCrea
    );
    
    $result = pg_query_params($db, $query, $params);
    
    if ($result) {
        echo "Proveedor creado con éxito.";
    } else {
        echo "Error al crear el proveedor: " . pg_last_error($db);
    }
    
   
}
?>
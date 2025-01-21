<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

    $obtenerPassword="select * from gerentes";
    $result=pg_query($db, $obtenerPassword);
    if($result){
        while ($fila = pg_fetch_assoc($result)) {
            $password = $fila['gerente_passwd'];
            $adminId=$fila['gerente_id'];
            echo $password."<br>";
            $hashedPassword=password_hash($password, PASSWORD_DEFAULT);
            
            $cambiarPwd="update gerentes set gerente_passwd='$hashedPassword', gerente_confpasswd='$hashedPassword' where gerente_id='$adminId'";
            $resultCambiar=pg_query($db,$cambiarPwd);
            if($resultCambiar){
                echo "passwords encriptados exitosamente";
            }
            
        }
    }
    
   
    
?>
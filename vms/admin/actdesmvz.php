<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();


$estado=$_POST['nuevo_valor'];
$adminid=$_POST['admin_id'];

if($estado==0){
    echo "Zero ".$adminid;
}elseif($estado==1){
    echo "uno ".$adminid;
}

$actualizaradmin=pg_query($db,"update mvz set activosn='$estado' where mvz_id='$adminid'");


?>
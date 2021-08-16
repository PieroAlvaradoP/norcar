<?php  
    $conection=mysqli_connect("localhost","root","","northcar_prueba");
    
    if(!$conection){
        echo 'Error en la autenticación';
    }else{
        echo 'Conexión existosa';
    }
?>
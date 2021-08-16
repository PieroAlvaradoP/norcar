<?php
    $alert='';
    session_start();
    if(!empty($_SESSION['active'])){
        header('location: admin/');
    }else{
        if(!empty($_POST)){  //Clic_action
            if(empty($_POST['usuario']) || (empty($_POST['contraseña']))){
                // echo '
                //     <script>
                //     window.location="../index.php";
                //     alert("Ingrese usuario y contraseña");
                //     </script>
                // ';
                $alert='Ingrese su usuario y su clave';
            }else{
                require_once "php/conection.php"; //Conecta a la base 
    
                //Obtiene los valores ingresados por teclado
                $usuario=$_POST['usuario']; 
                $contraseña=$_POST['contraseña'];
    
                $query=mysqli_query($conection,"SELECT * FROM `usuario` WHERE usuario='$usuario' and contraseña='$contraseña'");
                $result=mysqli_num_rows($query);
    
                if($result>0){
                    $data=mysqli_fetch_array($query);
                    session_start();
                    $_SESSION['active']=true;
                    $_SESSION['idUsuario']=$data['id_usuario'];
                    $_SESSION['dni']=$data['dni'];
                    $_SESSION['nombre']=$data['nombre'];
                    $_SESSION['apellidos']=$data['apellidos'];
                    $_SESSION['email']=$data['email'];
                    $_SESSION['usuario']=$data['usuario'];
                    $_SESSION['contraseña']=$data['contraseña'];
                    $_SESSION['tipoUsuario']=$data['tipo_usuario'];
    
                    header('location: admin/');
                }else{
                    // echo '
                    // <script>
                    // window.location="../index.php";
                    // alert("El usuario o contraseña son incorrectos");
                    // </script>
                    // ';
                    $alert='Usuario o contraseña incorrectos';
                    session_destroy();
                }
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Login</title>
</head>
<body>
    <section class="container">
        <form class="container__form" action="" method="POST">
            <h1 class="container__form--title">Iniciar Sesión</h1>
            <img src="img/black_logo.png" alt="logo">
            <input class="input" type="text" placeholder="Usuario" name="usuario">
            <input class="input" type="password" placeholder="Contraseña" name="contraseña">
            <input class="button" type="submit" value="INGRESAR" >
            <div class="alert"><p><?php echo(isset($alert)?$alert:'');?></p></div>
        </form>
    </section>
</body>
</html>
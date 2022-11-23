<div class="ContenedorLogin">
  <div class="ContenedorImagen">
    <input type="button" value="Continuar" class="Boton1" id="btnContinuar">
  </div>

  <div class="ContenedorFormulario">
    <form method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
      <div class="Box">
        <h1>EBOOKS</h1>
        <p>Un buen libro es más que una piedra preciosa</p>
        <div class="Formulario">
          <label for="txtEmail" style="color: #aaa;">Correo</label><br>
          <input class="TextBox" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"><br>
          {{if errorEmail}}
          <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
          {{endif errorEmail}}


          <label for="txtPswd" style="color: #aaa;">Contraseña</label><br>
          <input type="password" class="TextBox" autocomplete="off" id="txtPswd" name="txtPswd" value="{{txtPswd}}"><br>
          {{if errorPswd}}
          <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
          {{endif errorPswd}}
          {{if generalError}}
          <div class="row">
            {{generalError}}
          </div>
          {{endif generalError}}
          <a href="">Olvidaste la contraseña?</a>
        </div>

        <input type="submit" class="Boton" id="btnLogin" value="Entrar">
        <hr>
    </form>
    <p style="color: black;">Nuevo Lector? <a style="color: #3496db; text-decoration:underline;" id='Crear'
        onclick="Registro()">crea tu cuenta</a></p>
  </div>
</div>
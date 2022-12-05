<section class="CajaProducto">
    <h4>{{mode_desc}}</h4>

    <form action="index.php?page=mnt_usuario" method="post">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="usercod" value="{{usercod}}" />

        <div class="Box1">
            <label for="useremail">Correo</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="useremail" id="useremail"
                value="{{useremail}}" />
            {{if error_useremail}}
            {{foreach error_useremail}}
            <div class="error">{{this}}</div>
            {{endfor error_useremail}}
            {{endif error_useremail}}

            <label for="Usuario">Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="username"
                id="username" value="{{username}}" />
            {{if error_username}}
            {{foreach error_username}}
            <div class="error">{{this}}</div>
            {{endfor error_username}}
            {{endif error_username}}


            <label for="userest">Estado Del Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="userest"
                id="userest" value="{{userest}}" />
            {{if error_userest}}
            {{foreach error_userest}}
            <div class="error">{{this}}</div>
            {{endfor error_userest}}
            {{endif error_userest}}


            <label for="usertipo">Tipo De Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="usertipo"
                id="usertipo" value="{{usertipo}}" />
            {{if error_usertipo}}
            {{foreach error_usertipo}}
            <div class="error">{{this}}</div>
            {{endfor error_usertipo}}
            {{endif error_usertipo}}
        </div>

        <div class="Box3">
            <h1>Roles Del Usuario</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Codigo del rol</th>
                        <th>Estado del rol</th>
                        <th>Fecha de creación del rol</th>
                        <th>Fecha de expiración del rol</th>
                        <th>Opción</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach RolesUsuario}}
                    <tr style="text-align: center;">
                        <td>{{rolescod}}</td>
                        <td>{{rolesest}}</td>
                        <td>{{roleuserfch}}</td>
                        <td>{{roleuserexp}}</td>
                        <td>
                            <input type="checkbox" name="chkRol" id="chkRol">                   
                        </td>
                    </tr>
                    {{endfor RolesUsuario}}
                </tbody>
            </table>
            <h1>Roles Existentes del programa</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Codigo de Rol</th>
                        <th>Descripcion Del Rol</th>
                        <th>Estado Del Rol</th>
                        <th>  
                            Opciones                          
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach TodosLosRoles}}
                    <tr style="text-align: center;">
                        <td>{{rolescod}}</td>
                        <td>{{rolesdsc}}</td>
                        <td>{{rolesest}}</td>
                        <td>
                            <input type="checkbox" name="chkAddRol" id="chkAddRol" onclick="CapturarRol()">                   
                        </td>
                    </tr>
                    {{endfor TodosLosRoles}}
                </tbody>
            </table>
        </div>

        <fieldset>
            {{if showBtn}}
            <button class="btnEnviar" type="submit" name="btnEnviar">{{btnEnviarText}}</button>
            &nbsp;
            {{endif showBtn}}
            <button class="btnCancelar" name="btnCancelar" id="btnCancelar">Cancelar</button>
        </fieldset>
    </form>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_usuarios';
        });
    });
</script>
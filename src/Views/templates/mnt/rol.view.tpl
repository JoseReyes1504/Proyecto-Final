<section class="CajaProducto">
    <h4>{{mode_desc}}</h4>

    <form action="index.php?page=mnt_rol" method="post">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="usercod" value="{{usercod}}" />

        <div class="Box1">
            <label for="rolescod">Codigo del rol</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolescod" id="rolescod"
                value="{{rolescod}}" />
            {{if error_rolescod}}
            {{foreach error_rolescod}}
            <div class="error">{{this}}</div>
            {{endfor error_rolescod}}
            {{endif error_rolescod}}

            <label for="rolesdsc">Descripción</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolesdsc"
                id="rolesdsc" value="{{rolesdsc}}" />
            {{if error_rolesdsc}}
            {{foreach error_rolesdsc}}
            <div class="error">{{this}}</div>
            {{endfor error_rolesdsc}}
            {{endif error_rolesdsc}}


            <label for="rolesest">Estado Del Rol</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolesest"
                id="rolesest" value="{{rolesest}}" />
            {{if error_rolesest}}
            {{foreach error_rolesest}}
            <div class="error">{{this}}</div>
            {{endfor error_rolesest}}
            {{endif error_rolesest}}
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
            window.location.href = 'index.php?page=mnt_roles';
        });
    });
</script>
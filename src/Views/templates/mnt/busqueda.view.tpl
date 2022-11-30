<section class="ContenedorSeccionSeparador">
    <p>{{Titulo}}</p>
</section>

<input type="hidden" name="mode" value="{{mode}}" />
<input type="hidden" name="Busqueda" value="{{Busqueda}}" />

<section class="ContenedorDeBusqueda">       
    {{foreach LibrosEncontrados}}    
     <div class="boxPopsAniBus">
            <div class="img256" style="background-image: url({{Imagen64}})"></div>
            <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">+</span><span>Agregar</span></button>
                    <button class="btnAdd2" role="button" onclick="Favoritos('{{Titulo}}')"><span
                class="text">♡</span><span>Favoritos</span></button>
            <button class="btnAdd2" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
    {{endfor LibrosEncontrados}}
</section>
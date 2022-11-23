<section class="ContenedorPrincipalPortada">
    <div class="imgPortada"></div>
    <p>El material más asequible y hermoso para leer</p>
    <h1>Explora todos los libros</h1>
    <input type="button" value="Explorar Ahora" onclick="Explorar()">
</section>

<section class="ContenedorSeccionSeparador">
    <p>Libros añadidos recientemente</p>
</section>

<section class="ContenedorBooks">
    {{foreach LibrosRecientes}}
    <div class="box Animado">
        <img class="img255" src="{{Imagen64}}" alt="">
        <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                class="text">$</span><span>Comprar</span></button>
        <button class="btnAdd" role="button" onclick="Visuzalizar({{ID}})"><span
                class="text">♡</span><span>Favoritos</span></button>
        <button class="btnAdd" role="button"
            onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                class="text">🟑</span><span>Detalles</span></button>
    </div>
    {{endfor LibrosRecientes}}
</section>

<section class="ContenedorSeccionSeparador">
    <p>Categorías</p>
</section>

<section class="ContenedorPrincipalPortada2 Animado">
    <div class="imgPortada2"></div>
    <div class="ContenidoPortada">
        <div class="boxPops">
            <div class="imgGeneros"></div>
        </div>
    </div>
    <div class="ContenidoPortada2">
        <p>Una colección que te cautivará</p>
        <h1>Generos Literarios </h1>
        <input type="button" value="Ir a los generos" onclick="Generos()">
    </div>
</section>

<section class="ContenedorSeccionSeparador">
    <p>Libros Más buscados</p>
</section>

{{foreach LibrosPublicidad}}
<section class="ContenedorVista Animado">
    <div class="Fondo">
        <img src="{{Imagen64}}" class="imgContenedorVista" alt="">
        <div class="Titulo">
            <h1>{{Titulo}}</h1>
            <h3>{{Autor}}</h3>
        </div>
        <div class="InformacionPublicidad">
            <div class="Informacion">
                <h1>O</h1>
                <p>{{Contenido}}</p>
            </div>

            <div class="Continuar">
                <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                        class="text">$</span><span>Comprar</span></button>
                <button class="btnAdd2" role="button" onclick="Visuzalizar({{ID}})"><span id="txtFav"
                        class="text">♡</span><span>Favoritos</span></button>
            </div>
        </div>
    </div>
</section>
{{endfor LibrosPublicidad}}


<section class="ContenedorSeccionSeparador">
    <p>Libros Más Populares</p>
</section>


<section class="ContenedorPrincipalBoxes Animado">
    {{foreach LibrosPopulares}}
    <div class="CajaA1">
        <img class="imgCA" src="{{Imagen64}}" alt="Portada Imagen">
        <div class="GeneroLibro">
            <p></p>
        </div>
        <div class="PequenaInfo">
            <p></p>
        </div>
        <div class="ContenedorBotonCajaA1">
            <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">$</span><span>Comprar</span></button>
            <button class="btnAdd" role="button"><span id="txtFav" class="text">♡</span><span>Favoritos</span></button>
            <button class="btnAdd" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
    </div>
    {{endfor LibrosPopulares}}
</section>

<section class="ContenedorSeccionSeparador">
    <p>Libros Recientemente Populares</p>
</section>

{{foreach LibrosPublicidad2}}
<section class="ContenedorVista Animado">
    <div class="Fondo">
        <img src="{{Imagen64}}" class="imgContenedorVista" alt="">
        <div class="Titulo">
            <h1>{{Titulo}}</h1>
            <h3>{{Autor}}</h3>
        </div>
        <div class="InformacionPublicidad">
            <div class="Informacion">
                <h1>O</h1>
                <p>{{Contenido}}</p>
            </div>

            <div class="Continuar">
                <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                        class="text">$</span><span>Comprar</span></button>
                <button class="btnAdd2" role="button" onclick="Favoritos('{{Titulo}}')"><span id="txtFav"
                        class="text">♡</span><span>Favoritos</span></button>
            </div>
        </div>
    </div>
</section>
{{endfor LibrosPublicidad2}}

<section class="ContenedorSeccionSeparador">
    <p>Mangas</p>
</section>

<section class="ContenedorPrincipalPortada3 Animado">
    <div class="imgPortada3"></div>

    <div class="ContenidoPortada4">
        <h1>Mundo Manga</h1>
        <p>漫画世界</p>
        <input type="button" id="btnManga" onclick="Seccion3()" value="Descubrir Más">
    </div>

    <div class="ContenidoLibs">
        {{foreach LibrosMangas2}}
        <div class="boxPopsAni">
            <div class="img256" style="background-image: url({{Imagen64}})"></div>
            <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">$</span><span>Comprar</span></button>
            <button class="btnAdd2" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
        {{endfor LibrosMangas2}}
    </div>

    <div class="ContenidoPortadaLib">
        {{foreach LibrosMangas}}
        <div class="boxPopsAni">
            <div class="img256" style="background-image: url({{Imagen64}})"></div>

            <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">$</span><span>Comprar</span></button>
            <button class="btnAdd2" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
        {{endfor LibrosMangas}}
    </div>
</section>

<section class="ContenedorBotonesSeccion">
    <div class="TituloSeccion">
        <span>Generos Literarios</span>
    </div>
    <div class="BoxSeccion">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Poesia')" id="Btn1" value="Poesía">
        <input type="button" class="btnInvestigar" onclick="Seccion4('No-Ficcion')" id="Btn2" value="No-Ficcion">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Drama')" id="Btn3" value="Drama">
        <div class="Arrow">
            <svg xmlns="http://www.w3.org/2000/svg" id="ArrowDown" height="48" width="48">
                <path d="M24 40 8 24l2.1-2.1 12.4 12.4V8h3v26.3l12.4-12.4L40 24Z" />
            </svg>
            <p id="txtSeccion"></p>
        </div>
        <input type="button" class="btnInvestigar" onclick="Seccion4('Terror')" id="Btn4" value="Terror">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Comics')" id="Btn5" value="Comics">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Manga')" id="Btn6" value="Manga">
    </div>
</section>

<section class="ContenedorOpen Animado">
    {{foreach GenerosLiterarios}}
    <div class="imgPortada5"></div>
    <div class="boxLibs">
        <div class="imgLib" style="background-image: url({{Imagen64}})"></div>
        <div class="Contenido">
            <h1 id="TituloLib">{{Titulo}}</h1>

            <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">$</span><span>Comprar</span></button>
            <button class="btnAdd" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
    </div>
    {{endfor GenerosLiterarios}}    
</section>
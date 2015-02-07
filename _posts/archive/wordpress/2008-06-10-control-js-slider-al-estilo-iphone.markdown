---
layout: post
status: publish
published: true
title: Control JS Slider al estilo iPhone

wordpress_id: 50
wordpress_url: http://www.merlos.org/blog2/?p=50
date: '2008-06-10 14:29:54 +0200'
date_gmt: '2008-06-10 12:29:54 +0200'
categories:
- blog-archive
- desarrollo
tags:
- jquery
- javascript
comments: []
---
<p><a href="http://www.aboone.com/">Alex Boone</a>, se ha currado un<a href="http://www.aboone.com/?p=34"> control hecho en Javascript usando jQuery simula el desbloquear el iPhone</a>.</p>
<p>Hasta ahí bien, el caso está en que en tanto el autor como en algún blog se ha comentado la <a href="http://es.appleweblog.com/2008/05/23/captcha-al-estilo-unlock-del-iphone/">posibilidad de usarlo  como </a><a href="http://en.wikipedia.org/wiki/Captcha">CAPTCHA</a>.  Los <a href="http://en.wikipedia.org/wiki/Captcha">CAPTCHA</a> se utilizan en los formularios para evitar que de forma un programa maligno (o <a href="http://es.wikipedia.org/wiki/Bot"><em>bot</em></a>) rellene el formulario de forma automática. Los captchas suelen ser imágenes de letras un tanto deformadas o con elementos que no permiten visualizarlas con total claridad</p>
<p><img class="alignleft" style="border: 1px solid black; margin: 5px; float: left;" src="http://upload.wikimedia.org/wikipedia/commons/6/69/Captcha.jpg" alt="" width="290" height="80" /></p>
<p>Con esto se evita, por ejemplo, crear miles de cuentas o enviar cientos de comentarios a una entrada de un blog con publicidad.</p>
<p>En este caso, el CAPTCHA simula la acción de desbloquear un <a href="http://es.wikipedia.org/wiki/Iphone">iPhone</a>:</p>
<p><img style="vertical-align: middle;" src="http://es.appleweblog.com/wp-content/uploads/2008/05/captchas.jpg" alt="Captcha iphone" width="455" height="171" /></p>
<p>Por desgracia, <a href="http://unvlog.com/merlos/2008/6/10/gila-guerra"><em>de color bien, pero no flota</em>.</a> Si vemos cómo funciona, cuando mueves la flecha a la derecha, lo que hace el JS es llamar a una funcion handler.</p>
<p>En el siguiente trozo de código puedes ver como se crea el CAPTCHA en JS:</p>
<pre><code>
var s2 = new Slider("slider2",{
 message: "turn off the lights!",
 color: "red",
 handler: function(){
  $("body").css("backgroundColor", "black");
 }
});
</code></pre>
<p>Cuando se mueve la flecha a la derecha, se llama a la función que hay después de handler. El programador tendría que idear alguna forma para saber que no ha sido un bot el que ha enviado el formulario ¿pero cómo?</p>
<p>Los CAPTCHA generalmente son imágenes porque cualquier acción escrita en texto puede leída, <em>parseada </em>y emulada por un <em>bot</em>, sin embargo, las imágenes requieren un procesado digital de la susodicha imagen, una tarea no tan trivial.</p>
<p>En resumen, por sí sólo el control no es un CAPTCHA y dudo mucho de que sirva para tal fin, pero como control sí que está chulo.</p>

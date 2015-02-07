---
layout: post
status: publish
published: true
title: calltube, tus videollamadas en Youtube

wordpress_id: 71
wordpress_url: http://www.merlos.org/blog2/?p=71
date: '2008-09-23 16:34:52 +0200'
date_gmt: '2008-09-23 14:34:52 +0200'
categories:
- blog-archive
- moviles
tags:
- open movilforum youtube calltube proyectos
comments:
- id: 26
  author: Olga
  author_email: itakora@gmail.com
  author_url: http://itakora.com
  date: '2008-10-19 16:32:42 +0200'
  date_gmt: '2008-10-19 14:32:42 +0200'
  content: felicidades, me parece un proyecto estupendo
---
<p><a href="http://open.movilforum.com/node/512"><img title="Logo Calltube" src="http://dl-client.getdropbox.com/u/22698/img/calltube.png" alt="calltube" width="246" height="100" /></a></p>
<p>Bueno, habréis notado que llevo unos días sin escribir en mi blog, cuando parece que lo había retomado con fuerza. La última entrada fue el día 20 de Agosto en el que explicaba cómo se hace una <a title="screenshot con iphone" href="http://www.merlos.org/blog2/2008/08/20/hacer-capturas-de-pantalla-del-iphone/">captura de pantalla con el iPhone</a>, casi un mes después vuelvo a escribir.</p>
<p>Este mes de silencio, además de unirse con las vacaciones, veranito y demás ha coincidido con el desarrollo de un nuevo proyecto que ayer vio la luz por primera vez.</p>
<p>El 18 de julio salieron las bases del <a title="concurso movilidad" href="http://open.movilforum.com/concurso/3">III concurso de mashups de movilidad de Open Movilforum</a>, además, un tiempo antes habían publicado una <a href="http://open.movilforum.com/api/videollamada">API de Recepción de videollamada</a>. Entonces, yo me pregunté, qué puedo hacer con el vídeo grabado de una videollamada... y la respuesta era bastante obvia... <strong>SUBIRLA A YOUTUBE</strong>.</p>
<p>Dejé la idea aparcada porque en verano me dediqué a juguetear con el <a href="http://code.google.com/googleappengine">Google App Engine</a>.</p>
<p>Ya era 29 de agosto y volví a echar un ojo al concurso, ya no recordaba las fechas y tal, y le comenté a un amigo la idea: "Venga vah, anímate, el premio está guay y el proyecto mola". Le convencí, así que ese día hicimos algunas búsquedas para ver la viabilidad del proyecto, resolver las dudas de implementación y demás, así como evolucionar un poco la idea, fijar objetivos,  algunas prioridades de las cosas que tenía que tener y cosas que molaría que tuviera, descartar aquello que fuera muy costoso desde el punto de vista de la implementación, etc.</p>
<p>El concurso terminaba el día 18 de Septiembre, teníamos 20 días... y ninguno de los dos estaba de vacaciones. Un desarrollo ágil y rápido iba a ser fundamental.</p>
<p>Unos días después, tras algunos problemas con la API de recepción de videollamadas, éramos capaces de unir el stream de audio y vídeo (en las videollamadas vienen como flujos separados) y subir los vídeos a youtube.</p>
<p>También, habíamos pensado, que vale, subir un vídeo a youtube está chulo, pero lo que estaría genial sería poder decírselo a tus amigos.  Así que, ya habíamos estado mirando las APIs de las redes sociales que conocíamos para ver cuáles eran viables de usar en los pocos días que teníamos.</p>
<p>Finalmente, tras descartar Facebook por temas de tiempo, nos quedamos con la propia de youtube,  twitter (microblogging), delicious (social bookmarking) e ipoki (red social de geolocalización).</p>
<p>Por otro lado, una de las APIs del Open.mofilforum, es la de Localízame, que nos permitía geolocalizar al usuario en el momento en el que generaba el vídeo.  Aunque, la API original de Localízame devuelve un texto en parecido a <em>"el usuario se encuetra entre la calle tal y la calle tal, cerca del recinto ferial fulanito con un radio de 1 km"</em>, de la respuesta se pueden extraer las coordenadas UTM y de ahí convertirlas a Latitud y Longitud, que son las que usa Youtube, Ipoki y Google Maps. Haciendo estos malabarismos consigues geolocalizar el vídeo automáticamente, sin que el usuario necesite tener GPS en el móvil. La verdad es que esto mola un montón... aunque el servicio localízame de movistar es muy caro.</p>
<p>Finalmente, presentamos <a title="página del proyecto calltube" href="http://open.movilforum.com/node/512">calltube al concurso</a> y hoy día 23 de septiembre han anunciado los <a title="ganadores concurso open movilforum" href="http://open.movilforum.com/concurso/3">ganadores</a>... <span style="color: #800000;"><strong>Y hemos quedado primeros oe, oe, oe, oeeeeeeee, oeeeeeeee, oeeeeeeeee!!!</strong></span></p>
<p>Un par de capturas:</p>
<p>[caption id="" align="alignnone" width="574" caption="CalltubeIndex"]<img title="Página de inicio de Calltube" src="http://dl-client.getdropbox.com/u/22698/img/ct_index.png" alt="CalltubeIndex" width="574" height="360" />[/caption]</p>

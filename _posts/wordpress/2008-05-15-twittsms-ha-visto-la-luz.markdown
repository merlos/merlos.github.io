---
layout: post
status: publish
published: true
title: Twittsms ha visto la luz
wordpress_id: 34
wordpress_url: http://www.merlos.org/blog2/2008/05/15/twittsms-ha-visto-la-luz/
date: '2008-05-15 19:20:21 +0200'
date_gmt: '2008-05-15 17:20:21 +0200'
categories:
- blog-archive
- blog
tags:
- twittsms
- twitter
- sms
- osap
- open.movilforum
comments: []
---
<p>Al fin, después de mucho trabajo, ha visto la luz el proyecto <a title="Página de twittsms, twitter sms" href="http://www.twittsms.com"><strong>Twittsms</strong></a>, un servicio que te permite actualizar tu <a title="Página de twitter" href="http://www.twitter.com">Twitter</a> enviando un SMS a un número de móvil Español.<a title="¿Qué es Twitter según la wikipedia?" href="http://es.wikipedia.org/wiki/Twitter">Twitter</a> es una <a title="¿Qué es una red social?" href="http://es.wikipedia.org/wiki/Red_social">red social</a> de <a title="¿Qué es microblogging?" href="http://es.wikipedia.org/wiki/MicroBlogging">microblogging</a> muy popular en España que permite enviar <em>posts</em> de hasta 140 caracteres. Los microblogs molan porque no tienes que hacer un mensaje tan elaborado y permite a tus amigo seguir lo que estás haciendo y enterarse de tu vida :).</p>
<p>Hasta ahora, para actualizar tu twitter usando el teléfono móvil había tres posibilidades:</p>
<ol>
<li><strong>Envío de un SMS a un número de Reino Unido</strong>. Un usuario minimizará el uso de este método debido al alto coste de un mensaje internacional</li>
<li><strong>Instalar una aplicación en tu terminal</strong>. Requiere por parte del usuario buscar, instalar y ejecutar una aplicación (nivel medio/alto de usuario). Además, estas aplicaciones emplean conexiones de datos, que todavía son percibidas como conexiones caras o son desconocidas las tarifas. Por último, existe el problema de la fragmentación del mercado, no todos los terminales son compatibles con las aplicaciones.</li>
<li><strong>Usar el navegador web del terminal.</strong> Tiene el problema de que no todos los terminales poseen un navegador web HTML, además, si el teléfono no es 3G la navegación se hace lenta y deseperante. Por último, también, al igual que en el caso anterior, requiere una conexión de datos (sensación de caro y tarifas desconocidas).</li>
</ol>
<p>Sin embargo, twittsms ofrece la posibilidad de que puedas actualizar twitter simplemente enviando un SMS a un número local de España.</p>
<p>Para poder usar twittsms:</p>
<ul>
<li>Sólo necesitas un <strong>móvil que soporte envío de SMS</strong> (99,99999%) del parque actual en España</li>
<li>Al ser un <strong>SMS a un número local</strong>, es barato, por lo que puedes usarlo sin pensar en la factura a final de mes.</li>
<li>Además, no necesitas <strong>ningún aprendizaje</strong> adicional ni instalar nada. Sólo hace falta saber enviar SMS.</li>
</ul>
<p>Por tanto, las ventajas para un usuario de twitter son:</p>
<ul>
<li>Es económico</li>
<li>Vale cualquier móvil</li>
<li>Es fácil de usar</li>
</ul>
<p>Desde el punto de vista técnico, twittsms <strong>se ha intentado diseñar</strong> con dos objetivos:</p>
<ol>
<li><strong>Diseño centrado en el usuario</strong>. El diseño de la interacción con el interfaz web, sus textos, la ayuda, los mensajes de error se ha intentado que cumplan con los principios básicos de la usabilidad.</li>
<li><strong>Calidad desde el punto de vista técnico.</strong>
<ol>
<li>Empleando estándares de la W3C (xHTML strict validado, CSS...)</li>
<li>usando herramientas y tecnologías libres PHP/MySQL/Apache.</li>
<li>Creando una arquitectura software de tres capas (DAL,BLL y Presentación)</li>
<li>Uso de bibliotecas de terceros bien conocidas:
<ol>
<li>jQuery</li>
<li>Extensiones PEAR PHPPlantillas Smarty </li>
<li>Código fuente bien documentado, con tags phpDocumentor</li>
</ol>
</li>
</ol>
</li>
</ol>
<p>Resumiendo, twittsms es:</p>
<ul>
<li><strong>Sencillo de usar</strong>, no necesitas instalar nada, ni aprender nada nuevo</li>
<li><strong>Único</strong>, no hay ningún servicio similar en España</li>
<li><strong>Universal</strong>, cualquier usuario de móvil puede emplearlo, no requiere de un terminal con unas capacidades específicas</li>
<li><strong>Económico</strong>, tanto para el usuario ya que actualizar su estado en twitter sólo le cuesta un SMS, como para el desarrollador, ya que está basado en software libre</li>
<li><strong>Extensible</strong>, puede usarse en cualquier otro país simplemente cambiando el gateway</li>
<li><strong>De calidad</strong>, diseño centrado en el usuario, calidad software y bien documentado. </li>
</ul>
<p><a title="Twitter twitter follower follower" href="http://www.twittsms.com">Twittsms</a> es un proyecto de código abierto <a title="Twittsms en open.movilforum" href="http://open.movilforum.com/node/378">publicado en Open.Movilforum</a>. <a href="http://open.movilforum.com">Open.Movilforum</a> es una iniciativa de <a title="Página de Open.Movilforum" href="http://open.movilforum.com">Telefónica España</a> en la que está publicando interfaces y APIs que permiten a terceros aprovechar sus servicios. Aunque, seguramente trate en otro post esto ya que, bueno, es mejorable.<br />
También decir tengo que decir que <a title="Página de twittsms, twitter sms" href="http://www.twitsms.com">Twittsms</a> participa en el <a href="http://open.movilforum.com/concurso/2">segundo concurso de Open movilforum</a>. El ganador se sabrá la semana que viene. En total han <a title="Lista de proyectos concursando Open.Movilforum" href="http://open.movilforum.com/concurso/proyectos">participado 16 proyectos</a> y el premio son 6000€ para el primero y 2000€ para el segundo y tercero.</p>
<p>Yo participo con <a title="Proyecto twittsms en Open.Movilforum" href="http://open.movilforum.com/node/378">Twittsms</a> y <a title="Página de OSAP en Open.Movilforum" href="http://open.movilforum.com/node/305">OSAP - Open Movilforum SMS API in PHP</a>.</p>

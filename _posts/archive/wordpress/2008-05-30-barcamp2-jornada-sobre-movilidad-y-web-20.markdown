---
layout: post
status: publish
published: true
title: Barcamp2, Jornada sobre movilidad y Web 2.0
wordpress_id: 44
wordpress_url: http://www.merlos.org/blog2/?p=44
date: '2008-05-30 13:17:59 +0200'
date_gmt: '2008-05-30 11:17:59 +0200'
categories:
- blog-archive
- merlos
comments: []
---
<p>La <a title="Página de la barcamp2" href="http://open.movilforum.com/barcamp/2">Barcamp2</a> se celebró el pasado martes 27 de Mayo en la Escuela de Telecomunicaciones de la Universidad Politécnica de Madrid. Yo estuve allí, aunque no en todas las ponencias, ya que por motivos de trabajo tuve que ausentarme una parte del día.</p>
<p>En esta entrada tienes mi visión de la Jornada.</p>
<p>Antes de nada, para el que no sepa qué es la Barcamp, comentar que trata de una <strong>jornada para poder compartir opiniones y experiencias sobre el mundo móvil y la Web 2.0.</strong> Está organizada por <a href="http://open.movilforum.com/">Open Movilforum</a> junto con <a href="http://www.the-cocktail.com/">TheCocktail</a>, y forma parte de una iniciativa que pretende abrir a desarrolladores independientese y del mundo de código abierto los servicios de Telefónica Móviles de España. Tienes <a href="http://www.elpais.com/articulo/internet/Telefonica/comparte/aplicaciones/mundo/elpeputec/20080131elpepunet_1/Tes">un artículo del periódico El País</a> en el que sus responsables comentan el objetivo de este proyecto.</p>
<p>Durante la jornada se han realizado diferentes <strong>micro-ponencias</strong> (de unos 20-30 minutos), en las que se han tratado temas como el presente y futuro del desarrollo de aplicaciones para móviles, análisis del SDK del iPhone  o android, Modelos de negocio Open, Autenticación móvil usando OpenId, la iniciativa open de Telefónica I+D Mobile Manager, la red social móvil Festuc y, por supuesto, hubo una ponencia sobre <strong>twittsms</strong>.</p>
<p>Una ponencia muy interesante fue la de Miguel Lizondo, de <a title="web corporativa de deimos" href="http://www.deimos-space.com">deimos-space.com</a>, titulada "<a href="http://open.movilforum.com/node/387">Desarrollo para móviles Presente y futuro</a>", en el que comentó las diferentes plataformas actuales de desarrollo analizando los pros y los contras, así como una visión de cómo sería el desarrollo en el futuro para él.</p>
<p>Resumo brevemente esta ponencia. Las plataformas actuales:</p>
<p><strong>JME (antes J2Me)</strong></p>
<ul>
<li><strong>A favor:</strong>
<ul>
<li>Muy documentado y soportado, con lo cual los desarrollos pueden ser más rápidos.</li>
<li>Lenguaje fácil</li>
<li>Es perfecto para videojuegos.</li>
</ul>
</li>
<li><strong>En contra:</strong>
<ul>
<li>Fragmentación (incluso dentro de un fabricante) debido a que las JSR tienen muchos requisitos como opcionales, por tanto, un desarrollador puede encontrarse con que alguna funcionalidad que necesita no está implementada.</li>
<li>Basado en un <a href="http://en.wikipedia.org/wiki/Sandbox_%28software_development%29">modelo software Sandbox</a>, por lo que no se tiene acceso a recursos como contactos, sms, sistema de ficheros, etc.</li>
<li>Una anécdota que comentó es que dado que está tan orientado a juegos, aplicaciones profesionales al instalarlas aparecen en la carpeta de Juegos en algunos terminales.</li>
</ul>
</li>
</ul>
<p><strong>Symbian</strong></p>
<ul>
<li><strong>A favor:</strong>
<ul>
<li> Acceso completo a recursos (contactos, sms, ficheros)</li>
<li>25% más rápido que JME,</li>
<li>Buena documentación y soporte.</li>
</ul>
</li>
<li><strong>En contra:</strong>
<ul>
<li>Se programa en un C++ no estándar</li>
<li>Binarios incompatibles entre diferentes versiones del sistema operativo Symbian</li>
<li>El desarrollo del sistema operativo en sí está monopolizado por Nokia.</li>
</ul>
</li>
</ul>
<p><strong>Windows Mobile</strong></p>
<ul>
<li><strong>A favor</strong>:
<ul>
<li>También acceso completo a recursos (contactos, sms, ficheros)</li>
<li>Cada vez más extendido</li>
<li>Buena documentación.</li>
</ul>
</li>
<li><strong>En contra:</strong>
<ul>
<li>Fragmentación</li>
<li>No existen entornos de desarrollo gratuítos, hay que pasar por el Visual Studio o similar.</li>
</ul>
</li>
</ul>
<p><strong>Blackberry (RIM)<br />
</strong></p>
<ul>
<li><strong>A favor:</strong>
<ul>
<li>Muy extendido en entornos empresariales, ideal para aplicaciones de este sector</li>
<li>IDE gratuito</li>
<li>Acceso a recursos de sistema.</li>
</ul>
</li>
<li><strong>En contra:</strong>
<ul>
<li>También, al ser un dispositivo muy segmentado, no permite desarrollar aplicaciones más generalistas</li>
<li>JAVA pero con API a acceso a recursos y  propietaria.</li>
</ul>
</li>
</ul>
<p>Por otro lado, Miguel dió una versión personal del futuro del desarrollo para móviles. Los puntos que destacó fueron:</p>
<ul>
<li><strong>En los móviles no se navega por la web</strong>, entendiendo por navegar que se a partir de una información vayas navegando por los enlaces (al no estar preparadas todas las webs para móviles).</li>
<li> <strong>Los usuarios no quieren instalar aplicaciones</strong>, quieren usarlas. Al ser un proceso de descubrimiento de aplicaciones relativamente complicado, la mayor parte de los usuarios no instalan aplicaciones que no les vengan por defecto en este.</li>
<li><strong>Hay que atraer a los desarrolladores de la web 2.0,</strong> para ello se está implementando AJAX que permite que el interfaz web sea parecido al nativo así como los motores de Widgets. En el momento en el que haya posibilidad de realmente crear comunidades</li>
<li>Además, en un futuro se espera tener <strong>una conexión permanente a Internet</strong> (Sólo apuntar un pequeño detalle, y del que mucha gente no es consciente, pero una conexión 3G permanente se come la batería del terminal en pocas horas)</li>
</ul>
<p><strong>Otra charla</strong> interesante fue la de Francisco Javier Toribio en la que presentaba un análisis de lo que <a href="http://open.movilforum.com/node/385">supone la SDK desde el punto de vista estratégico</a>. En ella habló de cómo iba a afrontar Apple su estrategia con el iPhone.</p>
<p>Desde Apple se han dado cuenta de que <strong>un alto porcentaje de sus usuarios iPhone son pertenecen al segmento profesional</strong>, a pesar de que, inicialmente, el iPhone estuviera destinado al mercado residencial. Esto ha motivado que Apple se plantee un cambio de estrategia. Inicialmente tenía modelo sandbox basado en que las aplicaciones fueran Web 2.0, AJAX,  etc. Pronto rectificó y se ha dedicado a crear un SDK para desarrolladores de Aplicaciones, así como de servicios específicos para usuarios profesionales.</p>
<p>Por otro lado, Apple necesita crear un ecosistema de desarrolladores, para ello ofrece una <strong>SDK y un IDE gratuitos</strong> (todavía en beta). Este ide <strong>sólo está para los sistemas operativos de Mac</strong>, eso implica que no se puede desarrrolar usando Windows o GNU/Linux.  Este hecho puede ser un handicap en Europa donde no hay tanto equipo Mac como en EEUU.</p>
<p>Algo a reseñar, es que han hecho un importante esfuerzo en ofrecer <strong>una buena documentación</strong>, muy importante ya que el iPhone se programa en Objective C y, en Europa, no hay mucho desarrollador que ya utilice este lenguaje.</p>
<p>Y como ya hemos dicho, <strong>en Estados Unidos la penetración de los Mac es mayor que en Europa </strong>donde sí es cierto que cada vez se ven más Macs (¡increíble la cantidad de macs que vi en la barcamp2!), no obstante,  el necesitar equipos de Apple supone un <strong>esfuerzo en inversión de infraestructura para las empresas que quieran desarrollar para el iPhone</strong>.</p>
<p><strong>Apple ofrece el modelo de tienda única</strong>. Sólo desde Apple Store podrán distribuirse aplicaciones y Apple tendrá que certificar estas aplicaciones. Se asegurará así que las aplicaciones no son "malignas". Apple forzará a los desarrolladores a proporcionarle un 30%  del precio de cada venta (revenue sharing).  Además, el desarrollador tendrá que pagar 99$ para poder subir Applicaciones a Aple Store.  También decir que existe una versión de desarrollador orientado al sector empresarial de 399$. Este revenue sharing puede ser una barrera más de entrada.</p>
<p>Otro aspecto a tener en cuenta, es que el desarrollo de las aplicaciones está bastante limitado, <strong>iPhone presenta un entorno monotarea</strong> y en el que no puedes acceder a algunos recursos como SMS o llamadas ni a datos de otras aplicaciones (sólo puedes acceder a subdirectorios de la ruta a la aplicación).</p>
<p>Sin embargo, este modelo de <strong>tienda única supone para el usuario una forma sencilla de descubrimiento de aplicaciones</strong>, se asegura de que las aplicaciones están libres de software malicioso, gracias a la certificación por parte de apple. También puede suponer falta de competencia y, por tanto, precios más altos. Por otro lado, al tener unas APIs un tanto cerradas puede suponer que las aplicaciones no sean tan interesantes para los usuarios ya que no pueden integrarse totalmente en el terminal.</p>
<p>Siguiendo con la Barcamp, una iniciativa de Telefónica I+D que también fue presentada y que está recién salida del horno es el mobile manager (http://mobilemanager.movilforum.com), que ofrece conectividad de dispositivos 3G en plataformas GNU/Linux dando así la funcionalidad de gestionar conexiones. Es la base de bajo nivel que usará próximamente el Escritorio movistar para GNU/Linux.</p>
<p>Más cosas de las que se hablaron: <strong>Futuro de las APIs de Open Movilforum</strong>:</p>
<ul>
<li>Junio'08 Recepcción de Mensajes de un número particular en un correo electrónico</li>
<li>Septiembre 2008, API REST de Autolocalización con coordenadas UTM</li>
<li>Septiembre 2008, Videollamada</li>
<li>Diciembre 2008, Localización P2P</li>
<li>Diciembre 2008, Autenticación OpenId Móvil</li>
</ul>
<p>Y de los futuros eventos organizados por OpenMovilforum</p>
<ul>
<li>Junio 2008, Jornada técnica Web Run Time, Nokia</li>
<li>Junio 2008, 3er Concurso Mashups en movilidad.</li>
<li>Septiembre 2008, 3er Barcamp.</li>
<li>Octubre 20094º Concurso Mashups en movilidad</li>
<li>4º Barcamp: diciembre</li>
</ul>
<p>Toni Saltavella habló de <a href="http://www.festuc.com">Festuc</a>, aunque a esa charla no pude asistir. Viendo la página de Festuc, se observa que es una red social para gente que sale mucho de marcha. Puedes poner subir imágenes y poner tu perfil. Cuando sales de marcha puedes decir dónde estás y festuc decirte dónde están tus amigos, ligar, conocer gente nueva.</p>
<p>Y hasta aquí puedo leer.</p>

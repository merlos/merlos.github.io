---
layout: post
status: publish
published: true
title: Usando Google Desktop en red
wordpress_id: 12
wordpress_url: "/blog2/2006/11/25/usando-google-desktop-en-red/"
date: '2006-11-25 12:16:38 +0100'
date_gmt: '2006-11-25 10:16:38 +0100'
categories:
- blog-archive
- blog
tags: []
comments:
- id: 4
  author: natasab
  author_email: me@site.com
  author_url: http://www.merlos.org
  date: '2006-12-11 22:06:41 +0100'
  date_gmt: '2006-12-11 20:06:41 +0100'
  content: "Parece que no funciona lo de cambiar el registro con las versiones nuevas.
    \ Todavía me queda probar la utilidad DNKA\r\nSaludos. Juan"
- id: 5
  author: natasab
  author_email: me@site.com
  author_url: http://www.merlos.org
  date: '2006-12-29 13:02:02 +0100'
  date_gmt: '2006-12-29 11:02:02 +0100'
  content: "Noticia: Por lo menos en la versión Google Desktop:4.2006.1008.2039-es-pb
    ya trae la posibilidad de añadir la búsqueda en recursos de red. Está accesible
    en Preferencias de Desktop/Buscar en estas ubicaciones.\r\nLa versión analizada
    anteriormente no lo traía.\r\nSaludos. Juan."
---
<p>Google desktop es una herramienta que permite tener un pequeño google en nuestro ordenador. No obstante, sólo permite acceder desde el propio ordenador y, en principio, no permite acceder a unidades conectadas en red. No obstante, he encontrado un artículo en el que se explica <a href="http://www.geekzone.co.nz/content.asp?contentid=3939">cómo usar Google desktop como servidor de búsquedas en red</a>.<br />
En el artículo se comentan dos formas. La primera consiste en cómo saltarse la restricción de sólo buscar en discos duros locales y no poder hacerlo con unidades de red. Supongamos que tenemos dos particiones en nuestro disco duro (C: y D:) y una unidad de red (Z:).</p>
<p>Lo primero que tendremos que hacer es abrir el regedit e irnos a la clave</p>
<p><code>[HKEY_CURRENT_USER\Software\Google\Google Desktop\HistoricalCapture\Crawler]<br />
CRAWL_DIRS=<br />
CRAWL_FILE=DONE</code></p>
<p>Editamos CRAWL_DIRS. Para ello creamos un fichero de texto con el notepad con este contenido:</p>
<pre><samp>!C:{tab}!D:{tab}!Z:</samp></pre>
<p>donde {tab} es una pulsación de la tecla tabulador. Copiamos esa línea y la pegamos en CRAWL_DIRS. A continuación, dejamos vacía CRAWL_FILE. En teoría, la próxima vez que se actualize el índice de google se actualizará incluyendo el. Yo lo acabo e hacer, si funciona lo pondré aquí.</p>
<p>Otra utilidad que nos presenta el artículo es el uso de <a title="Página de DNKA" href="http://www.dnka.com/software/DNKA/24875.html">DNKA</a> un software <em>freeware</em> que hace de interfaz entre google destkop y la red. Google Desktop sólo abre el puerto 4664 en localhost. Este programa actúa como proxy redireccionando las peticiones de google desktop que lleguen por un interfaz de red a localhost. Tiene algunas opciones como autentificación,  allow/deny, logs...</p>

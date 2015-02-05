---
layout: post
status: publish
published: true
title: Cambio del Blog
wordpress_id: 7
wordpress_url: http://www.merlos.org/blog2/2006/08/19/cambio-del-blog/
date: '2006-08-19 02:20:30 +0200'
date_gmt: '2006-08-19 00:20:30 +0200'
categories:
- blog-archive
- blog
tags: []
comments:
- id: 3
  author: Natasab
  author_email: me@site.com
  author_url: http://www.merlos.org
  date: '2006-08-19 02:53:18 +0200'
  date_gmt: '2006-08-19 00:53:18 +0200'
  content: "Prueba de comentario. Acabo de instalar el plugin con el authentification
    code. De esta forma evitaré el spam con el que tuve problemas anteriormente.\r\n\r\nSaludos"
- id: 24
  author: Alvarodelcastillo
  author_email: strapalucio@hotmail.com
  author_url: http://www.alvarodelcastillo.com/blog
  date: '2008-06-17 17:18:25 +0200'
  date_gmt: '2008-06-17 15:18:25 +0200'
  content: "Hola,\r\nYo llevo unos años con SPHSBlog y de momento estoy encantado,
    aunque echo en falta la barra que comentas, sobret todo por la justificación centrada
    a la hora de colgar imágenes, y lo del mod_rewrite, aunque menos.\r\n\r\nNo me
    paso a Wordpress, porque son muchos artículos ya escritos y me da pena que se
    queden en el olvido. ¿Hay alguna manera de pasarlo, o tendría que realojarlos
    en otra localización y empezar el nuevo blog desde cero?\r\n¿Estás contento con
    el cambio a wordpress?\r\n\r\n\r\nGracias."
---
<p>Hasta hoy el blog que he estado usando es <a href="http://sphpblog.sourceforge.net">Simple PHP Blog</a>, y aunque era muy fácil de usar había algunas opciones que me interesaba disponer. La primera, no disponía de soporte <a href="http://httpd.apache.org/docs/1.3/mod/mod_rewrite.html">mod_rewrite</a>. Este módulo de apache permite traducir los argumentos de la query string de forma que las URL queden más inteligibles. Así por ejemplo, en lugar de tener una dirección en el blog que sea <samp>entry.php?date=20060825&category=1&id=132</samp> se podría tener una entrada del tipo <samp>/2006/08/25/NombreCategoría/Titulo_de_la_entrada.html</samp>, con esto se consiguen unas url más inteligibles para el ser humano y también, para google! Otra cosa que no me gustaba mucho del SPHPblog es que no usaba un sistema de templates bien definido, tenía mezclado el código con la presentación, con lo cual era complicado personalizar el interfaz de usuario. En el interfaz del administrador sí disponía de una serie de opciones, pero bueno, no llegaban a convencerme.</p>
<p>El <a href="http://www.wordpress.org">Wordpress</a> sí que dispone de las dos características antes citadas y algo que también me gusta es el editor de mensajes tiene la típica barra de negrita, cursiva, justificación, etc. típica de los editores de texto, por contra, por defecto, parece que el SPHPBlog dispone de más soporte de distintos tipos de <a href="http://es.wikipedia.org/wiki/RSS">RSS <span style="font-style: italic">feeds</span></a>. Aunque he visto los blogs de otros usuarios empleando Wordpress y supongo  que es cuestión de instalar algún que otro <a title="Página de Plug-ins de wordpress" style="font-style: italic" href="http://wp-plugins.net/">plug-in</a>.</p>
<p>Por último, destacar que mientras el SPHPblog utiliza bases de datos textuales para almacenar los mensajes y el Wordpress utiliza MySQL.</p>

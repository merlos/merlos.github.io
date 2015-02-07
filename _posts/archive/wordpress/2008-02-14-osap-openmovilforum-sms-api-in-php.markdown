---
layout: post
status: publish
published: true
title: OSAP - OpenMovilforum SMS API in PHP
wordpress_id: 27
wordpress_url: http://www.merlos.org/blog2/2008/02/14/osap-openmovilforum-sms-api-in-php/
date: '2008-02-14 00:25:44 +0100'
date_gmt: '2008-02-13 22:25:44 +0100'
categories:
- blog-archive
- desarrollo
tags: []
comments:
- id: 10
  author: GaBuBu
  author_email: gabilondo@blogsmedia.com
  author_url: http://cssmania.com
  date: '2008-03-06 15:35:37 +0100'
  date_gmt: '2008-03-06 13:35:37 +0100'
  content: Sin duda, para mi, de las mejores cosas cuando lo liberen de lo que va
    a pasar este año 2008.
- id: 20
  author: Alejandra Franco
  author_email: ale29jun@hotmail.com
  author_url: ''
  date: '2008-05-15 17:56:03 +0200'
  date_gmt: '2008-05-15 15:56:03 +0200'
  content: hola soy estudiante de ingenieria en sistemas estoy realizando una aplicacion
    en la cual necesito enviar mensajes de alerta desde la computadora hacia un telefono
    celular, no se como hacerlo si tu me pudieras ayudar te lo agradeceria
- id: 42
  author: gu
  author_email: mgduran@gmail.com
  author_url: http://www.lehmbergconsultores.es
  date: '2009-05-06 17:57:20 +0200'
  date_gmt: '2009-05-06 15:57:20 +0200'
  content: "Para enviar mensajes con movistar no hace falta tanta parafernalia, con
    la extension cURL de PHP va de perlas:\r\n\r\n$TLF = \"6000000000\"; // Telefono
    del abonado\r\n$PWD = \"miclave\"; // Contraseña del abonado\r\n\r\n$str = array(\"
    \", \"-\", \",\", \".\", \"\\n\", \"\\t\");\r\n// limpiar telefonos\r\n$tlf =
    str_replace($str, \"\", $_POST['tlf']);\r\n\r\n$opciones = array\r\n\t(\r\n\tCURLOPT_POST\t\t\t=&gt;\t1,\r\n\tCURLOPT_URL\t\t\t\t=&gt;\t\"https://opensms.movistar.es/aplicacionpost/loginEnvio.jsp\",\r\n\tCURLOPT_POSTFIELDS\t\t=&gt;\t\"TM_LOGIN=$TLF&amp;TM_PASSWORD=$PWD&amp;TM_ACTION=AUTHENTICATE&amp;to=$tlf&amp;message=$msg\",\r\n\tCURLOPT_SSL_VERIFYHOST\t=&gt;\t0,\r\n
    \   CURLOPT_SSL_VERIFYPEER\t=&gt;\tfalse,\r\n\tCURLOPT_RETURNTRANSFER\t=&gt;\t1\r\n\t);\r\n\r\n$U
    = curl_init();\r\ncurl_setopt_array($U, $opciones);\r\necho curl_exec($U);\r\n$rs
    = curl_getinfo($U);\r\ncurl_close($U);\r\n\r\n\r\nSin embargo publico aqui esto
    porque me ha venido muy bien la documentación de OSAP, al que he llegado por este
    blog.\r\n\r\nGracias y saludos"
---
<p><strong><a href="http://code.google.com/p/osap/">OSAP</a></strong> es un proyecto LGPL que publiqué hace unos días en <strong>Code Google</strong>. OSAP es mi primera incursión en el uso de las APIs de <a title="Web de Open Movilforum" href="http://open.movilforum.com">Open.Movilforum</a>.</p>
<p>Open Movilforum es una iniciativa de <a href="http://www.telefonica.es">Telefónica Móviles de España</a> en la que están abriendo algunos de sus servicios para que desarrolladores independientes puedan crear aplicaciones usando los servicios de Movistar.</p>
<p>OSAP es la implementación de <strong>envío y recepción de mensajes</strong> utilizando estos servicios de Movistar. OSAP implementa el gateway de envío y recepción de mensajes de movistar para la extensión <a href="http://pear.php.net">PEAR</a> <a href="http://www.pear.php.net/package/Net_SMS">Net_SMS</a> que fue hecha por la gente del proyecto <a href="http://www.horde.org/">The Horde</a>.</p>

<p>Actualmente, el proyecto está publicado de forma autónoma, no obstante, ya me puse en contacto con los creadores del paquete Net_SMS por si estaban interesados en incluir el gateway de envío y recepción de mensajes de Movistar.</p>
<p>En breve espero publicar un servicio, muy sencillo y novedoso que hace uso de esta API.</p>

---
layout: post
status: publish
published: true
title: Videotutorial SQL Injection
wordpress_id: 5
wordpress_url: http://www.merlos.org/blog2/2006/08/19/videotutorial-sql-injection/
date: '2006-07-27 01:54:06 +0200'
date_gmt: '2006-07-26 23:54:06 +0200'
categories:
- blog-archive
- hacking
tags: []
comments: []
---
<p>Hoy he vuelto a encontrar una interesante reseña en la página <a target="_blank" href="http://www.diariolinux.com/">DiarioLinux</a>. Un enlace a un <a target="_blank" href="http://0-day.x128.net/simple-sql-injection.html">Videotutorial de Simple SQL Injection</a>.</p>
<p>Las aplicaciones web suelen hacer consultas a bases de datos SQL en función de los argumentos introducidos por el usuario a través de un formulario. Cuando estos argumentos no son comprobados de forma correcta se puede introducir código malicioso a través de dicho formulario.</p>
<p>En el caso del videotutorial, básicamente, el autor se da cuenta de que faq_id no tiene ningún tipo de comprobación y lo que hace es en un script PHP que solicita la página web en cuestión, añadir en el argumento faq_id un JOIN de la tabla de usuarios (une la tabla de usuarios con la tabla faqs), más adelante lo que hace es filtrar para que sólo le aparezcan los nombres de usuario y contraseña.</p>
<p>Al  <a target="_blank" href="http://yapig.sourceforge.net/">Yapig</a>, un programa hecho por mí, también le sacaron un exploit hace tiempo, aunque no era del tipo inyección de SQL puesto que yapig no usa SQL. Xploit Rulz :D</p>

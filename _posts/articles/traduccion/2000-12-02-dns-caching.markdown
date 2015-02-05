---
layout: post
post_id: xxxxx
lang: es
title: "(traducción) DNS Caching: Aumenta la velocidad de Internet"
description: "Mejora la velocidad de tu conexión a Internet haciendo caché de nombres. (Para GNU/Linux)"
keywords: “blacksun, bsrf, gomorrah, dns caching”
comments: false
categories: 
  - traduccion
---


# Aumenta la velocidad de tu conexión de internet bajo Linux y Windows (Configurando el DNS caching) 

- Last update: 3-12-1999 by GoMoRRaH
- traducción: 2-12-2000 by natasab

-------------------------------------------------------------------------------------
Acerca de la traducción: Tras la lectura del tutorial en castellano recomiendo la lectura de éste en Inglés ya que es posible que en la traducción se haya perdido algún matiz o yo haya metido la pata din darme cuanta. Si encuentras algún error de traducción mándame un mail a natasab34@mail.ru pero si lo que tienes es alguna duda para eso está el tablón de mensajes (message board) de blacksun.box.sk
Más tutoriales en castellano http://blacksun.box.sk
-------------------------------------------------------------------------------------
 
GoMoRRaH is a member of Black Sun Research Facility (BSRF). 
Más tutoriales de temas como hacking, cracking, phreaking, Unix, Windows and Windows NT, redes, hardware and overclocking, programación, HTML y más en
http://blacksun.box.sk 

www.xxxxx.com usado como ejemplo, obviamente es un sitio que no existe.

## 1.- Teoría Pura y Dura

###1.1 Introducción

Internet camina bajo una contínua evolución, PCs más rápidos, conexiónes más eficaces etc... pero la mayor evolución se ha producido en la capacidad de las líneas, como RDSI o los cable-modem. Desafortunadamente, todavía hay gente que como yo tiene una vulgar línea telefónica, que es leeeeeenta. Por ello, la gente ha comenzado a agudizar su ingenio para mejorar su conexión con herramientas como los "donwnload-managers" (Administradores para bajar archivos), programas que bajan las páginas en los momentos de no ocupación,etc.

Como podrás ver todo este software o es para Windows o manda a la mierda tu hardware.
Lo que comento a continuación es para Linux y es tan fácil que hasta un usuario de Windows lo podría hacer.
También hay una explicación de cómo se podría hacer lo mismo bajo windows.

### 1.2 Quién debería estar leyendo este documento,requerimientos

Cualquiera que quiera aumentar la velocidad de su conexión directa (modem) y lo quieren hacer en 5 minutos (si no en menos).

Antes de preguntar nada, por favor, asegúrate de haber leido al menos los tutoriales básicos de redes de blacksun.box.sk. Si todavía te quedan dudas relacionadas con este turorial, por favor, asegúrate de haber leido al menos algunos de los tutoriales básicos de redes de blacksun.box.sk .También, por favor, no mandes directamente un email a los miembros de BSRF, usa el Tablón de mensajes (message board) de blacksun.box.sk.

La información de como hacer lo mismo bajo Windows puedes encontrarla al final del tutorial.

Requerimientos

- Ordenador
- Conexión telefónica de Internet
- Linux
- Named instalado (*)
- Algo de cambio para mi (*Sonrisa*)
- (*)Named es un nameserver package (paquete con un servidor de nombres), es un paquete estándar y no debería dar ningún problema a la hora de instalarlo.

### 1.3 Que hace un nameserver (servidor de nombres)?
Qué Hace? Bueno, pues supón que te has conectado con tu ISP y que quieres entrar en www.xxxxx.com. Abres el navegador y escribes la URL en el cuadro de diálogo correspondiente, luego pulsas intro y esperas hasta que xxxxx aparece.
Simple no? Veamos que es lo que realmente sucede:

1. Tu ordenador pide conectarse a www.xxxxx.com, pero que es www.xxxxx.com? Pues es un alias de un ordenador que tiene una IP y un demonio httpd corriendo (en el puerto 80).

2. Tu ordenador comprueba que ese sitio no esté siendo ejecutado en tu propio ordenador o en tu red local, para ello comprueba /etc/hosts (que contiene la información de tu intranet local o comprueba que no haya un nameserver local (como estás leyendo esto supongo que no tienes (todavía) instalado un servidor de nombres, por lo que no será este el caso). Ahh! Este es una buena oportunidad para mecionar que DNS son las siglas de Domain Name Server (+ o - Servidor de los nombres de dominios).

3. De hecho, tu pc no comprueba que www.xxxxx.com esté en tu red local sino si puede encotrar la ip de www.xxxxx.com en la red local. (Es posible que hayas oido decir que internet está basada completamente en TCP/IP).

4. A continucación se comprueba el archivo /etc/resolv.conf, que debería parecerse a:
    
        nameserver 123.123.123.123 

5. Éste es el servidor de nombres de tu ISP. Cuando una IP no es encontrada  en tu red local el ordenador le pregunta a este servidor. (si éste no está disponible, obtendrás un error).

6. Si el servidor de nombres está disponible, responderá con ina IP. Si el este servidor no tiene la IP en su base de datos, preguntará a otros servidores de nombres hasta que alguno la tengo. Al final consigues la IP!
	
7. Una vez que la IP es conocida (supongamos que es 123.123.123.111) se intentará establecer una conexión a 123.123.123.111:80 mediante el procedimiento estándar de routing, esto puede ser visto tecleando route en una ventana de root).

Ya tenemos establecida la conexión, por lo que los archivos comenzarán a ser enviados mediante el protocolo http. Por tanto, como hemos visto el servidor de nombres lo único que hace es traducir www.xxxxx.com en una IP mirando en las propias bases de datos de IP del propio ordenador o de otros ordenadores.


## 1.4 Eso suena muy bien!! Ahora qué?

Bueno, supón que los 7 pasos anteriores te han llevado unos 2 segundos sólo si tienes una conexión rápida, el servidor de nombres de tu ISP no tiene apenas tráfico y la IP requerida estaba en su memoria caché. Por lo que parece una utopia lo de que te lleve 2 segundos, en los tiempos que corren tarda algo más de tiempo. En este tutorial haremos lo que se llama un "caching only nameserver" (traducido algo así como un servidor de que sólo recoge nombres, suena mejor en inglés ¿no?) 

##1.5 Qué es un caching only nameserver?

Es un 'tipo' especial de seridor de nombres. Éste no tiene por objeto ser el servidor de nombres de tu intranet, lo único que hace es almacenar los nombres y las ip que son requeridas dentro de la red local. La primera vez que es necesaria una IP, esta será buscada en la base de datos del servidor de nombres de tu ISP, pero la siguiente vez no hará falta porque estará en tu disco duro por lo que no consumirás ancho de banda y tendrás el site unos segundos antes lo que hará más confortable tu navegación ;-) .Ahora, a lo mejor dices: Pero que coño, por sólo 2 unos segundos? Pero si te pones a pensar, cuantas veces miras tu correo-e?(Una vez cada 10 minutos por defecto en el netscape) Con qué frecuencia vas a un buscador?

Aquí acaba la teoría, ya deberías ser capaz de entender lo que hace un caching only nameserver y cómo éste aumenta la velocidad de tu conexión en unos pocos segundos. 

## 2.- A la mierda la maldita teoría. Déjame teclear algo!

### 2.1 namded.conf

Lo primero es editar el archivo de configuración del servidor de nombres más general que se encuentra en /etc/named.conf y que tiene que tener una pinta así:

    options {
            directory "/var/named";
            /* más basurilla */
    };
    ....

Esta primera parte es la que necesita cambios. Para hacerlos necesitas saber el número IP del servidor de nombres de tu ISP, y cambiar el archivo a:

    options {
            directory "/var/named";
            forwarders {
                    123.123.123.123;
                    123.123.123.124;
                    };
    };
    ....

Simplemente le has dicho a tu ordenador donde tiene que buscar si la IP solicitada no está en su base de datos. Si el primer servidorno está disponible lo intentará en el segundo.

### 2.2 Cambiando el servidor de nombres

Ya tienes tu servidor configurado y ejecutándose, pero te falta un pequeño detalle con el que tienes que tener cuidado, y es que de tu ordenador sigue utilizando el servidor de nombres de tu ISP y no el tuyo propio. Tienes que editar `/etc/resolv.conf` y dejarlo de forma parecida a:

    # nameserver 321.321.321.321
    nameserver 127.0.0.1


La primera linea es el servidor de nombres original, sólo añade la marca de comentario y luego añade nameserver 127.0.0.1, que lo único que le dice es que utilice tu servidor de nombres local.

### 2.3 Configurado y funcionando

Bien, ahor reinicializa tu servidor de nombres con `killall -HUP named` y comprueba tus log (`/var/log/messages`) que debería ser como:

    Nov 20 13:29:34 SaTaN named[692]: starting.  named 8.2.1 Fri Sep 24 14:52:24 EDT 1999 ^Iroot@porky.devel.redhat.com:/usr/src/bs/BUILD/bind-8.2.1/src/bin/named
    Nov 20 13:29:34 SaTaN named[692]: hint zone "" (IN) loaded (serial 0)
    Nov 20 13:29:34 SaTaN named[692]: Zone "0.0.127.in-addr.arpa" (file named.local): No default TTL set using SOA minimum instead
    Nov 20 13:29:34 SaTaN named[692]: master zone "0.0.127.in-addr.arpa" (IN) loaded (serial 1997022700)
    Nov 20 13:29:34 SaTaN named[692]: listening on [127.0.0.1].53 (lo)
    Nov 20 13:29:34 SaTaN named[692]: listening on [10.0.0.1].53 (eth0)
    Nov 20 13:29:34 SaTaN named[692]: Forwarding source address is [0.0.0.0].1025
    Nov 20 13:29:34 SaTaN named: named startup succeeded
    Nov 20 13:29:34 SaTaN named[693]: Ready to answer queries.
    Nov 20 13:29:34 SaTaN named[693]: sysquery: sendto([123.123.123.123].53): Network is unreachable


Si la última linea es como la mia no te preocupes, lo único que quiere decir es que no estás conectado a Internet. Cuando obtienes algunos errores quiere decir que has metido la gamba al editar los archivos de configuración y tienes que comprobarlos (Sugerencia: comprueba que están todos los ; y que cada { está cerrada con otra })

### 2.4 No me crees?

Esto va para todos aquellos que no me crean...

    [root@SaTaN /] nslookup www.iwanttoquerythis.com
    Server: localhost
    Address: 127.0.0.1

    Name: www.iwanttoquerythis.com
    Address: 123.123.123.321 ... other ip's ..
    Aliases: If available ...

Esta es la primera vez que solicitas una dirección, como ves ha habido una petición al servidor de nombres que especificaste en el archivo de configuración. 

    [root@SaTaN /] nslookup www.iwanttoquerythis.com
    Server: localhost
    Address: 127.0.0.1

    NON-AUTHORITIVE ANSWER
    Name: www.iwanttoquerythis.com
    Address: 123.123.123.321
    Aliases: ...

Bien... sale `NON-AUTHORITIVE ANSWER`. ¿Qué significa eso? Pues, sólo dice que no hubo que hacer ninguna petición otro servidor externo...;-)

### 2.5 Otra forma de hacer esto

También puedes apañartelas para hacerte tu propia base de datos de nombres. Simplemente tienes que añadir lineas al archivo /etc/hosts con la siguiente sintaxis:

    Direccion-IP hostname #comentario 

Ejemplo: 

    1.2.3.4 www.some-website.com #just another stupid website 
 
El comentario no es obligatorio ponerlo (por si se te pasaba po la cabeza..) La única pega de este método es que lo tienes que hacer a mano...ouch!

### 2.6 Una Caché DNS local bajo windows!

Hola, usuarios del pobre Windows. Quieres tener una cache de DNS local? Un poco Chungo, la única forma de hacer esto es la descrita en el apartado 2.5, pero usando el archivo c:\windows\hosts (no lo confundas con hosts.sam que es un ejemplo de c:\windows\hosts. hosts tiene la misma función que /etc/hosts). Si no quieres hacer esto manualmente puedes intentar buscar un programa que se llama FastNet, que escanéa Favoritos y el Historial de tu navegador y lo añade a tu base de datos, además te dejará introducir líneas de forma manual.


### 3 FIN

3.1 Outro
	
Deberías ser capar de ponerte tu propio servidor de nombres. Que otra cosa puedo decir, ahh, que si quieres saber algo más sobre ello puedes mandar un mail a GoMoRRaH. Este archivo fue escrito par BackSun Research Facility

GoMoRRaH WiLL RiSe aGaiN 
¡¡¡ Traducido por natasab !!!

	

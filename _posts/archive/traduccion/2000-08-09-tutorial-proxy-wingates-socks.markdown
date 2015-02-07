---
layout: post
post_id: proxyes
lang: es
title: "(traducción) Tutorial de Proxy/Wingates y SOCKS"
description: "Traducción al castellano del tutorial de proxy/wingate y socks de Jatt de blacksun.box.sk"
keywords: "proxy, servidor, wingate, icq"
comments: false
categories: 
  - traduccion
---

# Proxy/WinGate/SOCKS Tutorial
By Jatt

Traducido al Castellano por NaTaSaB

## ¿Qué es un servidor proxy?

Pues es un servidor que alguien (un ISP o un amigo) tiene conectado, de forma que cuando te conectas a un website (utilizando este servidor), en lugar de ir directamente al servidor de ese website, irá primero al servidor proxy y de ahí al website, y al mismo tiempo que tu recibes la página el proxy la almacena en su base de datos. Así, si alguien va a una página que alguien ya ha visitado, es el proxy quien te la "sirve" directamente y no el servidor del website. Cabe decir que las páginas son actualizadas cada cierto tiempo, de establecer este tiempo se encarga el administrador del proxy.

### ¿Por qué usar un Servidor Proxy?

Bueno, hay diferentes razones. Algunos ISP (Internet Service Providers) lo utilizan por que así reducen de una  forma sustancial el tráfico que circula por su red, aumentando así a su vez la velocidad de sus usuarios (puesto que el servidor proxy está más cerca (o se supone más cerca) que el del servidor del site, las págimas viajan menos por la red, menos retardo y  por tanto más velocidad navegando). Los usuarios lo prefieren poeque les ayuda a hacer más difícil ser rastreados. Esto es especialmente util desde que los usuarios pueden encadenar varios proxies, de hecho puede haber 3 o más encadenados. Sin embargo, es algo dificil encontrar 3 servidores que te permitan esto por una razón, la velocidad de la conexión será notablemente más lenta, sobre todo si están en distintos continentes. Otra razón, si te conectas a un servidor grande, tu velocidad se verá incrementeda. 

Nota: Es una buena idea saber de quien es el servidor al que te conectas porque por ejemplo si es de Microsoft, todo lo que hagas será guardado en un LOG, pero si es anoónimo o ed uno que dice que cualquiera puede usarlo, ves a por él. Para encontrar esta información, lo mejor es que vayas a la web del servidor proxy.

### ¿Qué es un Wingate?

Una versión oficial que he oido de unas pocas personas es:

"Wingate es un programa cortafuegos servidor proxy que te permite compartir una o más conexiones a internet dentro de una red local. La conexión a internet puede ser casi de cualcquier tipo incluyendo la conexión directa por modem,RDSI,xDSL, cable modem, conexión via satelite, o los circuitos T1.

Wingate es similar a un servidor proxy, conecta los ordenadores por el puerto 23 a un servidor, que es llamado wingate(de hecho es sólo una conexión por telnet), éste permite el acceso a un ordenador conectado a la máquina wingate acceder a internet a través de él. Pero dada la penosa configuración de algunos wingates y a la incompetencia de algunos administradores, hay una gran cantidad de wingates que te permiten conectarte a internet a través de ellos, dejando libre el camino para el IPspoofing en el ICQ o el IRC. Estos wingates son llamados "wingates abiertos" y normalmente permanecen así hasta que el administrador lo descubre o recibe quejas de acerca usuarios "misteriosos", aunque para que esto suceda pueden pasar varios meses o varios días ;-(

El único beneficio para el admisistrador es la capacidad que el wingate le da es el poder utilizar una misma conexión para varios usuarios, aunque los problemas que éste puede acarrear superan claramente las ventajas. Si alguien instala un wingate le recomendaría que supiera en cada momento que es lo que está haciendo  y de que lo está configurado de una forma segura y ningún intruso hará mal uso de éste. 
Nota: Un programa similar al Wingate y más seguro es el Sygate

Por experiexcia propia con Wingates, como Administrador de Redes y usuario "remoto", puedo decir que los logs de la mayoría de los wingates son borrados cada 48 horas ya que la mayoría de los ISP (sobretodo los grandes) no tienen o los recursos o la necesidad de guardar cualquier "cosilla" que ocurre en sus servidores wingate.

### ¿Cómo encuentro Wingates?

Buena pregunta, lo mejor forma es usar un escaner de wingates, puedes scaner subredes completas buscando wingates. Nota: la mayotía de las IPs del medio oeste, Africa y en las redes caseras tienen una cosa en común: Tienen wingates pobremente configurados, así que ya sebas primero prueba escaneando estas IPs. En Unix lo mejor es utilizar el método de prueba y error. Haz un telnet al wingate por el puerto 23, deja el nombre y clave de ususario en blanco y si entras has encontrado uno. También puedes poner nombre y/o password: wingate.  El mejor escaner de windows (32bit) es el wGateScan v2.2 disponible en varias web. Yo lo saqué de www.hotmanscave.com

Para usarlo tienes que introducir un rango de direcciones IP o un hostname, y el hará un telnet a cada host en el rango en el puerto 23 y enviará mensaje de diciendo "wingate" o algo parecido, si el host acepta este mensaje, BINGO! Has encontrado uno que será guardado en una lista de wingates abiertos.

### Wingates con ICQ

En la máquina wingate:

1. Ve a la pantalla de Wingate setup y haz click en la Pestaña de Proxies.
2. Pulsa ADD
3. En Type of proxy: 'Mapped Link'
4. Pulsa Create
5. Bajo el Setting Group comprueba 'Enable Connections To Proxy On Port.' y pon en número 3333 . 
6. Pon The Socket Type to: 'UDP' 
7. Asegúrate de que  'Destroy Inactive Sessions after XXX seconds' No se comprueba (not checked)
8. Asegúrate de que  'Enable Default Remote Host' se comprueba y que: icq.mirabilis.com Port: 4000 
9. Para cada Máquina remota:
    1. Pulsa Add.
    2. En 'Connect Client IP' introduce la IP de cada ordenador remoto 
    3. En 'To Host' introduce icq.mirabilis.com 
    4. En 'Port' introduce 4000 
    5. Presiona OK
    6. Ahora pulsa DONE. 
    7. Estarás ahora en la ventana principal WinGate setup . 
    8. Asegúrate de que hay activado un SOCKS4 Proxy con el puerto 1080 
    9. Pulsa SAVE
    10. Compruebalo en la máquina remota.

Configuración de la Máquina remota:

1. Si todavía no pasaste el ICQ Reistration Wizard:
2. At the Registration Wizard under Connection Type register as a LAN User. 
3. Escoge 'I am behind a firewall or proxy.' 
4. Click Next. 
5. Escoge Socks4 o socks 5 (depende del servidor proxy) 
6. NO marques Firewall sessions time out 
7. click Next
8. Introduce la  IP del servidor usando socks port 1080. 
9. Click Next para ver so todo a ido bien. 
10. Si algo falla en un cuadro de diálogo te lo dirán. 

Prueba entonces lo siguiente: 

1. Click Retry para probar otra vez. 
2. Dale al botón Back para cambiar la configuración del firewall. 
3. Click Cancel para abortar. Reconfigura los settings del firewall y prueba otra vez ejecutando el ICQ.exe. 

Máquinas remotas adicionales:

Sigue el mismo procedimiento especificado en Máquinas remotas. 

### Wingates con IRC

Para configurar tu cliente irc para usar wingates simplemente dile que estás tras un Soks4 o un socks5 (otra vez dependiendo del wingate. Prueba los dos y mira cual de ellos funciona) e introduce la ip del wingate. Deja en blanco los huecos de user y password (si te son requeridos). Desde que hay tal cantidad de clientes IRC no los explicaré más y te dejaré que explores por ti mismo. 

### ¿Qué es un Sock Host?

Un sock Host es practicamente lo mismo que un wingate excepto que se conecta por el puerto 1080. En la configuración del servidor proxy en el navegador puedes darte cuenta que hay un recuadro para el socks host (simplemente hay que poner la IP de la máquina wingate). Si has usado el mIRC para el IRC también lo habrás visto en la configuración del firewall (para configurarlo sigue las intrucciónes del wingates con IRC). No todos los wingates funcionan como sock host, y los daemons del irc sólo te permiten conectarte a través de este puerto, además los nuevos daemons del IRC pueden detectar una conexión wingate/socks. COn la web no es tan útil ya que no siempre puedes esconder tu IP dependedel tipo de website al que te conectas. Lo mejor para anonimicidad en la web es conectarse por miltiples proxy.


Nota Final:

Socks/Wingates y Proxies pueden identificar tu identida o hacer más dificil tus actividades por internet, e incluso siendo esto legal en el 90% de los casao, pero no creas que no puedes ser trazado y qeu nunca serás cogido por ir a través de varios servidores Proxy, wingates o socks hosts, recuerda que puedes ser trazado por las ips de éstos hasta llegas a la tuya, y esto no resulta realmente dificil para cualquier agencia de inteligencia que tan sólo necesita un pequeña colaboración de los administradores y los ISP.


-----------------------------------------------------
That's it for the Socks Host/Proxy Server and Wingate Tutorial. Questions or Comments should be forwarded to uslijatt@hotmail.com

Jatt

Traducido al Castellano por natasab :  jmmerlos @ merlos .org

For more info on Proxies and a big list of Proxy servers, wingates, telnet, ftp, and socks hosts try: http://proxys4all.cgi.net/

-note: not all are tested and some might have been shutdown by their administrators. Also the lists are not updated as often as most people would like.
Another Wingate proxy tutorial:  http://www.wingate.net/
ICQ with wingate:  http://www.visions.demon.nl/wingate/ 
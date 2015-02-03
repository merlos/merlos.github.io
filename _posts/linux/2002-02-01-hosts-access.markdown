---
layout: post
post_id: hosts-access
lang: es
title: "linux: uso de /etc/hosts.allow y /etc/hosts.deny"
description: "Estos ficheros sirven para permitir o denegar el acceso a los servicios de un sistema"
keywords: "hosts, allow, deny, linux, gnu, debian, tutorial"
comments: false
categories: 
  - linux
---



## /etc/hosts.allow y /etc/hosts.deny


Estos ficheros sirven para permitir o denegar el acceso a los servicios de un sistema. En hosts.allow tendremos las reglas de los hosts que tienen acceso a nuestro PC y en hosts.deny aquellos que lo tienen prohibido. Estos ficheros son gestionados por el tcpd. El funcionamiento es el siguiente, cuando algún usuario intenta conectarse remotamente a algún servicio gestionado por el inetd, este llama a tcpd para ver si el host del que proviene la petición tiene acceso libre o por el contrario no. Una línea de estos ficheros consta de:

      servicio: lista_de_hosts [: shell_command]
      #comentario

 Tanto los comentarios como los comandos shell son opcionales.

 Lista de hosts son los nombres separados por comas y/o espacios. Además se pueden usar los siguientes comodines:

 + Una cadena que comience por "." significará que todos los hosts cuyo nombre coincida con lo q va a continuación será aceptado, "matches" esa regla. Ejemplo:
	  
        .libres.retevision.com
 
 + Una cadena que acabe en punto significará que el host que comience por esa cadena será aceptado por esa regla. Ejemplo
    
        wendolin.
        # wendolin.cbs.net y wendolin.pikachu.com son hosts aceptados.

 + También se puede usar con direcciones IP Ejemplo
	  
        192.168. 
        # 192.168.x.x serán aceptados
 + Otra forma de indicar hosts es mediante la forma red/máscara (n.n.n.n/m.m.m.m) Ejemplo:

	     192.168.0.0/255.255.255.0
	      #abarcará el rango 192.168.0.0 a 192.168.0.255

 + Ver la página "man 5 hosts_access" para dominios NIS

Hay algunos comodines para hosts:

    ALL: todos los hosts
    LOCAL: hosts que pertenecen al dominio local
    UNKNOWN: Hosts que no han sido resueltos por DNS
    KNOWN: Hosts que han sido resueltos por DNS
    PARANOID: Hosts cuyos nombres no coninciden con sus IPs, el tcpd cancela la conexion.

Ejemplos:

    in.telenetd in.ftpd : subdomain.isp.net .ttd.es 
    # Si está en host.deny, no permitiríamos el acceso a los servicios FTP
    # y telnet a los host con dominio subdomain.isp.net y a ninguno con
    # ttd.es

Si queremos dar todos los servicios a los hosts locales en host.allow pondríamos la siguiente línea

    ALL: LOCAL  

También podemos utilizar la palabra reservada EXCEPT. Si ponemos la siguente línea en host.deny

    in.telnetd: ALL EXCEPT .ttd.es .uni2.es .retevision.es
    # Permitiríamos acceso a telnet a todos los host excepto aquellos que 
    # se conectaran con terra, uni2 o retevision

En cuanto al uso de comandos shell, a estos se les pueden pasar argumentos con información sobre el host que está intentando acceder. Para ello se utilizan las expansiones `%<letra>`. Esta es la información que aparece en el man:

       %a (%A)
              The client (server) host address.
       %c     Client information: user@host, user@address, a host
              name,  or  just  an  address, depending on how much
              information is available.
       %d     The daemon process name (argv[0] value).
       %h (%H)
              The client (server) host name or  address,  if  the
              host name is unavailable.
       %n (%N)
              The  client  (server)  host  name  (or "unknown" or
              "paranoid").
       %p     The daemon process id.
       %s     Server information: daemon@host, daemon@address, or
	      just  a daemon name, depending on how much informa-
              tion is available.
       %u     The client user name (or "unknown").
       %%     Expands to a single `%' character.

       Characters in % expansions that may confuse the shell  are
       replaced by underscores.


 En cuanto a auditar las acciones tomadas por el tcpd, este está comunicado con el syslogd, por lo que los mensajes estarán en `/var/log/syslog` (comprueba el path en `/etc/syslog.conf`)

Hay dos interesantes herramientas que hay que probar para asegurarnos de que las reglas que hemos impuesto están bien descritas. Una de ellas es `tcpdchk`, que se encarga de comprobar que los ficheros de configuración tengan una sintaxis correcta y la otra es `tcpdmatch` que sirve para comprobar que sucedería en caso de que llegara una petición a un servicio solicitado por una cierta IP


Related man Pages: tcpd, tcpdchk, hosts_access(5), hosts_options



## IPCHAINS


 IPCHAINS es el firewall de linux, a diferencia de otros sistemas operativos las IPchains están en el propio kernel, hay que compilarlo con esta opción activada (Ver los HOW-TOs). Este firewall es un filtro de paquetes y se filtra en función del origen, destino y puerto. Hay tres cadenas:

	INPUT: Filtra paquetes que vienen
	OUTPUT: Filtra paquetes que van
	FORWARD: Filtra paquetes que se van a redirigir (ipmasqueade)
	USER DEFINED: Reglas definidas por el usuario

Las Acciones que se pueden tomar para cada paquete son:

+ ACCEPT: El paquete es aceptado y sigue su camino
+ DENY: El paquete es tirado (no hay respuesta
+ REJECT: El paquete es rechazado (hay respuesta)
+ MASQ: Sólo se puede usar con CONFIG_IP_MASQUERADE y para las cadenas FORWARD y USER DEFINED
+ REDIRECT: Sólo se puede usar en USER_DEFINED y con la opcion del Kernel CONFIG_IP_TRANSPARENT_PROXY. Estos paquetes serán redirigidos a un socket local
+ RETURN: RETURN is matched, then the next rule in the previous (calling) chain is examined.  If  the  end  of  a builtin  chain  is  reached,  or a rule in a builtin chain with target RETURN is matched, the target specified by the chain policy determines the fate of the packet.

COMANDOS:

    -A --append Añade una regla al final de la cadena
    -D --delete Borra una o varias reglas de una cadena (especificadas con un numero)
    -R --replace Reemplaza una regla
    -I --insert Añade una regla en la posición indicada
    -L --list Muestra por pantalla la lista de las reglas existentes
    -F --flush Borra todas las reglas existentes en una cadena
    -N --new-chain Crea una cadena nueva con el nombre dado
    -X --delete-chain Borra la cadena con el nombre dado (sólo user_defined chains)
    -P --policy
    -M --masquerading
    -S --set tcp tcpfin udp Establece el timeout de los tres argumentos:
	    TCP  sessions  
	    TCP  sessions after receiving a FIN packet
      UDP packets
    -C --check Sirve para comprobar una cadena.
    -h --help Muestra por pantalla un resumen de los argumentos.
    -V --version Muestra la version

PARAMETROS DE LAS REGLAS

 * -p --protocol[!] (tcp, udp, icmp o all(all tomada por defecto) [Ver /etc/protocols]).El ! (opcional) indica excepto ejemplo -p !tcp

 * -s --source --src [!]addres[/mask] [!][port[:port]] donde address es la dirección q puede ser o una ip o el nombre del host. La máscara es opcional,e indica el número de unos q hay empezando por la izda. El ! indica negacion, es decir, todas menos las direcciones especificadas. Port puede ser tanto el nombre del servicio (/etc/services), el número de puerto, numero de tipo ICMP o uno de los nombres de tipos mostrados por el comando 'ipchains -h icmp'. Para especificar un rango de puertos se usa el formato puerto:puerto. Si el primero es omitido se toma 0. y si el segundo es omitido se toma 65535. El uso de puertos sólo es valido con el uso de la opcion -p. No se permite el uso de la opción de puerto si se activa -f (fragment)

 * -d,--destination, --dst [!] address[/mask] [!] [port[:port]]  La sintaxis es similar a la de -s, pero esta vez refiriendonos al destino.

 * -j, --jump target  Se utiliza para especificar un salto a otra regla si el paquete "matches" esta regla.  (El contador de esta regla será incrementado)

 *  -i, --interface [!] name   Con esta opción especificamos el interfaz al que se le aplica la regla. Si el nombre del interfaz acaba en +, significará que afecta a cualquier interfaz que comience con este nombre

 * [!] -f,--fragment Con este flag activado, la regla sólo tendrá efecto sobre fragmentos de paquetes.

OTRAS OPCIONES

 * -b, --bidirectional Modo bidireccional, esto implica que la regla se aplicara de la misma forma si permutamos origen con destino
 * -v --verbose   Muestra por pantalla información acerca de la regla (IPs,contadores...)
 * -n, --numeric Salida los números IPs y número de puertos (por defecto la salida son nombres de host y nombres de servicios)
 * -l, --log  Activa el "logueo" del kernel (cuando se cumple la regla se hace una llamada a printk() )
 * -x, --exact  Muestra el valor exacto de los contadores de paqueete y byte. Solo es util con la opcion -L
 * [!] -y, --syn Todo paquete TCP que tenga el campo SYN activado matches esta regla. El campo SYN se utiliza para iniciar una conexión, es decir, si algún host quiere establecer una conexión con el tuyo tiene que mandar un paquete con el campo SYN a true. También se utiliza para confirmar la conexión, enviando un paquete con SYN y ACK activados.
 * --line-numbers Cuando se listan las reglas, añadir el número de regla.
 * --no-warnings Desactivar todos los avisos


Related MAN Pages: ipchains, ipfw, iptables


## CONSEJOS PARA LOS ADMINISTRADORES


*  Sé paranoico con la seguridad. Aunque pueda parecer enfermizo, ya lo dice la sabiduría popular,  más vale prevenir que curar. Una buena filosofía de administración, en mi opinión, es imaginar que los usuarios que acceden a tu sistema tienen grandes conocimientos sobre redes/programación/administración/unix/hacking, incluso más que tú y que están deseosos de conseguir permisos de root, para putearte, conseguir informacón privilegiada para putearte, intentar sabotear los proyectos de I+D para putearte o conseguir que te echen de la empresa para putearte. Si eres el único que accede a tu PC, si te conectas a inet piensa que hay ciertos individuos que van a intentar acceder a tu máquina para putearte. En fin, que si no quieres ser puteado, protegete xDDDDDDDDD

 *  Cancela aquellos servicios que no utilices, de esa forma evitarás que puedan explotar alguna debilidad por mala configuración o que utilicen algun bug.

 * Aquellos servicios que utilices, restríngelos todo lo que puedas y estáte atento a los Bugs que puedan aparecer y actualiza/parchea los demonios.

 * Aprende Shell-Scripting y hazte tus propios scripts de administración o busca herramientas para administradores.

 * Échale un ojo a los logs de vez en cuando


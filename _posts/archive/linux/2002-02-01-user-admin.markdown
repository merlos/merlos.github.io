---
layout: post
post_id: user-admin
lang: es
title: "Usuarios: Administración de usuarios y permisos en GNU/Linux"
description: "Texto sobre la administración de usuarios y permisos en GNU/Linux"
keywords: "admin, user, linux, administración, usuarios, gnu, linux, slackware"
comments: false
categories: 
  - linux
---


##ADMINISTRACIÓN DE USUARIOS


## .::Creando usuarios::.

El comando para añadir usuarios es `useradd`. En mi distribución la (Slackware) hay un pequeño script de shell interactivo que solicita la información para añadir usuarios y que se encuentra en `/usr/sbin/adduser`, no sé si estará disponible en otras distribuciones, para encontrarlo y comprobar q es un scipt utiliza los siguiente:

	root@natrix:/# whereis adduser
	adduser: /usr/sbin/adduser
	root@natrix:/# head -c 10 /usr/sbin/adduser
	#!/bin/sh
	root@natrix:/# 


##.::Cambiando la información de los usuarios con chfn::.

    chfn - change user name and information. 
    
    SYNOPSIS:
       chfn [-f full_name] [-r room_no]
            [-w work_ph] [-h home_ph] [-o other] [user]

Si se introduce solo chfn se nos preguntará interactivamente el nombre, habitación, teléfono del trabajo y teléfono de casa. La opción -o sólo la puede ejecutar el root y un usuario sólo puede cambiar la información sobre si mismo y sólo la que le permita la definición en login.defs de las entradas siguientes:

    	CHFN_AUTH               yes  
     	#
    	# Which fields may be changed by regular users using chfn - use
    	# any combination of letters "frwh" (full name, room number, work
    	# phone, home phone).  If not defined, no changes are allowed.
    	# For backward compatibility, "yes" = "rwh" and "no" = "frwh".
    	#
    CHFN_RESTRICT           frwh
    	Como dice en la información en inglés si quieres que no pueda cambiar nada añade el símbolo de comentario '#' a la línea de CHFN_RESTRICT
    	Los cambios realizados con este comando modifican el contenido de el fichero /etc/passwd



##.::PERMISOS::.


###CHMOD

En Unix el sistema de ficheros además de incluir información como localización, tamaño, fecha, hora... incluye unos datos referentes a los permisos de  quien pue modificación del archivo, lectura,  ejecución, acceder a un directorio...que es lo que se llaman permisos

Para controloar estos permisos se utiliza el comando CHMOD.

Para Listar permisos

    ls -l

que lista algo parecido a:

    -rwxr-xr-x   1 root     root      4028562 Feb  4 20:22 fpc-10~1.rpm   
       ^^^
       |||
      Permisos

    
Formato permisos:

    Tipo archivo	Permisos Usuario  Permisos Grupo  Permisos Resto
         -               rwx		rwx           rwx


Tipos de archivos :
d directorio
l enlace simbólico (puntero a otro archivo)
s socket de dominio
b archivo bloque
c archivo especial de caracter
p archivo pipe
- archivo nomal, ninguno de los otros

Permisos: 
r lectura (Read) 
w escritura (Write)
x ejecución (eXecution)

En directorios:
r = permiso de listar los archivos del directorio
w = puedes creay y borrar archivos del directorio
x = permiso de acceso al directorio (puedes hacer un cd)

donde aparezca un `-` no se tiene el permiso correspondieente.

Sintaxis: 
    
      chmod UGO archivo1 archivo2 ...

donde aparece U hay que poner un número entre 0 y 7, y lo mismo con G y O.

* U: indica los permisos que se le quieres dar al ususario dueño del archivo
* G: Permisos que se le quiere dar al Grupo del usuario
* O: Permisos que se les quiere dar al resto de los usuarios del sistema

Entonces, para sabar que número hay que poner hay que hacer una simple suma de:

    r=4
    w=2   <- Tabla de valores
    x=1

    U= r + w + x 
    G= r + w + x
    O= r + w + x

Si quiero dar un permiso sustituyo el valor correspondiente a ese permiso y si no quiero darlo entonces pongo un cero en lugar del valor de la tabla de Valores
ejemplo: tenemos un archivo de texto llamado 'ejemplo'

El Usuario quiero que tenga lectura escritura y NO ejecución
    
    U = 4 + 2 + 0 = 6

Los miembros de mi grupo  quiero que puedan  leer el archivo pero no modificarlo
    
    G= 4 + 0 + 0 = 4
Y el resto de usuarios del sistema, quiero que no puedan acceder al archivo

    O= 0 + 0 + 0 = 0

Por tanto el comando que introduciré será:

    chmod 640 ejemplo

Para ver el resultado tecleo: 

    ls -l
    
obteniendo:

    -rw-r-----   1 root     root            0 Feb 16 11:10 ejemplo    

recordemos que el formato es:

* -   tipo de archivo (normal)
* rw- permisos del usuario (activados los permisos de lectura y escritura)
* r-- permisos del grupo (activado el de lectura 
* --- permiso del resto de usuarios del sistema


OPCIONES DE GNU
  
       -c, --changes
              Muestra un mensaje mencionando  solamente  aquellos
              ficheros cuyos permisos cambian realmente.

       -f, --silent, --quiet
              No  muestra  mensajes de error sobre ficheros cuyos
              permisos no se pueden cambiar.

       -v, --verbose
              Describe la acción efectuada o no para
              cada fichero.

       -R, --recursive
              Cambia recursivamente los permisos de directorios y
              sus contenidos.

Ejemplo:

    chmod -R 666 /home/user/*

Con esto daré permisos de lectura y escritura a todos los archivos y directorios contenidos a partir de user.

#### Cambio de SUID y GUID:

Esto es para que durante la ejecución de un programa el usuario que lo ejecutatenga los permisos del dueño del archivo, o del grupo del dueño.
Al la sintaxis de chmod se añade un número : SUGO
    suid=4
    guid=2

Ayuda adicional en el  man chmod 
                                   

### CHOWN y CHGRP

Cambio de dueño de un archivo (change owner) y cambio de grupo de un archivo

Sintaxis:

    chown [opciones] usuario[:grupo] fichero...  

lo que aparece con [] es opcional

- usuario  es el nuevo poseedor del archivo
- fichero : fichero al que se le quiere cambiar el usuario dueño

Sintaxis
  
    chgrp [opciones] grupo fichero...    


ID
----------
Conocer cierta informacion de un usuario como

- UID (user identifier)
- GID (group identifier)

Grupos a los que pertenece

Sintaxis:

    id   [-gnruG]   [--group] [--name] [--real] [--user]  [--groups] [--help] [--version] [username] 

OPCIONES:

       -g, --group
              Imprime sólo el ID de grupo.

       -G, --groups
              Imprime sólo los grupo suplementarios.

       --help Imprime un mensaje de uso en la salida  estándar  y
              termina correctamente.

       -n, --name
              Imprime  el  nombre de usuario o grupo en lugar del
              número ID.  Requiere -u, -g, o -G.

       -r, --real
              Imprime el ID real de usuario o grupo en lugar  del
              efectivo.  Requiere -u, -g, o -G.

       -u, --user
              Imprime sólo el ID del usuario.

       --version
              Imprime  información  sobre la versión en la salida
              estándar y termina correctamente.                


### UMASK

Para cambiar los permisos iniciales cuando se crea un archivo o directorio. Es decir establece los permisos por defecto para archivos nuevos.
Este comando suele estar en

    /etc/profile >> Para todos los usuarios del sistema
    .profile     >> Para tu usuario en tu directorio HOME
    .bash_profile >> "  " " " " " " " " " " " " " " " 
    (Ver también en login.defs)

Sintaxis:
    
      umask UGO

donde UGO es lo mismo que con chmod

Funcionamiento de umask: umask lo que hace es una resta de permisos, es decir, con umask decimos que permisos queremos que no tenga un archivo nuevo. Veamos esto:

Para directorios
Partimos de un directorio con todos los permisos (777) y le restamos el valor de umask. Haciendo esta operación obtendremos los permisos de los directorios.
Ejemplo : 
    
    umask 077
    777 -  077 = 700 

Con los archivos partiremos de 666 es decir sólo activados los permisos de lectura y escritura. Ejemplo: 
      
    umask 022
    666 - 022 = 644

Si fuera umask 077

    666 - 077 = 600

Si fuera umask 333
    666-333 = 444 

Esto es porque estamos quirando con 333 los permisos de escritura y ejecución (w y x) y no el de lectura. Como el de ejecución está desactivado no hace nada con este permiso, simplemente lo deja desactivado. Esto es debido a que lo que realmente se está haciendo es una operacion a nivel de bits, concretamente un NAND

    {
    Tabla de verdad  NAND a nivel de bits
    x y NAND(x,y)
    1 1 	0         
    0 1 	1         
    1 0 	1
    0 0 	1
    }

Por tanto, con umask 077 tendríamos que al crear un directrio tendría todos los permisos para el usuario y ninguno para el grupo y resto (700) además tendríamoslos permisos de lectura y escritura para los archivos nuevos (600). Con el ejemplo de umask 022 tendríamos 755 para directorios y 644 para los 


.:: LOS ATRIBUTOS::.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 En esta sección analizaremos los comandos lsattr y chattr, pero antes expliquemos cuales son los atributos y como verlos. Para verlos utilizaremos el comando 'lsattr' (posteriormente explicaremos la sintaxis completa):

         The letters `ASacdijsu' select the new attributes for  the
         files:  don't  update  atime (A), synchronous updates (S),
         append only (a), compressed (c), no  dump  (d),  immutable
         (i),  data  journalling  (j),  secure  deletion  (s),  and
         undeletable (u).

Veamos esto con un ejemplo.

    bash-2.05# ls prueba -la
    -rw-------    1 root     root           32 Sep 25 13:54 prueba
    bash-2.05# lsattr prueba
    ------------- prueba

* A -> Un fichero que lo tiene activado no actualiza el campo atime al 
    ser modificado, esto sirve para ahorrar energía en los portátiles al no tener que hacer tantos accesos Entrada/Salida (I/O)
  
* a ->  Si está activado sólo se puede añadir información a este fichero.Es decir, si se quiere escribir algo sólo se podrá con fopen("file","a");Sólo el superusuario puede modificar estos atributos. 
  
* c -> Si tiene activo este bit, entonces el kernel se encarga de almacenar comprimido este fichero
  
* d -> A file with the `d' attribute set  is  not  candidate  for
       backup when the dump(8) program is run. (no se para muy bien para que sirve, además probé:
  	   
         bash-2.05# man 8 dump
         No entry for dump in section 8 of the manual
  

* i -> Atributo que sólo el superuser puede modificar. Si está activo, no se puede modificar, borrar, renombrar o crear un enlace al fichero. 

* j ->A file with the `j' attribute has all of its data  written
         to  the  ext3  journal  before  being  written to the file
         itself,  if   the   filesystem   is   mounted   with   the
         "data=ordered"  or  "data=writeback"  options.   When  the
         filesystem is mounted with  the  "data=journalled"  option
         all file data is already journalled and this attribute has
         no effect.
  
* s -> el fichero q tenga este atributo, cuando sea borrado se pondrán ceros en el espacio del disco duro que ocupaba. Esto sirve para que se pueda re recuperar información de un fichero borrado.
  
* S -> When  a  file  with the `S' attribute set is modified, the
       changes are written synchronously on  the  disk;  this  is
       equivalent  to the `sync' mount option applied to a subset
       of the files.

* u -> Cuando un fichero con este atributo es borrado, se permite la recuperación de su contenido.
  
###.::lsattr::.

Lista los atributos.

Sintaxis:
  
    lsattr [ -RVadv ] [ files...  ] 

	-R opción de recursividad, lista los atributos de los archivos de los subdirectorios
	-V muestra la versión
	-a lista todos los ficheros (incluidos los que comienzan por .)
	-d muestra los directorios
	-v muestra el número de la versión/generación del fichero

Si alguna vez intentas listar los atributos de un fichero que no se encuentra en un sistema de ficheros ext2 saldrá un mensaje como el siguiente:
   
    lsattr: Inappropriate ioctl for device While reading flags on ./admin.notes   

o también:

    lsattr: Invalid argument While reading flags on public_html    

En estos casos ambos eran enlaces simbólicos a ficheros o directorios que se encontraban en particiones windows (vfat)

### .::chattr::.

Sirve para cambiar los attributos de las particiones ext2 (si no sabes cuales de tus particiones son de este tipo teclea lo siguiente 'mount' y si no tienes permisos para ejecutar el mount usa el comando 'cat /etc/fstab/', también puedes añadir '|grep ext2')

Sintáxis del chgrp :

    chattr [ -RV ] [ -v version ] [ mode ] files...   

      -R modo recursivo
      -V mostrar versión
      -v version establace el numero de la version/generación del fichero.
    
      el modo:  +-=[ASacdisu]
        + -> Activa el modo
        - -> desactiva el modo
        = -> Pone únicamente los modos q see indican aquí    

Ejemplos de utilización:

    	bash-2.05# chattr +AaS prueba
    	bash-2.05# lsattr
    	--S-a-A------ ./prueba
    	bash-2.05# chattr +ac prueba
    	bash-2.05# lsattr
    	--S-a-Ac----- ./prueba
    	bash-2.05# chattr =a prueba
    	bash-2.05# lsattr prueba
    	----a-------- prueba
    	bash-2.05#
    	bash-2.05# chattr  -a prueba
    	bash-2.05# lsattr
    	------------- ./prueba
    	bash-2.05#



### .:: LOS GRUPOS y El fichero /etc/group::.

Este fichero sirve para definir las pertenencias de los usuarios a los grupos. Los grupos son una potente arma de administración ya que junto con los permisos dan al administrador del sistema una gran versatilidad al control de recursos, programas y seguridad.

#### Formato de /etc/group
El fichero está compuesto por líneas que siguen este esquema:

		group_name:passwd:GID:userlist

donde: 	group_name: es el nombre del grupo

*	passwd:     es la clave encriptada del grupo.
*	GID:        es el número identificador de grupo.
*	userlist    es una lista de usuarios separados por comas.

Ejemplo:

    root::0:root,admin,natasab
    users::100:natasab,nixon,moon
    familiares::96:elperro,papa,mama,tia,tio,abuelo,abuela
    amigos::69:tute,lopez,toni,miki,pepon,tarso

¿Qué se gana con esto? El que haya grupos es muy interesante para separar los recursos a los que pueden acceder los usuarios. Por ejemplo, imagina que tienes varias cuentas en tu ordenador, una de familiares y otras para los colegas que entran a través del ssh. Tienes ciertos ficheros con fotografías, recetas, archivos de contabilidad etc.. que se encuentran en el directorio /home/familia  que quieres que sean accesibles para tus familiares, pero no para tus amigos, a su vez también tienes otros ficheros con fotos 'warras', recetas alcohólicas, hacking, etc... en /home/amigos que te interesa que sea únicamente accesible a tus colegas. Una forma muy sencilla de organizar esto, teniendo en cuenta el fichero /etc/group que puse como ejemplo ponemos estos comandos como root en un shell:

    # cd /home
    # chgrp familiares familia
    # chgrp amigos amigos
    # chmod 770 familia
    # chmod 750 amigos

Lo que hemos hecho es cambiar el grupo (con chgrp) de los directorios familia y amigos. La llamada a chgrp es del tipo:

	  chgrp nombre_grupo fichero1 fichero2 ...

Luego, hemos cambiado los permisos de esos directorios, activando sólo los permisos del propietario y grupo, dejando desactivados los permisos del resto de usuarios, por lo que nadie podré entrar.

Esto que he hecho con dos directorios también se puede hacer con otros recursos como sistemas de ficheros u otro tipo de dispositivos como la tarjeta de sonido.
Un caso curioso es la tarjeta de sonido, si al hacer un 'ls -la /dev/dsp' ves que tiene permisos 666 por ejemplo, entonces cualquier usuario puede activar el sonido, incluso usuarios remotos. Imagínate que uno de tus amigos ha hecho login por el telnet, y pone en la línea de comandos:

    $ amp /home/amigos/mp3/South_Park_-_Eres_un_Cabron.mp3 &

Lo que sucedería es que comenzarías a escuchar ese mp3, por eso te recomiendo que des permisos a ciertos dispositivos con 660 (por suerte, viene así por defecto y en el grupo sys, así que añade al grupo sys aquellos usuarios que quieras que tengan acceso al DSP de la tarjeta de sonido.)


Related MAN PAGES: group, newgrp, id, chmod, chgrp


### .::EL Comando SU (Switch User)::.

Este comando sirve para hacer login como otro usuario sin necesidad de salir de la sesión con el usuario actual.Por ejemplo, supongamos que estamos en el un ordenador de la oficina, y hemos entrado con nuestro login, llega un compañero y nos quiere enseñar un mensaje de un cluente que ha recibido en su cuenta de correo, entonces en lugar de salir de las X, cerrando nuestra la sesión actual, abrimos una consola y tecleamos 'su nombre_compañero' entonces nos pedira el pass y tachan, hemos hecho login como nuestro compañero, ahora podemos ver el mensaje de este cliente abriendo cualquier gestor de correo en modo texto como por ejemplo el pine o mail.
	
Lo más usual suele ser que entremos como un usuario normal, pero a veces queremos cambiar algo en la configuración, entonces si tecleamos en un terminal 'su' podremos hacer login como root.

Las opciones de su son las siguentes:

    root@natrix:~# su --help
    GNU bash, version 2.05.0(1)-release-(i386-slackware-linux-gnu)
    Usage:  /bin/bash [GNU long option] [option] ...
          /bin/bash [GNU long option] [option] script-file ...
    GNU long options:
          --debug 
          --dump-po-strings
          --dump-strings
          --help
          --init-file
          --login
          --noediting
          --noprofile  >> No carga el fichero .profile
          --norc       >> NO carga el fichero rc (.bashrc, por ejemplo) 
          --posix
          --rcfile     >> Selecciona el fichero rc
          --restricted
          --verbose    
          --version    
          --wordexp
    Shell options:
          -irsD or -c command             (invocation only)
          -abefhkmnptuvxBCHP or -o option
    Type `/bin/bash -c "help set"' for more information about shell options.
    Type `/bin/bash -c help' for more information about shell builtin commands.
    Use the `bashbug' command to report bugs.
    root@natrix:~#

Nota: En el man no se explica cada opción.
De todas formas lo más interesante del su cara al administrador es el fichero /etc/suauth, ya que en este se define que usuarios pueden hacer su y a que usuarios. Veamos cual es el formato de cada línea de este fichero: 
 	to-id:from-id:ACTION     

to-id: es la lista de usuarios "destino" a los que se le aplicará la regla, es decir, cuando el comando tecleado es 'su to-id'. Esta lista estará compuesta o por una serie de usuarios separados por comas o por las palabras ALL o ALL EXCEPT user1,user2... (lista de usuarios separados por comas)).

form-id: es otra lista de usuarios. En este caso, indica a quienes permite hacer 'su to-id'. Las palabras clave que se pueden usar son las mismas de antes (ALL,ALL EXCEPT) más GROUP group1,group2.. (lista de grupos, los nombres de grupo tienen que tener una entrada en /etc/group).También es válida la opción ALL EXCEPT GROUP.

ACTION: Indica una de las siguientes acciones:

DENY: El comando su es terminado antes de solicitar el password

NOPASS: No solicita password.

OWNPASS: Solicita el password del usuario actual (del usuario que tecleó su)

ejemplos:
      
      #Si queremos que nadie pueda acceda a la cuenta de root:
      root:ALL:DENY
      #Si queremos que natasab pueda hacer su admin y le pida su propia clave
      admin:natasab:OWNPASS
      #Si queremos que cualquier usuario del grupo admin pueda hacer 'su root'
      # sin solicitarle password
      root:GROUP admin,adm:NOPASS

Notas: 	

  * No pongas espacios entre las comas de las listas.
	* Las reglas se aplicarán de forma secuencial,es decir,las 
	  que se encuentren al principio tienen preferencia sobre 
	  las que se encuentren al final del fichero
	* Las líneas que comiencen con # serán ignoradas al 
	  ser consideradas comentarios.
	* El comando su espera un fichero con sintaxis correcta.Si no es así
	  pueden darse resultados no esperados. Si se detecta algún error
	  será enviado al syslogd con nivel ERR y utilidad AUTH. Los logs de
	  error por sitaxis erronea se encuentran en /var/log/syslog.
	* Si en /etc/login.defs está definido el parámetro
		SU_WHEEL_ONLY	yes
	  Como yes, entonces sólo los usuarios que pertenezcan 
	  al grupo del root (gid 0 *) y en /etc/suauth tenemos root:ALL:NOPASS
	  Sólo se permitirá a los usuarios del grupo root hacer 'su root'
	  y no les pedirá password, al resto les saldrá un error de 
	  autorización.
	* Para ver los movimientos hechos con su: /var/log/sulog, 
	  también puedes encontrar logs en /var/log/messages
	

Related Man Pages: su,suauth

###.:: HASH ::.

Comando que puede resultar interesante para shell_scripting

    hash: usage: hash [-r] [-p pathname] [name ...]   

Muestra una lista de comandos utilizados en la sesión y el número de veces que se ha ejecutado ese comando. Es un comando interno del bash, y no tiene páginas man (man 3 hash es de la funcion de C).

La opción -r borra el log.

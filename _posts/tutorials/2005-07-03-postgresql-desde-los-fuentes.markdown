---
layout: post
post_id: postgres
lang: es
title: "Instalación de PostgreSQL desde los fuentes"
description: "Guía para instalar PostgreSQL desde elos fuentes en un sistema GNU/Linux"
comments: false
categories: 
  - mapserver
---


# Instalación de PostgreSQL

Este documento es otra instalación de

[http://www.agiles.org/index.php?module=subjects&func=printpage&pageid=33&scope=page](http://www.agiles.org/index.php?module=subjects&func=printpage&pageid=33&scope=page)


1. Bajar los fuentes de [www.postgresql.org](http://www.postgresql.org)
2. y descomprimirlos
    
        # tar -xzvf postgresql-version.tar.gz
   
3. Ejecutar los siguientes comandos:

        
         LDFLAGS=-lstdc++  #(para posteriormente  poder usar la librería GEOS)
         ./configure
         gmake
         su
         gmake install
         adduser postgres
         mkdir /usr/local/pgsql/data
         chown postgres /usr/local/pgsql/data
         cd /var/log
         mkdir postgresql
         chown postgres postgresql
         chgrp postres postgresql
         su - postgres
         /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
         ...
         Success. You can now start the database server using:
         ...
  
         /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l /var/log/postgresql/logfile start
 

4. Hacer que el servidor prostgresql se ejecute al arrancar.
    4.1 Vamos al directorio donde desempaquetamos los fuentes
      
	     # cd /tmp/postgresql-version/
	   
    4.2 Entramos en el subdirectorio `contrib/start-scripts`

        # cd contrib/start-scripts

    4.3 Editamos el fichero linux.
    Sólo tendremos que modificar la variable `PGLOG`, dado que hemos creado el fichero de log en `/var/log/postgresql/logfile`

    4.4 Copiamos el fichero linux al directorio /etc/init.d con el nombre
       postgresql y le damos permisos de ejecución
           
           # cp linux /etc/init.d/postgresql 
           # cd /etc/init.d/
           # chmod 755 postgresql 
     
    4.5 Vemos cual es el runlevel que se ejecuta en nuestro ordenador al encenderlo:

         # cat /etc/inittab | grep initdefault
        id:2:initdefault:
         #
    En nuestro caso, como vemos es el 2.
    
    4.6 Añadimos un enlace simbólico en `/etc/rc2.d/` al fichero postgresql
        
        # cd  /etc/rc2.d/
        # ln -s /etc/init.d/  S93postgresql
   
5. Permitiendo que escuche en un puerto TCP/IP 

    5.1 Editar `/usr/local/pgsql/data/postgresql.conf`
    
    5.2 Descomentar la línea `#tcpip_socket = false` y poner este valor a `true`.
    
        tcpip_socket = true
       

__Nota:__ Para que root no tenga que poner todo el path editar .barshrc y añadir

    export PATH=/usr/local/pgsql/bin:$PATH
    export MANPATH=/usr/local/pgsql/man:$MANPATH

Otra opción, si queremos que todos los usuarios tengan acceso en el path
a este directorio es editar el fichero `/etc/login.defs` y añadir a la
variable `ENV_PATH` el directorio `/usr/local/pgsql/bin/`



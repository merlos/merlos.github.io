---
layout: post
post_id: postgis
lang: es
title: "Instalación de PostGIS sobre PostgreSQL"
description: "Guía para instalar las extensiones para sistemas GIS de PostgreSQL desde elos fuentes en un sistema GNU/Linux"
comments: false
categories: 
  - mapserver
---


#Instalando PostGIS

Una vez configurado el servidor de bases de datos PostgreSQL procederemos a
la instalación de las extensiones para sistemas GIS, esto es, postgis.

### Prerrequisitos

Hacen falta dos librerías: geos y proj4

#### Instalación de GEOS (equivalente en C++ al JTS de Java)

1. Descargar  [http://trac.osgeo.org/geos/](http://trac.osgeo.org/geos/)
2. Descomprimir y compilar:
        
        # tar -xzvf geos-1.0.0.tar.gz
	      # cd geos-1.0.0
	      # ./configure
	      # ./make
	      # ./make install
	  
#### Instalación de proj4
  
1. Descargamos el fichero de fuentes fuente de [http://www.remotesensing.org/proj/](http://www.remotesensing.org/proj/)
2. Ejecutamos 
	  
        # tar -zxvf proj-version.tar.gz
	      # cd proj-version
	      # ./configure
	      # make
	      # make install
	  
 
## Ahora sí, Postgis

1. Lo descargarmos de http://postgis.refractions.net/

2. Descomprimir

3. Copiar al directorio `contrib/postgis/`  dentro del cual hemos descomprimido el postgresql. Si por ejemplo, descomprimimos el postgreslq en `/tmp/postgresql-version, lo copiaríamos a `/tmp/postgresql-version/contrib/postgis``

4. Editamos el Makefile del ditectorio postgis para que acepte las opciones que queramos.
          
         # Configuration Directives
         #---------------------------------------------------------------
         # Set USE_PROJ to 1 for Proj4 reprojection support
         #
         #
         USE_PROJ=1
         ifeq (${PROJ_DIR},)
                 PROJ_DIR=/usr/local/
         endif
	     
         #---------------------------------------------------------------
         # Set USE_GEOS to 1 for GEOS spatial predicate and operator
         # support
         #
         USE_GEOS=1
         ifeq (${GEOS_DIR},)
                 GEOS_DIR=/usr/local/
         endif
		     
		     
  
5.  Ejecutamos dentro del directorio postgis
         
         # ./make
         # ./make install



Enlace a PostGIS docs:  [http://postgis.refractions.net/docs/x83.html](http://postgis.refractions.net/docs/x83.html)


## Configuración
Una vez instalado lo siguiente que hay que hacer es configurar una base de
datos en la que podamos introducir referencias geoespaciales.

Primero nos identificamos como usuario `postgres` y luego añadimos una nueva
base de datos: 

    # su postgres
    $ export PATH=/usr/local/pgsql/bin/:$PATH
    $ createdb merlos_gis --encoding=latin1

Probamos que podemos acceder (escribir \q para salir)

    $ psql merlos_gis
      Welcome to psql 7.3.4, the PostgreSQL interactive terminal.

     Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help on internal slash commands
       \g or terminate with semicolon to execute query
       \q to quit

      merlos_gis=# \q

Le indicamos que vamos a usar el lenguaje PL PGSql, que es requerido por 
Postgis.

     $ createlang plpgsql merlos_gis

Ahora nos movemos al directorio `/usr/local/pgsql/share/contrib/postgis` donde
hay dos ficheros SQL que nos servirán para crear dos tablas necesarias para
una base de datos con georererencias. Los ficheros son `postgis.sql`  y 
`spatial_ref_sys.sql`.

     $ psql -d merlos_gis -f postgis.sql
     $ psql -d merlos_gis -f spatial_ref_sys.sql


__NOTA__: En este paso tuve un pequeño problema. Resulta que al ejecutar el primer
comando obtenía el siguiente error:

    psql:postgis.sql:38: NOTICE:  ProcedureCreate: type histogram2d is not yet
    defined
    psql:postgis.sql:38: ERROR:  Load of file
    /usr/local/pgsql/lib/libpostgis.so.0.8 failed: libgeos.so.1: cannot open
    shared object file: No such file or directory

Es decir, no encontraba la librería `libgeos.so.1`, que se encuentra en
`/usr/local/lib`. Para solucionar esto lo único que hice fue enlazar tanto esa
biblioteca como la `libproj.so.0` mediante los siguientes enlaces:

     # cd /usr/local/pgsql/lib
     # ln -s ../../lib/libgeos.so.1
     # ln -s ../../lib/libproj.so.0
--    

### Usando PostGIS

Tenemos dos comandos incluidos con PostGID: `shp2pgsql` y `pgsql2shp`
Estos convierten un fichero de Shapefile a sentencias PostgreSQL y viceversa. Por ejemplo, para incluir un fichero a nuestra base de datos:

     $shp2pgsql fichero.shp nombre_tabla merlos_gis > fichero.sql
     $psql -U postgres -d merlos_gis -f fichero.sql


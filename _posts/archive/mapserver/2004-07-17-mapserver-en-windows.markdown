---
layout: post
post_id: mapserver
lang: es
title: "Instalación de Mapserver 4.2 en Windows"
description: "Instalación de Mapserver 4.2 en Windows"
keywords: "mapserver, php, debian, apache, dso"
comments: false
categories: 
  - mapserver
---



# Mapserver en Windows a partir de Paquetes binarios 

17/Julio/2004 
Autor: Juan Manuel Merlos

Es conveniente leer los ficheros README donde aparecen instrucciones
más precisas sobre lo que hay que hacer.

Hay que descargar los siguientes paquetes:

## MapServer Binaries
Output support includes GIF, PDF, SWF, and all output formats supported by
GDAL and GD; input support includes many OGR supported vector formats
(including GML, PostgreSQL and ODBC), GDAL raster files (including ECW,
HDF4, and JPEG2000 images), PostGIS geospatial databases; also includes
truetype fonts and on-the-fly projection support.

[http://mapserver.gis.umn.edu/win32binaries.html](http://mapserver.gis.umn.edu/win32binaries.html)

Instalación: Descomprimir. Copiar las 9 DLL que vienen comprimidas  en 
C:\Windows\System32. Copiar php_mapscript_42.dll en el directorio extensions
de php (hay que modificar el fichero php.ini)

## PHP 4.3.7 CGI

[http://es2.php.net/get/php-4.3.7-Win32.zip/from/a/mirror](http://es2.php.net/get/php-4.3.7-Win32.zip/from/a/mirror)

Instalación: 

  1. Descomprimir. 
  2. Necesita configurar el Apache para que lo use ¿Cómo? (Por documentar)
  3. Copiar el fichero `php.ini-dist` a `c:\windows\php.ini` y editar la directiva extensions_dir para que apunte al directorio correcto.

## PostGreSQL 7.5 con PostGIS/GEOS/PROJ 4.4.8
[http://www.webbased.co.uk/mca/](http://www.webbased.co.uk/mca/)

Instalación: 

1. Descomprimir en `C:\pgsql75win` (el path se puede ver en pgstart.bat)
2. Hay que sustituir el fichero `libpq.dll` que copiamos procedente del paquete `libpq.dll (65KB)` en `c:\windows\system32`  por el que tiene el mismo nombre y que  viene en el subdirectorio `C:\pgsql75win\lib (129KB)`. Es decir, copiar el fichero pqsql.dll de 129KB a c:\windows\system32
3. Editar el fichero `initdb.bat`, de forma que quede la siguiente línea:

        initdb.exe -D c:\pgsql75win\data -W -E LATIN1

      De esta forma, el conjunto de caracteres de las bases de datos creadas será iso-latin-1.     

4. Ejecutar `initdb.bat`

5. ejecutar `pgstart.bat`


6. Ahora volver a copiar el fichero libpq.dll que viene con los binarios del
mapserver en `system32`. Si no, el mapserver cascará cada vez que lancemos un
mapa con alguna fuente SQL.

__ATENCION__: El al ejecutar env.bat y a continuación psql, nos aparecerá un
warning, donde nos advierte que nuestro código de página de la consola (850)
difiere del de windows (1252). La solución nos la dan en:
   
     http://www.postgresql.org/docs/current/static/install-win32.html
   
Según dicen ahí lo que tendríamos que hacer es editar env.bat

    @echo off
    set PATH... blabla
    chcp 1252
    cmd
    exit

También hay que cambiar la fuente a Lucida Console (crear acceso directo a
env.bat, pinchar con el botón derecho sobre icono de éste y en fuentes
seleccionar Lucida console).

En mi caso el warning desaparece al ejecutar psql, no obstante no puedo escribir el
caracter '\' en psql, así que, si alguien tiene la solución si es tan amable
de editar esta página y enviar un mensaje a la lista de usuarios de
MapServer, sería un detalle por su parte.
------------------

### Crear una base de datos que use PostGIS ==

Ejecutamos env.bat

    c:\pgsql75win> createdb juan
   
donde `juan` es el nombre de usuario Windows. Continuamos indicando que vamos
a usar el lenguaje PL PGSql, requerido por las exntensiones PostGIS

     c:\pgsql75win> createlang plpgsql juan
   
Ahora nos movemos al directorio `share/contrib/`
donde hay dos ficheros SQL que nos servirán para crear dos tablas necesarias 
para una base de datos con georererencias. 
Los ficheros son `postgis.sql`  y `spatial_ref_sys.sql`. Bien, sólo queda
ejecutar los comandos que vienen incluidos en estos ficheros:

     > psql -d juan -f postgis.sql
     > psql -d juan -f spatial_ref_sys.sql
    
 
Tenemos dos comandos incluidos con postgis: shp2pgsql y pgsql2shp.
Estos convierten un fichero de Shapefile a sentencias PostgreSQL y viceversa.

Por ejemplo, para incluir un fichero a nuestra base de datos:

     > shp2pgsql fichero.shp nombre_tabla nombre_db > fichero.sql
     > psql -U juan -d juan -f fichero.sql
  
En el fichero MAP en una capa (LAYER):
 
      DATA "the_geom from nombre_tabla"
      CONNECTION "user=juan password=contraseña dbname=juan host=localhost port=5432"
      CONNECTIONTYPE postgis
    

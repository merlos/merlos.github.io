---
layout: post
post_id: mapserver44
lang: es
title: "Instalación de Mapserver 4.4 con PHP 5.0 como DSO de Apache."
description: "Actualización de la engorrosa instalación de MapServer a 4.4 en Debian GNU/Linux con PHP 5.04 como DSO de Apache 1.3.33."
keywords: "mapserver, php, debian, apache, dso"
comments: false
categories: 
  - mapserver
---

#Instalación de Mapserver en Debian

 - Mapserver 4.4.3 Mayo 2005
 - Mapserver 4.2.0 Julio 2004


Para instalarlo como CGI:

Añadir a /etc/sources.list_ las siguientes fuentes de paquetes:

    deb http://www.paulbaker.net/debian stable main
    deb-src http://www.paulbaker.net/debian stable main

ejecutar:

    # apt-get install mapserver mapserver-utils


Más información:  
  http://mapserver.gis.umn.edu/cgi-bin/wiki.pl?DebianLinux
  http://mapserver.gis.umn.edu/doc/phpmapscript-install-howto.html  
-------------------------------------------------------------------------

## Objetivos

 El objetivo de esta instalación es tener configurado el servidor de mapas
georreferenciados con soporte de las siguientes opciones:

   - Mapserver CGI
   - PHP 5.0.4 como DSO (¡ojo! No como CGI)
   - PHP/MapScript
   - Soporte de Fuentes PostGIS

 Partiremos de un ordenador con una Debian que utiliza paquetes testing. En caso de utilizar otra distribución, podemos optar

  1) Adaptar los pasos de este texto pero para nuestra distribución. En general, excepto la parte referida a la instalación de php, los contenidos de este texto son independientes de la distribución. 

   2) Buscar otro texto que hable de forma específica de los pasos a dar en  nuestra distribución.
   
 Vamos a necesitar instalar gran cantidad de bibliotecas de funciones, en principio, lo suyo sería poder instalarlas utilizando el gestor de paquetes de la distribución, en nuestro caso apt-get, pero el mapserver suele necesitar versiones incluso más modernas que las disponibles en los paquetes testing/unstable, con lo cual, en la mayoría de los casos optaremos por descargar los fuentes y compilar. En otras ocasiones, siempre que nos haya sido posible y no hayamos tenido ningún tipo de problema con dependencias o versiones hemos optado por instalar el paquete debian, simplemente por vagancia. Así que, antes de descargar y compilar las bibliotecas de funciones recomendamos probar:

   1) Buscar el paquete
       
          apt-cache search nombre_biblioteca

   2) Una vez encontrado, comprobar que la versión nos vale.

           apt-cache show nombre_paquete_biblioteca

   3) Instalar el paquete debian y también el paquete del desarrollador que contiene las cabeceras de las funciones (en general tiene el mismo nombre del paquete más el sufijo -dev)

          apt-get install nombre_paquete_biblioteca
          apt-get install nombre_paquete_biblioteca-dev 

Como veremos, la intalación de mapserver es bastante tediosa y puñetera, es más, para mi ha sido un auténtico coñazo, con perdón de la expresión.

## Instalación de MapServer a partir de los fuentes


Nos basaremos en la documentación del servidor:
    
         http://mapserver.gis.umn.edu/doc44/unix-install-howto.html

Primero vamos a instalar las bibliotecas externas que son necesarias o en algún caso opcionales que el mapserver emplea. En la documentación oficial nos indican lo siguiente:

 MapServer also makes use of a variety of external libraries to enhance its functionality. Here is a short, descriptive list of the libraries and what purpose they serve:

  * GD: For rendering GIFs or PNGs (Mandatory, version 2.0.12 or greater required).
  * PROJ.4: For on-the-fly projection conversion (Recommended, mandatory for WMS Support). For WMS, you will need AT LEAST version 4.4.3.
  * LibCURL: For WMS/WFS Client Connections support (Optional, required WMS/WFS Support, Version 7.10 or greater required).
  * LibTIFF: For TIFF support (Optional).
  * LibGeoTIFF: For GeoTIFF (Geo-Referenced TIFF Images) Support (Optional).
  * LibJPEG: For JPEG Support (Optional).
  * FreeType: For TrueType font support. This is used through GD only, mapserver does not compile against it directly (Optional but highly recommended, version 2.x+ required).
  * OGR Simple Features Library: For providing I/O for a variety of VECTOR file formats (Optional).
  * GDAL - Geospatial Data Abstraction Library: For providing I/O for a number of RASTER formats (Optional, version 1.1.8 or later required).
  * SDE Client Librairies: These libraries are provided with ESRI's Spatial Data Warehouse ArcSDE (Optional).
  * PostgreSQL Client: In order for MapServer to be able to read PostGIS data, it needs to be compiled against the PostgreSQL client libraries.
  * Oracle Spatial Client Librairies: These librairies are provided with your Oracle product, and used to interface with an Oracle Spatial warehouse.
  *  MING: For Macromedia Flash output support (Optional, version 0.2a or greater required).
  * PDFLib: For PDF output support. (Optional, version 4.0.3 or greater required). Note: There are licensing restrictions as this is not an entirely open-source product. If you qualify you may however use PDFlib Lite free of charge.
  * MPATROL: For debugging (Developers only).

 Además, instalaremos la siguiente biblioteca:

  * libiconv (libiconv converts from one character encoding to another through Unicode conversion)


###  Instalación de GD
-----------------

GD es una biblioteca para generar imágenes de forma eficiente, es requerida
por el mapserver. Para instalar esta librería es necesario instalar antes
otras, ya que ésta depende de ellas.

     gd: http://www.boutell.com/gd/
     zlib: http://www.gzip.org/zlib/
     libpng: http://www.libpng.org/pub/png/
     jpegV6: http://www.ijg.org/ 
     freetype: http://www.freetype.org/

En nuestro caso descargamos los siguientes ficheros:

      freetype-2.1.9.tar.gz  
      zlib-1.2.2.tar.gz
      libpng-1.2.8.tar.gz	    
      jpegsrc.v6b.tar.gz  
      gd-2.0.33.tar.gz 

#### freetype
  
    tar -xzvf  freetype-2.1.9.tar.gz  
    cd freetype-2.1.9
    ./configure
    make
    make install
    
#### zlib

    tar -xzvf zlib-1.2.2.tar.gz
    cd zlib-1.2.2
    ./configure
    make 
    make install
  
#### libpng

    tar -xzvf libpng-1.2.5.tar.gz
    cd libpng-1.2.5
    cp scripts/makefile.linux ./make
    make
    make install
  
#### jpegV6

    tar -xzvf jpegsrc.v6b.tar.gz
    ./configure --enable-shared
     make
     make install
     make install-lib

Una vez hecho lo anterior procederemos a instalar la GD

    tar -xzvf gd-2.0.25.tar.gz
    cd gd-2.0.25
    ./configure
 
Tras ejecutar el configure de GD debermos tener un resumen
como el que sigue:

    ** Configuration summary for gd 2.0.25:
      
     Support for PNG library:          yes
     Support for JPEG library:         yes
     Support for Freetype 2.x library: yes
     Support for Xpm library:          no
     Support for pthreads:             yes
	       
Si es así, proseguiremos con la instalación:

    make
    make install
    
#### Instalación de libproj4

Descargamos los fuentes de: http://www.remotesensing.org/proj/

Procedemos a la instalación:

    tar -xzvf proj-4.4.8.tar.gz
    cd proj-4.4.8
    ./configure
    make
    make install
  
#### Instalación de libCURL

Descargamos los fuentes de: http://curl.haxx.se/libcurl/

Procedemos a la instalación:

    tar xzvf curl-7.13.2.tar.gz 
    cd curl-7.13.2
    make
    make install


Instalación de libTIFF
---------------------
Descargamos los fuentes de: http://www.libtiff.org/

Procedemos a la instalación:

    tar -xzvf tiff-v3.7.2.tar.gz
    cd tiff-v3.7.2
    ./configure
    make
    make install

Instalación de libgeoTIFF
------------------------
Descargamos los fuentes de: http://www.remotesensing.org/geotiff/geotiff.html

    tar -xzvf libgeotiff-1.2.2.tar.gz
    cd libgeotiff-1.2.2
    ./configure
    make
    make install

--
Nota: libgeoTIFF depende de libtiff, por lo que el orden de los factores alterará el producto en este caso.
--

Instalación de PDFlib
---------------------
Descargamos los fuentes de: http://www.pdflib.com/products/pdflib/index.html
(Descargar la versión lite)
    
     tar -xzvf PDFlib-Lite-6.0.1.tar.gz
     cd PDFlib-Lite-6.0.1-Unix
     ./configure
     make
     make install

Instalación de GDAL
-------------------
Descargamos los fuentes de: http://www.remotesensing.org/gdal/

Procedemos a la instalación:

    ./configure --with-pg=/usr/local/pgsql/bin/pg_config./configure --with-pg=/usr/local/pgsql/bin/pg_config

  En mi caso, el resumen fue:

    GDAL is now configured for i686-pc-linux-gnu
    
    Installation directory:    /usr/local
    C compiler:                gcc -O2
    C++ compiler:              g++ -O2
    
    LIBTOOL support:           yes
    
    LIBZ support:              external
    GRASS support:             no
    CFITSIO support:           no
    PCRaster support:          no
    NETCDF support:            no
    LIBPNG support:            external
    LIBTIFF support:           external
    LIBGEOTIFF support:        external
    LIBJPEG support:           external
    LIBGIF support:            internal
    OGDI support:              no
    HDF4 support:              no
    KAKADU support:            no
    JASPER support:            no
    ECW support:               no
    MrSID support:             no
    POSTGRESQL support:        yes
    MySQL support:             no
    XERCES support:            no
    ODBC support:              no
    OCI support:               no
    DODS support:              no
    SQLite support:            no
    GEOS support:              yes
    
    Statically link PROJ.4:    no
    
    Python:                    no
    
    enable OGR building:       yes
    make
    make install

#### Instalación de MING

 Esta biblioteca depende de otras dos bibliotecas, la libpng, que ya hemos instalado y la libungif. 
http://prdownloads.sourceforge.net/ziproxy/libungif-4.1.0.tar.gz?download


Descargamos ambas bibliotecas.
  * http://ming.sourceforge.net
  * http://sourceforge.net/projects/libungif/

Primero instalamos la libungif con el procedimiento de siempre:

     tar -xzvf libungif-4.1.3.tar.gz
     cd libungif-4.1.3
     ./configure
     make
     make install

y acontinuación instalamos la biblioteca ming

    tar -xzvf ming-0.3beta1.tar.gz
    cd ming-0.3beta1
    make
    make install
    
-- 
Nota1: Es necesario instalar los paquetes bison, m4 y flex
  
    apt-get install bison m4 flex

Nota2: Tuve que ejecutar 
		 
       mv libming.so libming.so.0.3beta1 
  antes de ejecutar el comando 
        make install 
  porque daba un pequeño error. 
--

#### Instalación de libiconv

Descargamos la los fuentes de: 
     http://www.gnu.org/directory/localization/libiconv.html

Procedemos a la instalación:

    tar -xzvf libiconv-1.9.1.tar.gz
     cd libiconv-1.9.1
     ./configure
     make
     make install
   

#### Instalación de PHP 5.0.4

Para la instalación, haremos lo de siempre, descargar los fuentes,
descomprimirlos y ejecutar el script de configuración. En este caso la
instalación va a ser un poco más tediosa, puesto que hay que ver qué
opciones vamos activar. Puesto que ya tenemos instalada una versión de PHP
que viene con la distribución vamos a utilizar como referencia utilizaremos 
la información que obtenemos de la función phpinfo()(**ver nota), también 
podemos encontrar información en:

       http://es2.php.net/manual/es/funcref.php

 donde nos indican para qué sirve cada extensión y cómo activarla. Por último,
 si ejecutamos:
  
    ./configure --help

obtendremos todas las opciones de compilación.

 A continuación adjunto la línea de configure que empleamos, así como las 
bibliotecas que hubo que instalar. Nótese que puede que en otros sistemas pueden 
variar los nombres de los directorios de las bibliotecas. 

    tar -xzvf php-5.0.4.tar.gz
    cd php-5.0.4
    
    php-5.0.4# make install
    Installing PHP SAPI module:       apache
    [activating module `php5' in /etc/apache/httpd.conf]
    cp libs/libphp5.so /usr/lib/apache/1.3/libphp5.so
    chmod 755 /usr/lib/apache/1.3/libphp5.so
    cp /etc/apache/httpd.conf /etc/apache/httpd.conf.bak
    cp /etc/apache/httpd.conf.new /etc/apache/httpd.conf
    rm /etc/apache/httpd.conf.new
    Installing PHP CLI binary:        /usr/local/bin/
    Installing PHP CLI man page:      /usr/local/man/man1/
    Installing PEAR environment:      /usr/share/php/
    [PEAR] Archive_Tar    - installed: 1.1
    [PEAR] Console_Getopt - installed: 1.2
    [PEAR] PEAR           - installed: 1.3.5
    Wrote PEAR system config file at: /usr/local/etc/pear.conf
    You may want to add: /usr/share/php to your php.ini include_path
    [PEAR] HTML_Template_IT- installed: 1.1
    [PEAR] Net_UserAgent_Detect- installed: 2.0.1
    [PEAR] XML_RPC        - installed: 1.2.2
    Installing build environment:     /usr/local/lib/php/build/
    Installing header files:          /usr/local/include/php/
    Installing helper programs:       /usr/local/bin/
    program: phpize
    program: php-config
    program: phpextdist


---
NOTA: Deberemos instalar las siguientes bibliotecas para la línea anterior


   * libxml2 (apt-get install libxml2-dev)
       (fuentes: http://www.xmlsoft.org/downloads.html)
   * libxslt (apt-get install libxslt-dev)
        (fuentes: http://www.xmlsoft.org/downloads.html)
   * libbz2 (apt-get install libbz2-dev)
   * libmhash (apt-get install libmhash-dev)
   * librecode (apt-get install librecode-dev)
   * libmm (apt-get install libmm-dev)
   * libsnmp (apt-get install libsnmp5-dev)
   * libobdc (apt-get install unixodbc-dev)
   * libgmp3 (apt-get install libgmp3-dev)
   * libtidy ( apt-get install libtidy-dev)
   * libxmlrpc (apt-get install libxmlrpc-c3-dev)
   * libpcre3 (apt-get install libpcre3-dev)
   * libmcrypt (apt-get install libmcrypt-dev)
   * libexif (apt-get install libexif-dev)
   * libldap2 (apt-get install libldap2-dev


--
** Nota: Para ver la información que nos ofrece la función phpinfo(). hay que crear un fichero con extensión php que sea accesible a través del apache, por ejemplo, el fichero /var/www/phpinfo.php:

    <?php
     phpinfo();
     ?>
--

--     
Consejo: Dado que la salida del ./configure es muy abundate, podemos 
redireccionar la salida estandar a un fichero para poder analizar con más 
detenimiento las opciones que se han configurado:
   
     ./configure --with-toda-la-lista-de-argumentos > fichero_salida

Así, en fichero salida tendremos todo lo que sale por pantalla.



Compilación de MapServer
-------------------------

Llega el momento de instalar el mapserver ¡Al fin!

Procedemos como anteriormente descargando los fuentes 
(http://mapserver.gis.umn.edu/dload.html).

 Y acontinuación lo descomprimimos:

    tar -xzvf mapserver-4.4.3.tar.gz 
    cd mapserver-4.4.3
    
Ahora vemos qué opciones queremos activar. Para ello, ejecutamos

    ./configure --help

    ./configure --with-freetype --with-zlib --with-png=/usr/local 
      --with-jpeg=/usr/local --with-libiconv=/usr/local --with-gd=/usr/local 
      --with-pdf=/usr/local --with-proj=/usr/local --with-threads  --with-geos
      --with-gdal  --with-postgis=/usr/local/pgsql/bin/pg_config --without-wms 
      --with-httpd=/usr/sbin/httpd --with-php=/usr/local/include/php/ 
      --with-php-regex-dir=../../php/php-5.0.4/regex


 En su caso será necesario  cambiar el directorio --with-php-regex para que apunte al subdirectorio regex de los fuentes de su php5.

--
  Aunque instalamos las bibliotecas Ming y Tiff no activamos las opciones --with-ming y --with-tiff (optamos por esta solución dado que ninguna de las dos bibliotecas eran estrictamente necesarias para nuestros propósitos)

Una vez configurado, ejecutamos el make para compilar. Y una vez compilado (si hay suerte), el ficherpo php_mapscript.so hay que copiarlo a /usr/local/lib/php/20040430/

     cd mapserver-4.4.3/mapscript/php3
     cp php_mapscript.so /usr/local/lib/php/20040430/

Ahora hacemos un pequeño fichero de prueba en un directorio accesible por el apache. Usaremos el que encontramos en la documentación oficial:

    <?php
    if (PHP_OS == "WINNT" || PHP_OS == "WIN32")
          dl("php_mapscript.dll");
    else dl("php_mapscript.so");
    phpinfo();
    ?>

Si todo va bien, entre otra cantidad de cosas, nos debería aparecer la típica información ofrecida por la función phpinfo() y dentro de las extensiones una referida a mapscript.

En nuestro caso hubo que hacer algún que otro apaño antes de que funcionara todo bien ya que al intentar cargar algunas bibliotecas durante la inicialización de php_mapscript nos decía que no las encontraba. La solución que encontramos fue enlazar algunos ficheros desde /usr/lib a /usr/local/lib. Los errores de las bibliotecas no encontradas los daba la función dl() de php, y sólo hay que crear los enlaces simbólicos de esta forma:

    ln -s /usr/local/lib/fichero.no.encontrado /usr/lib


Por último, para poder modificar la configuración de PHP nos queda copiar el fichero php.ini-dist del directorio donde desempaquetamos los fuentes al directorio /usr/local/lib (directorio por defecto en el que debe de estar este fichero. Si hubiéramos querido cambiarlo tendríamos que haber activado el modificador  --with-config-file-path=/etc durante la configuración). Por tanto:

    cp php.ini-dist /usr/local/lib/php.ini
   

Juan Manuel Merlos (jmmerlos @ merlos . org)
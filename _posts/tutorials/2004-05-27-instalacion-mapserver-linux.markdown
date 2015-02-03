---
layout: post
post_id: mapserver
lang: es
title: "Instalación de Mapserver 4.2 en Debian"
description: "Instalación de Mapserver 4.2.0 en Debian GNU/Linux"
keywords: "mapserver, php, debian, apache, dso"
comments: false
categories: 
  - mapserver
---


Instalación de Mapserver en Debian
----------------------------------
27/05/2004

Para instalarlo como CGI:

Añadir a `/etc/sources.list` las siguientes fuentes de paquetes:

    deb http://www.paulbaker.net/debian stable main
    deb-src http://www.paulbaker.net/debian stable main

ejecutar:

    # apt-get install mapserver mapserver-utils


Más información:  
http://mapserver.gis.umn.edu/cgi-bin/wiki.pl?DebianLinux
http://mapserver.gis.umn.edu/doc/phpmapscript-install-howto.html  
-------------------------------------------------------------------------

Objetivos
---------
 El objetivo de esta instalación es tener configurado el servidor de mapas
georreferenciados con soporte de las siguientes opciones:

   - Mapserver CGI 4.2.0
   - PHP/MapScript
   - Java/MapScript
   - Soporte de Fuentes MySQL
   - Soporte de Fuentes PostGIS
      
   
 Partiremos de un ordenador con una Debian que utiliza paquetes testing. En 
 caso de utilizar otra distribución, podemos optar

  1. Adaptar los pasos de este texto pero para nuestra distribución. En general, excepto la parte referida a la instalación de php, los contenidosde este texto son independientes de la distribución. 

  2. Buscar otro texto que hable de forma específica de los pasos a dar en nuestra distribución.
   
 Vamos a necesitar instalar gran cantidad de bibliotecas de funciones, 
 en principio, lo suyo sería poder instalarlas utilizando el gestor de 
 paquetes de la distribución, en nuestro caso apt-get, pero el mapserver 
 suele necesitar versiones incluso más modernas que las disponibles en los 
 paquetes testing/unstable, con lo cual, en la mayoría de los casos 
 optaremos por descargar los fuentes y compilar. En otras ocasiones, 
 siempre que nos haya sido posible y no hayamos tenido ningún tipo de 
 problema con dependencias o versiones hemos optado por instalar el 
 paquete debian, simplemente por vagancia. Así que, antes de descargar
 y compilar las bibliotecas de funciones recomendamos probar:

   1) Buscar el paquete
       
          apt-cache search nombre_biblioteca

   2) Una vez encontrado, comprobar que la versión nos vale.

           apt-cache show nombre_paquete_biblioteca

   3) Instalar el paquete debian y también el paquete del desarrollador 
   que contiene las cabeceras de las funciones (en general tiene el mismo 
   nombre del paquete más el sufijo -dev)

          apt-get install nombre_paquete_biblioteca
          apt-get install nombre_paquete_biblioteca-dev 

Como veremos, la intalación de mapserver es bastante tediosa y puñetera, es 
más, para mi ha sido un auténtico coñazo, con perdón de la expresión.

Instalación de MapServer a partir de los fuentes
-------------------------------------------------

Nos basaremos en la documentación del servidor:
    
         http://mapserver.gis.umn.edu/doc40/unix-install-howto.html

Primero vamos a instalar las bibliotecas externas que son necesarias o en 
algún caso opcionales que el mapserver emplea. En la documentación oficial 
nos indican lo siguiente:

 MapServer also makes use of a variety of external libraries to enhance its 
 functionality. Here is a short, descriptive list of the libraries and what 
 purpose they serve:

  * GD: For rendering GIFs or PNGs (Mandatory, version 2.0.12 or greater 
      required).
  * PROJ.4: For on-the-fly projection conversion (Recommended, mandatory 
      for WMS Support). For WMS, you will need AT LEAST version 4.4.3.
  * LibCURL: For WMS/WFS Client Connections support (Optional, required 
      WMS/WFS Support, Version 7.10 or greater required).
  * LibTIFF: For TIFF support (Optional).
  * LibGeoTIFF: For GeoTIFF (Geo-Referenced TIFF Images) Support (Optional).
  * LibJPEG: For JPEG Support (Optional).
  * FreeType: For TrueType font support. This is used through GD only, 
      mapserver does not compile against it directly (Optional but highly 
      recommended, version 2.x+ required).
  * OGR Simple Features Library: For providing I/O for a variety of VECTOR
      file formats (Optional).
  * GDAL - Geospatial Data Abstraction Library: For providing I/O for a
      number of RASTER formats (Optional, version 1.1.8 or later required).
  * SDE Client Librairies: These libraries are provided with ESRI's Spatial
      Data Warehouse ArcSDE (Optional).
  * PostgreSQL Client: In order for MapServer to be able to read PostGIS 
      data, it needs to be compiled against the PostgreSQL client libraries.
  * Oracle Spatial Client Librairies: These librairies are provided with 
      your Oracle product, and used to interface with an Oracle Spatial 
      warehouse.
  * MING: For Macromedia Flash output support (Optional, version 0.2a or 
      greater required).
  * PDFLib: For PDF output support. (Optional, version 4.0.3 or greater 
      required). Note: There are licensing restrictions as this is not an 
      entirely open-source product. If you qualify you may however use PDFlib
      Lite free of charge.
  * MPATROL: For debugging (Developers only).

 Además, instalaremos la siguiente biblioteca:

  * libiconv (libiconv converts from one character encoding to another
      through Unicode conversion)


### Instalación de GD

GD es una biblioteca para generar imágenes de forma eficiente, es requerida
por el mapserver. Para instalar esta librería es necesario instalar antes
otras, ya que ésta depende de ellas.

     zlib: http://www.gzip.org/zlib/
     libpng: http://www.libpng.org/pub/png/
     jpegV6: http://www.ijg.org/ 
     freetype: http://www.freetype.org/

En nuestro caso descargamos los siguientes ficheros:

      freetype-2.1.8.tar.gz  
      zlib-1.2.1.tar.gz
      libpng-1.2.5.tar.gz	    
      jpegsrc.v6b.tar.gz  
      gd-2.0.25.tar.gz 

  freetype
  --------
    tar -xzvf  freetype-2.1.8.tar.gz  
    cd freetype-2.1.8
    ./configure
    make
    make install
    
  zlib
  ----
    tar -xzvf zlib-1.2.1.tar.gz
    cd zlib-1.2.1
    ./configure
    make 
    make install
  
  libpng
  ------
    tar -xzvf libpng-1.2.5.tar.gz
    cd libpng-1.2.5
    cp scripts/makefile.linux .
    make
    make install
  
  jpegV6
  ------
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
    
Instalación de libproj4
-----------------------
Descargamos los fuentes de: http://www.remotesensing.org/proj/

Procedemos a la instalación:

    tar -xzvf proj-4.4.8.tar.gz
    cd proj-4.4.8
    ./configure
    make
    make install
  
Instalación de libCURL
----------------------
Descargamos los fuentes de: http://curl.haxx.se/libcurl/

Procedemos a la instalación:

    tar xzvf curl-7.11.2.tar.gz 
    make
    make install


Instalación de libTIFF
---------------------
Descargamos los fuentes de: http://www.libtiff.org/

Procedemos a la instalación:

     tar -xzvf tiff-v3.6.1.tar.gz
     cd tif-v3.5.5
     ./configure

     ...
     TIFF configuration parameters are:
     
     [ 1] Directory for tools:               /usr/local/bin
     [ 2] Directory for libraries:           /usr/local/lib
     [ 3] Directory for include files:       /usr/local/include
     [ 4] Directory for manual pages:        /usr/local/man
     [ 5] Directory for HTML documents:      /var/httpd/htdocs/tiff
     [ 6] Manual page installation scheme:   bsd-source-cat
     
     Are these ok [yes]? y
     ...
     
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


__Nota__: libgeoTIFF depende de libtiff, por lo que el orden de los factores 
      alterará el producto en este caso.


Instalación de PDFlib
---------------------
Descargamos los fuentes de: http://www.pdflib.com/products/pdflib/index.html
(Descargar la versión lite)
    
     tar -xzvf PDFlib-Lite-5.0.3-Unix-src.tar.gz
     cd PDFlib-Lite-5.0.3-Unix
     ./configure
     make
     make install

Instalación de GDAL
-------------------
Descargamos los fuentes de: http://www.remotesensing.org/gdal/

Procedemos a la instalación:

    ./configure

  En mi caso, el resumen fue:

    GDAL is now configured for i686-pc-linux-gnu
    
    Installation directory:    /usr/local
    C compiler:                gcc -O2  
    C++ compiler:              g++ -O2  
    
    LIBTOOL support:           yes
    
    LIBZ support:              external
    GRASS support:             no
    CFITSIO support:           no
    NETCDF support:            no
    LIBPNG support:            external
    LIBTIFF support:           external
    LIBGEOTIFF support:        external
    LIBJPEG support:           external
    LIBGIF support:            internal
    OGDI support:              no
    HDF4 support:              no
    JASPER support:            no
    ECW support:               no
    MrSID support:             no
    POSTGRESQL support:        yes
    XERCES support:            no
    ODBC support:              no
    OCI support:               no
    
    Statically link PROJ.4:    no
    
    enable OGR building:       yes
    
    
    make
    make install

Instalación de MING
-------------------

 Esta biblioteca depende de otras dos bibliotecas, la libpng, que ya hemos 
 instalado y la libungif. En el momento de escribir este texto, según se 
 indicaba en la documentación de ming la página oficial parecía no existir, 
 por lo que se puede descargar de 
 http://prdownloads.sourceforge.net/ziproxy/libungif-4.1.0.tar.gz?download

 Descargamos ambas bibliotecas.

 Primero instalamos la libungif con el procedimiento de siempre:

     tar -xzvf libungif-4.1.0.tar.gz
     cd libungif-4.1.0
     ./configure
     make
     make install

 y acontinuación instalamos la biblioteca ming

    tar -xzvf ming-0.3beta1.tar.gz
    cd ming-0.3beta1
    make
    make install
    

__Nota__: Tuve que ejecutar  mv libming.so libming.so.0.3beta1 antes del make 
install porque daba un pequeño error, puede que ya esté subsanado. 

Instalación de libiconv
-----------------------

Descargamos la los fuentes de: 
     http://www.gnu.org/directory/localization/libiconv.html

Procedemos a la instalación:

     tar -xzvf libiconv-1.9.1.tar.gz
     cd libiconv-1.9.1
     ./configure
     make
     make install
   
Llega el momento de instalar el mapserver ¡Al fin!

Procedemos como anteriormente descargando los fuentes 
(http://mapserver.gis.umn.edu/dload.html).

 Y acontinuación lo descomprimimos:

    tar -xzvf mapserver-4.2.0.tar.gz 
    cd mapserver-4.2.0
    
Ahora vemos qué opciones queremos activar. Para ello, ejecutamos

    ./configure --help
  
 En nuestro caso, activaremos los siguientes "switches":
 
     --with-proj
     --with-ogr
     --with-gdal
     --with-postgis
     --with-mygis
     --with-ming
     --with-wfs
     --with-wmsclient
     --with-httpd=/usr/sbin/apache
     --with-php


__Nota__: para activar la opción --with-mygis es necesario instalar los el paquete
libmysqlclient-dev que contiene el fichero mysql_config

     apt-get install libmysqlclient-dev

     
__Nota2__: Para activar la opción --with-php es necesario instalar el paquete
php4-dev
  
     apt-get install php4-dev

En tal caso:

     --with-php=/usr/include/php4/main/php_config.h

__¡¡ATENCION!!__ Al menos, hasta la versión 4.2 de mapserver con la versión 
precompilada de php4 de la Debian no es posible compilar el módulo:

    configure: error:
    !!! The current version of PHP MapScript has some problems with       !!!
    !!! PHP4's bundled regex.  Until we figure the solution to the        !!!
    !!! problem, the workaround is to compile PHP4 with the system regex  !!!
    !!! Please re-configure and re-compile PHP4 using --with-regex=system !!!
    !!! and then re-configure and re-compile MapServer.                   !!!
    !!! Note that PHP's --with-regex=system works only when PHP is        !!!
    !!! is configured as a CGI (that is without the --with-apxs and       !!!
    !!! --with-httpd options). So if you configured your PHP using        !!!
    !!! --with-regex=system and still get this error then make sure you   !!!
    !!! configured PHP as a CGI.                                          !!!

Por ello procederemos a compilar e instalar PHP desde los fuentes. En
nuestro caso será PHP 4.3.7RC1.  Es importante notar que vamos a compilar PHP como CGI y no como un módulo PHP


__Atención__: Al menos para esta versión de mapserver php_mapscript no funciona 
con PHP5

__Atención__: A partir de la versión 4.4 sí que es posible compilar contra php5
también parece ser que han arreglado parte de los problemas de concurrencia
que había, por lo que, aunque en modo experimental, sí que es posible ejecutar
php como DSO del Apache (es decir, como módulo de apache y no como CGI)
--


Instalación de PHP 4.3.7
------------------------

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
bibliotecas que hubo que instalar. Nótese que puede que en otros sistemas 
pueden variar los nombres de los directorios de las bibliotecas. 

    tar -xzvf php-4.3.7RC1.tar.gz
    cd php-4.3.7RC1

    ./configure --with-regex=system  --with-pcre-regex=/usr --disable-short-tags 
    --enable-memory-limit --disable-debug --enable-bcmath --with-gmp  
    --with-pdflib=/usr/local --with-tiff-dir=/usr/local --with-tidy 
    --enable-soap --with-xmlrpc --with-expat-dir=/usr --with-iconv-dir=/usr/local 
    --with-layout=GNU --with-pear=/usr/share/php --enable-calendar --enable-sysvsem 
    --enable-sysvshm --enable-track-vars --enable-trans-sid --enable-bcmath --with-bz2 
    --enable-ctype --with-iconv=/usr/local --enable-exif --enable-filepro 
    --enable-ftp --with-gettext --enable-shmop --enable-sockets 
    --enable-wddx --enable-yp --with-zlib --with-pgsql 
    --with-openssl --with-exec --with-curl --with-gd=/usr/local 
    --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local 
    -with-freetype-dir=/usr/local --with-ldap --with-mcal=/usr --with-mhash 
    --with-mm --with-mysql --with-unixODBC  --enable-xslt --with-xslt-sablot 
    --with-snmp --enable-ucd-snmp-hack --with-ttf --with-mcrypt --with-ming 
    --with-java=/home/merlos/java/j2sdk/

    make 
    make install
    ----------------------------------------------------------------------
    Installing PHP SAPI module:       cgi
    Installing PHP CGI into: /usr/local/bin/
    Installing shared extensions:     /usr/local/lib/php/20020429/
    Installing PEAR environment:      /usr/share/php/
    [PEAR] Archive_Tar    - already installed: 1.1
    [PEAR] Console_Getopt - already installed: 1.2
    [PEAR] PEAR           - already installed: 1.3.2
    Wrote PEAR system config file at: /usr/local/etc/pear.conf
    You may want to add: /usr/share/php to your php.ini include_path
    [PEAR] DB             - already installed: 1.6.2
    [PEAR] HTTP           - already installed: 1.2.2
    [PEAR] Mail           - already installed: 1.1.3
    [PEAR] Net_SMTP       - already installed: 1.2.3
    [PEAR] Net_Socket     - already installed: 1.0.1
    [PEAR] XML_Parser     - already installed: 1.0.1
    [PEAR] XML_RPC        - already installed: 1.1.0
    Installing build environment:     /usr/local/lib/php/build/
    Installing header files:          /usr/local/include/php/
    Installing helper programs:       /usr/local/bin/
      program: phpize
      program: php-config
      program: phpextdist



__NOTA__: Deberemos instalar las siguientes bibliotecas para la línea anterior

   * libxml2 (apt-get install libxml2-dev)
       (fuentes: http://www.xmlsoft.org/downloads.html)
   * libxlst (apt-get install libxlst-dev)
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
   * libmcal (apt-get install libmcal0-dev)
   * libsablot0 (apt-get install libsablot0-dev)
   * libexpat1 (apt-get install libexpat1-dev)

   * También, para esta versión necesitamos de PHP necesitamos tener instalado
     el flex 2.5.4 (ftp://ftp.gnu.org/pub/gnu/non-gnu/flex/)
     (Si la versión que viene con nuestra distribución es anterior a esta el 
     configure lanzará un warning. Para solventar este problema,  podemos 
     desinstalar el flex de la distribución (apt-get remove flex) y compilar 
     la versión descargada. Los pasos son los mismos de siempre 
     ./configure;make;make install)


__** Nota__: Para ver la información que nos ofrece la función phpinfo(). hay que
crear un fichero con extensión php que sea accesible a través del apache, por
ejemplo, el fichero /var/www/phpinfo.php:

    <?php
     phpinfo();
     ?>

__Nota__: Para añadir la extension --with-java es necesario disponer de la JSDK, 
disponible en http://java.sun.com

     
__Consejo__: Dado que la salida del ./configure es muy abundate, podemos 
redireccionar la salida estandar a un fichero para poder analizar con más 
detenimiento las opciones que se han configurado:
   
    ./configure --with-toda-la-lista-de-argumentos > fichero_salida

Así, en fichero salida tendremos todo lo que sale por pantalla.



__Problema__: Durante el make tuve este problema:

    gcc: /usr/lib/libtidy.so: No such file or directory

Solución:

    cd /usr/lib/lib
    ln -s libtidy-0.99.so.0 libtidy.so
    cd -


Bueno, una vez instalado PHP4, necesitaremos modificar la configuración del 
apache para que se ejecute la nueva versión compilada. Para ello editamos el
fichero de configuración de apache. En nuestro caso es un Apache 1.3.29 y el 
fichero se encuentra en /etc/apache/httpd.conf.

Copiar las instrucciones de
-----------------------------------------
http://www.pookey.co.uk/php-security.xml

  1.  -- Usuarios Debian:
        
        # update-binfmts --install PHP5 /usr/local/bin/php --extension php5
     
      -- Usuarios no debian:
      
         # cd /proc/sys/fs/binfmt_misc;
         # echo ':PHP5:E::php5::/usr/local/bin/php:' > register
         (es posible que haya que hacerlo cada vez que se reinicia)
	 
  2.   En /etc/apache/httpd.conf Añadir en los directorios
       public_html
	
        AddHandler cgi-script php5
-----------------------------------------

Una vez configurado php como cgi, sigamos con la instalación de mapserver  

     --with-proj /
     --with-ogr
     --with-gdal
     --with-postgis
     --with-tiff
     --with-ming 
     --with-wfs
     --with-wmsclient
     --with-httpd=/usr/sbin/apache
     --with-php=/usr/local/include/php

Al final, la línea configure quedó del a siguiente guisa:

     ./configure --with-proj --with-ogr --with-pdf=/usr/local  
     --with-gdal --with-tiff --with-postgis  --with-wfs --with-wmsclient 
      --with-httpd=/usr/sbin/apache  --with-php=/usr/local/include/php


 __Nótese__ que eliminamos la opción --with-mygis, esto es, porque en esta 
 versión y precedentes hay un error de programación:

  http://mapserver.gis.umn.edu/bugs/show_bug.cgi?id=632
  
 La solución propuesta de añadir static en las funciones que dan fallo 
 consigue que compile. Habría que editar los ficheros mapmygis.c y 
 mappostgis.c añadiendo la palabra static a la definición de las funciones

    DATAERRORMESSAGE()
    prep_DB()
    force_to_points()
    force_to_lines()
    force_to_polygons()
    dont_force()
    find_bounds()

  También desactivamos la opción --with-ming, que también da problemas. Un 
  posible hack del código lo encontramos en la lista de usuarios de mapserver:

   http://mapserver.gis.umn.edu/data2/wilma/mapserver-users/0405/msg00265.html

¡Puff, parece que compiló! Bueno, pues ahora a instalar. Si ejecutamos 
make install, no dirá que copiemos el ejecutable mapserv al directorio 
cgi-bin de nuestro servidor apache. En nuestro caso es /usr/lib/cgi-bin/, 
para saber cuál es nuestro directorio hay que buscar en el fichero 
httpd.conf (/etc/apache/httpd.conf).

Ahora copiaremos la extension php_mapscript.so al directorio de recursos 
compartidos de php. Como vimos en el resumen del make install:

     Installing shared extensions:     /usr/local/lib/php/20020429/

Nuestro directorio de recursos compartidos es ese. Así:

     cd mapserver-4.2.0/mapscript/php3
     cp php_mapscript.so /usr/local/lib/php/20020429/

Lo siguiente es hacer un pequeño fichero de prueba. Usaremos el que
encontramos en la documentación oficial:

     <?php
    if (PHP_OS == "WINNT" || PHP_OS == "WIN32")
          dl("php_mapscript.dll");
    else dl("php_mapscript.so");
    phpinfo();
    ?>

Si todo va bien, entre otra cantidad de cosas, nos debería aparecer la 
típica información ofrecida por la función phpinfo() y dentro de las
extensiones una referida a mapscript.

Por último, para poder modificar la configuración de PHP nos queda copiar el
fichero php.ini-dist del directorio donde desempaquetamos los fuentes al
directorio /usr/local/lib (directorio por defecto en el que debe de estar
este fichero. Si hubiéramos querido cambiarlo tendríamos que haber activado
el modificador  --with-config-file-path=/etc durante la configuración). Por
tanto:

     cp php.ini-dist /usr/local/lib/php.ini
   

Java MapScript
--------------------------------------------------------------

   Tras realizar estos pasos podremos usar un servidor web de aplicaciones
JAVA, como puede ser Tomcat junto con MapServer:

Nos hemos basado en el siguiente documento:

    http://mapserver.gis.umn.edu/cgi-bin/wiki.pl?JavaMapScriptHowTo

Necesitamos tener dos bibliotecas instaladas:

   * GD 2.0.12 o superior (ya instalada previamente)
   * SWIG 1.3.19 o superior (http://www.swig.org/download.html)
   
Procederemos a instalar SWIG, que nos servidrá como wrapper. Tendremos que 
activar las siguientes opciones:

    --with-java=path        Set location of Java executable
    --with-javac=path       Set location of Javac executable
    --with-javaincl=path    Set location of Java include directory

En nuestro caso, la J2SDK se instaló en /home/merlos/java/j2sdk.

    tar -xzvf swig-1.3.21.tar.gz 
    cd SWIG-1.3.21/
    ./configure --with-java=/home/merlos/java/j2sdk/bin --with-javac=/home/merlos/java/j2sdk/bin --with-javaincl=/home/merlos/java/j2sdk/include
    make 
    make install
    
Ahora ejecutamos el make en mapserver-4.2.0/mapscript/java. Aparecerán un 
montón de errores y warnings.

Ahora tendremos que editar el Makefile

Tendremos que modificar estas líneas:

    #
    # Java Stuff
    #
    JAVAC=/usr/local/java/bin/javac
    JAR=/usr/local/java/bin/jar
    JAVA_INCLUDE=-I/usr/local/java/include -I/usr/local/java/include/linux


y poner los valores adecuados:

    JAVAC=/home/merlos/java/j2sdk/bin/javac
    JAR=/home/merlos/java/j2sdk/bin/jar
    JAVA_INCLUDE=-I/home/merlos/java/j2sdk/include -I/home/merlos/java/j2sdk/include/linux

    #
    # Set these to the values appropriate for your MapServer build- cut & paste from ../../perlvars


También puede que haya que editar las líneas

    LDFLAGS=-L../.. -lmap -lgd -L/usr/local/lib -lgd -ljpeg -lttf -lpng -lz -ltiff -ljpeg -lpng -lz -ljpeg -lm
    CCFLAGS=-DIGNORE_MISSING_DATA -DUSE_EPPL -DUSE_TIFF -DUSE_JPEG -DUSE_GD_TTF -DUSE_GD_GIF -DUSE_GD_PNG -DUSE_GD_JPEG -DUSE_GD_WBMP -DGD_HAS_GDIMAGEGIFPTR

En nuestro caso, tuvimos que quitar -lttf y -DUSE_GD_TTF

    CCFLAGS=-DIGNORE_MISSING_DATA -DUSE_EPPL -DUSE_TIFF -DUSE_JPEG -DUSE_GD_GIF -DUSE_GD_PNG -DUSE_GD_JPEG -DUSE_GD_WBMP -DGD_HAS_GDIMAGEGIFPTR

    LDFLAGS=-L../.. -lmap -lgd -L/usr/local/lib -lgd -ljpeg -lpng -lz -ltiff -ljpeg -lpng -lz -ljpeg -lm

intentar compilar de nuevo:

    make

Si no hay ningún error de compilación de las clases java, eso querrá decir
que alguien ya ha arreglado el problema que hay, si no, habrá que  bajar el 
parche de:

    http://www.prometeo.it/jmapserver/jmapserver-howto.tgz

Descomprimir y copiar el fichero javafiles.patch al directorio 
mapserver-4.2.0/mapscript/java

A continuación ejecutar los siguientes comandos:

    mkdir -p edu/umn/gis/mapscript/
    mv *.java edu/umn/gis/mapscript/
    patch -p0 < javafiles.patch
  
    patching file ./edu/umn/gis/mapscript/mapObj.java
    Hunk #1 succeeded at 330 with fuzz 2 (offset 34 lines).
    patching file ./edu/umn/gis/mapscript/outputFormatObj.java


__Nota__: parece ser que se le olvidó "parchear"

    edu/umn/gis/mapscript/symbolObj.java:207: getPoints() is already defined in
    edu.umn.gis.mapscript.symbolObj
    public lineObj getPoints() {
                 ^
    1 error
    venus:/home/merlos/public_html/pub/geotools/mapserver/mapserver-4.2.0/mapscript/java# cd edu/umn/gis/mapscript/symbolObj.java 

Así que lo que hice fue sustituir uno de los getPoints por getPoints(boolean lala). Sustituí la línea 207
    
    public lineObj getPoints() {

por las siguientes dos líneas.

     public lineObj getPoints(boolean lala) {
       if (lala==true) {}

Este problema viene de que mientras que en C++ pueden existir dos métodos 
con el mismo nombre y con los mismos parámetros de entrada que devuelvan 
tipos de datos distintos, en JAVA no es posible. El parche aplicado viene a 
solucionar problemas similares, no obstante la solución aplicada en él viene 
por eliminar las funciones que considera sobrantes.


Una vez aplicados los parches y las modificaciones procedemos a compilar y
hacer las librerías que leeremos de forma dinámica:

    javac edu/umn/gis/mapscript/*.java
    make mapscript_so
    make mapscript_jar

Tras efectuar estas operaciones, tendremos dos ficheros libmapscript.so 
y mapscript.jar

El fichero jar tendremos que tenerlo disponible en nuestro classpath.

Una posible prueba para ver si todo funciona:

     import java.io.*;
     import edu.umn.gis.mapscript.*;
     public class prueba {
     public static void main(String[] args) throws IOException {
      System.loadLibrary("mapscript");
      mapObj  mapa;
      imageObj imagen;
      mapa=new mapObj("uru2.map");
      imagen=mapa.draw();
      imagen.save("uruguay_java.png",mapa);
      
       }
     }

Para compilar:

    javac -classpath mapscript.jar prueba.java


Lógicamente, no podemos ejecutarlo puesto que no disponemos de un mapa.

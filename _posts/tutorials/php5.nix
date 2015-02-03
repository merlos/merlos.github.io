
Instalación de PHP 5
--------------------

Para la instalación, haremos lo de siempre, descargar los fuentes,
descomprimirlos y ejecutar el script de configuración. En este caso la
instalación va a ser un poco más tediosa, puesto que hay que ver qué
opciones vamos activar. Puesto que ya tenemos instalada una versión de PHP
que viene con la distribución vamos a utilizar como referencia utilizaremos 
la información que obtenemos de la función phpinfo()(**ver nota), también podemos 
encontrar información en:

       http://es2.php.net/manual/es/funcref.php

 donde nos indican para qué sirve cada extensión y cómo activarla. Por último,
 si ejecutamos:
  
    ./configure --help

obtendremos todas las opciones de compilación.

 A continuación adjunto la línea de configure que empleamos, así como las 
bibliotecas que hubo que instalar. Nótese que puede que en otros sistemas pueden 
variar los nombres de los directorios de las bibliotecas. 

  tar -xzvf php-5.0.0RC2.tar.gz
  cd php-5.0.0RC2

  ./configure --with-regex=system  --with-pcre-regex=/usr --disable-short-tags --enable-memory-limit --disable-debug --enable-bcmath --with-gmp  --with-pdflib=/usr/local --with-tiff-dir=/usr/local --with-tidy --enable-soap --with-xmlrpc --with-layout=GNU --with-pear=/usr/share/php --enable-calendar --enable-sysvsem --enable-sysvshm --enable-track-vars --enable-trans-sid --enable-bcmath --with-bz2 --enable-ctype --with-iconv --enable-exif --enable-filepro --enable-ftp --with-gettext --enable-shmop --enable-sockets --enable-wddx --enable-yp --with-zlib --with-pgsql --with-openssl --with-exec --with-curl --with-gd=/usr/local --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local -with-freetype-dir=/usr/local --with-ldap --with-mcal --with-mhash --with-mm --with-mysql --with-unixODBC  --enable-xslt --with-xslt-sablot --with-snmp --enable-ucd-snmp-hack --with-ttf --with-mcrypt --with-ming --with-java=/home/merlos/java/j2sdk/

  make 
  make install

Installing PHP SAPI module:       cgi
Installing PHP CGI into: /usr/local/bin/
Installing PEAR environment:      /usr/share/php/
[PEAR] Archive_Tar    - installed: 1.1
[PEAR] Console_Getopt - installed: 1.2
[PEAR] PEAR           - installed: 1.3.1
Wrote PEAR system config file at: /usr/local/etc/pear.conf
You may want to add: /usr/share/php to your php.ini include_path
[PEAR] XML_RPC        - installed: 1.1.0
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

   * También, para esta versión necesitamos de PHP necesitamos tener instalado
     el flex 2.5.4 (ftp://ftp.gnu.org/pub/gnu/non-gnu/flex/)
     (Si la versión que viene con nuestra distribución es anterior a esta el configure lanzará un warning. Para solventar este problema,  podemos desinstalar el flex de la distribución (apt-get remove flex) y compilar la versión descargada. Los pasos son los mismos de siempre ./configure;make;make install)

--
** Nota: Para ver la información que nos ofrece la función phpinfo(). hay que crear un fichero con extensión php que sea accesible a través del apache, por ejemplo, el fichero /var/www/phpinfo.php:

  <?php
     phpinfo();
  ?>
--

--
Nota: Para añadir la extension --with-java es necesario disponer de la JSDK, disponible en http://java.sun.com
--

--     
Consejo: Dado que la salida del ./configure es muy abundate, podemos 
redireccionar la salida estandar a un fichero para poder analizar con más 
detenimiento las opciones que se han configurado:
   
   ./configure --with-toda-la-lista-de-argumentos > fichero_salida

Así, en fichero salida tendremos todo lo que sale por pantalla.
--

--
Problema: Durante el make tuve este problema:

    gcc: /usr/lib/libtidy.so: No such file or directory

    Solución:

    cd /usr/lib/lib
    ln -s libtidy-0.99.so.0 libtidy.so
    cd -


Bueno, una vez instalado PHP5, necesitaremos modificar la configuración del apache para que se ejecute la nueva versión compilada. Para ello editamos el fichero de configuración de apache. En nuestro caso es un Apache 1.3.29 y el fichero se encuentra en /etc/apache/httpd.conf.

Copiar las instrucciones de
-----------------------------------------
http://www.pookey.co.uk/php-security.xml
----------------------------------------

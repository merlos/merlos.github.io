---
layout: post
post_id: johnes
lang: es
title: "(traducción) Crackeo de passswords para principiantes con John"
description: "Traducción del manual para craquear passwords usando John the Ripper de blacksun.box.sk"
keywords: "blacksun, john, crackear, passwd, seguridad"
comments: false
categories: 
  - traduccion
---


    Cracking Unix password files for beginners, by Caboom (myonlyemail1@yahoo.com) and R a v e N (barakirs@netvision.net.il).
    http://blacksun.box.sk
    Version 1.0
    Date: 14/1/2000
    Translated by natasab ( e-mail natasab34@mail.ru )
    Version de traducción 0.91
    Fecha:7/7/2K


### Lo primero es lo primero

Supongo que eres un newbie (novato) craqueando passwords (contraseñas) como yo lo era y probablemente cuando ejecutaste por primera vez el John th Ripper (Juan el Destripador) entusiasmado no conseguiste nada. Seguro que pensaste "¡Dios! Esto debe de ser demasiado difícil, mejor lo dejo, soy un novato". Tranqui molly, todos siempre somos unos novatos en esto de craquear passwords, o mejor dicho,  "recuperación de claves", siempre hay algo que aprender. A veces, incluso siendo un craqueador experimentado no consigues la clave buscada, ni siquiera la tuya propia. Este manual es púramente técnico y te dará sólo las directrices que necesitas para craquear pases, pero has de saber que cada clave necesita ser abordada de una forma distinta.

Lo que vas aprender ahora es a craquear archivos de claves de *nix (Unix/Linux/etc). Esto no quiere decir que necesites tener instalada una distribución Unix en tu ordenador más que nada porque John es un un programa para DOS (aunque hay una version Unix/Linux. Supongo que la mayoría de los lectores de este tutorial tienen Windows). Este tutorial está hecho a base de ejemplos por lo que espero no resulte un aburrido manual con una increible cantidad de opciones. Después de leer esto no sería una mala ideal el que le echaras un vistazo a los textos que acompañan a Jonh. Yo lo aprendí todo en ahí, pero es más aburrido y "jodio" y como supongo, tú buscas la manera más sencilla, no?

No sería una mala idea que primero consiguiereas el John the Ripper, si no lo tienes busca en estas páginas:

1. packetstorm.securify.com (busca en archives, password cracking)
2. neworder.box.sk (utiliza el buscador)

Además, es un programa fácil de encontrar en cualquier buscador siplemente poniendo "jonh the ripper".

Lo segundo que necesitas es una gran cantidad de diccionarios de claves (Explicaré lo que son en un minuto). El mejor diccionario lo puedes encontrar en www.theargon.com y packetstorm (mira en archives) se llama theargonlistserver1 y tiene unos 20Mb comprimido (200Mb de texto). CONSIGUELO! La gente de theargon hicieron un magnífico trabajo.

También debes de buscar diccionarios algo más pequeños (lo explicaré luego),

## Nos parecemos a *Nix?

En fin, ya tienes el programa, los diccionarios y piensas que ya puedes petar cuanquier cosa... si vives 100000000 años, no tendrás ningún problema, pero tan sólo tienes 80, en el mejor caso, a no se que los científicos encuentren algo para... bueno, que me voy por las ramas...Lo primero que tienes que hacer es asegurarte que ti archivo de password se parece al de los Unix (vamos me refiero al archivo /etc/passwd).

Veamos como es un archivo de claves de unix:

    owner:Ejrt3EJUnh5Ms:510:102:Some free text:/home/subdir/owner:/bin/bash

La parte importante es el nombre de usuario y la clave encriptada, que son la primera y segunda parte, respectivamente (cada línea está dividida en 7 partes separadas por el símbolo :)

        owner:Ejrt3EJUnh5Ms

Owner es el nombre de usuario y lo otro es el password encriptado (encriptado en  DES alterado (Data Encripton Standard). El resto de la linea puede ser cualquier cosa pero que tenga la misma estructura  de forma que john pueda reconocerlo como una clave unix. De hecho la otra parte:

    :510:102:Some free text:/home/subdir/owner:/bin/bash

Es sólo información sobre el usuario, su directorio inicial, ...A veces encontraras pases que tan sólo tengan la primer a y segunda parte, como los archivos de passwords que consigues en un webboard en el que corre el Script webboard de matt:

    owner:Ejrt3EJUnh5Ms

Por tanto, tendrás que añadir el resto de la línea para que parezca una clave unix. Simplemente copia y pega lo que falta de otra línea completa o incluso puedes usar  
      
     :510:102:His name:/home/subdir/owner:/bin/bash

Al final tendrás algo que ese parezca a:

     owner:Ejrt3EJUnh5Ms:510:102:His name:/home/subdir/owner:/bin/bash

también puedes usar

      owner:Ejrt3EJUnh5Ms:a:a:a:a:a

al programa john le es totalmente infdiferente.

##  Estamos llegando un lugar... ninguna parte.

Muy bien, ya estamos listos para craquear, Si escribes:

      john -w:words.lst password.file

Donde words.lst es un diccionario de claves y paswword es un archivo donde tienes la o las claves encriptadas. Si lo utilizas en el ejemplo que se ha estado usando a lo largo del tutorial lo más seguro que lo encuentres, más que nada porque es una clave muy "flojucha". Posiblemente te sorprendas al ver que la gente pone claves realmente estúpidas, com su nombre, el de su perro, o hasta el propio nombre de usuario (por ejemplo usuario=pigmeo, password=pigmeo).

Sugerencia: NO seas capullo y usa claves más "fuertes"  como
 
p4sswr!@
p@s$w11s

Con tantos caracteres como puedar recordar. La finalidad de esta sugerencia es para  que uses caracteres especiales y números ya que estos pases son más difíciles de craquear (Lo explicaré en un minuto). Otra recomendación es que uses claves tan largas como puedar recordar, 8 caracteres a veces no es suficiente... depende de que ordenador  se usa para crackear... en un alfa dual,ciertamente, no es suficiente... te lo diré en otras palabras... mas de 10 caracteres estará bien, incluso más no harán daño (como 16...). Por otro lado, cabe recordar que los sistemas *Nix VIEJOS tienen una longitud fija de palabra de paso, 8 caracteres... esto es porque el antiguo DES encriptaba claves de 64-bit...ahora se encripta con claves de 128-bit, y algunos pervertidos incluso usam más, así, ahora hay más diversión  :-)

        john -w:words.lst password.file

Cheeee!!!Quieto parao! Qué estoy haciendo aquí?
Vale, lee despacio, el sistema de encriptación DES que usa Unix NO puede invertirse. Algunos sistemas de encriptación pueden ser invertidos a veces de una dorma muy simple y otras mediante un complicado algoritmo (en el siglo III AC Cesar solía emcriptar sus mensajes utilizando una simple formula de "shift by three" , es decir, una d pasaba a ser la a, la e pasaba a ser la b, y así sucesivamente. Por esa época eso era suficiente, hoy en día NO lo es).

De cualquier modo, la DES alterada que utiliza Unix para sus archivos de claves no puede ser invertido. ¿Por qué? Porque la encriptación está basada en la propia clave, es decir, se utiliza la propia clave para encriptar, en otras palabras, para ejecutar el algoritmo de desencriptación necesitas tener la clave porque la llave utilizada para la encriptación es la propia password. A ver si nos aclaramos, la llave es una serie de caracteres que utiliza el algoritmo para encriptar. Cuando el usuario escoje una clave, esta clave es la llave que se utiliza para encriptar la clave, y el resultado de esta encriptación es llamado hash (que es lo que encuentras en el archivo de passwords).El hash es creado por el algoritmo DES alterado y utiliza como llave de encriptacion (key) de la clave a ella misma. Además cabe comentar que si intentas desencriptar el password usando el DES estándar invertible, obtendrás una cadena inútil.

Entonces te preguntarás, que hacen Jonh y los otros craqueadores? Trivial,simplemente imitan este proceso tomando claves de estos archivos diccionario (o wordlists) y las usan como llaves del DES alterado, luego comparan el resultado obtenido con la clave encriptada que le has dado, si coinciden, eureka, has la clave es tuya!

Si ya has intentado lo anterior el siguiente paso es..

    john -w:words.lst -rules password.file


Este nuevo argumento es para que no sólo se compruebe con las palabras del diccionario sino que también se testee con modificaciones de éstas, como añadir un número al final de la clave: fool -> fool1, etc). Obviamente, esto llevará mucho tiempo con un diccionario grande, pero dará mejores resultados. Lo mejor es que comiences por un diccionario pequeño y luego pruebes con uno mayor.

A veces la gente NO es tan estúpida a la hora de escoger las claves y opción rules no hace su trabajo, ummmmm. Como ves cada vez está llevando más tiempo a tu CPU para craquear esto. Mejor deja que tu ordenador trabaje mientras tu duermes o te echas una siestecita.

Si quieres obtener más passwords que los de tus diccionarios, prueba con:

     john -i password.file

Este -i lo que hace es un craqueo incremental,la verdad es que no son unas palabras muy buenas para lo que hace pero... bueno. Bien, qué coño hace esto? Bueno, pues lo que hace es utilizar los parámetros por defecto del modo incremental definidos en john.ini.

Pero, qué significa eso de modo incremental? Te acuerdas de -rules? Si, bueno, a no ser que estés increiblemente senil o leiste este texto hace un par de años y lo has vuelto a retomar hoy... El modo incremental es algo parecido a las reglas pero mucho más potente, y lógicamente lleva mucho más tiempo.

# Entonces, Donde nos encontramos? (diccionario VS Fuerza bruta [brute-force]? 

Como puedes ver en todos los casos hemos utilizado un craqueo por diccionario, pero, por qué no ejecutar John de modo que pruebe todas la combinaciones posibles de minúsculas, mayúsculas, números y símbolos? Esto sería más eficiente, no? ..MAAAAAAAAAL!!!

Este método es llamado ataque de "fuerza-bruta" (en realidad un ataque de diccionario es un tipo de ataque de fuerza bruta, pero la gente no suele emplear fuerza bruta al referirse a este tipo de ataques)

Cuales son las diferencias? Lo primero y más importante, con el diccionario utilizas una seleccion de posibles passwords y sus modificaciones, pero con el ataque de fuerza bruta usas TODAS la combinaciones posibles, es decir que tienes

    comb=nCh^let

donde :

    comb= número de combinaciones total
    nCh = número caracteres que tiene la clave 
    ^   = elevado a 
    let = número de letras usadas

Por ejemplo, por defecto el conjunto de caracteres que tiene john por defecto en -i es 95 y, si la clave es de 6 letras tenemos 735091890625 combinationes. Ufff!

Seguro que esto es muy util para claves como 2405v7, pero con la capacidad de computo de los PC actuales, yo lo dejaría, a no ser que tuviera acceso a algún superordenador de una universidad, y que no creo que me lo dejaran (al menos gratis y aún menos para craquear una clave).

Como ves, puede llevar muuuucho tiempo el craquear una simple clave, sólo tienes que hacer un los cálculos para claves de 10, 12 y 16 caracteres. Supongo que no te gustará saber la respuesta

Por supuesto qur los ataques de diccionario no son suficientes, pero Jonh tiene una potente capacidad para "pensar". En el modo incremental hará todas las combinaciones posibles de 0 a 8 caracteres (por una clave de longitud 0 el hash la considera como la una cadena vacía, esto a veces sucede). Por tanto, el modo inmcremental es de algún modo un tipo de fuerza bruta.

Pero si lo que quieres es disparar todas tus armas entonces tendrás que usar:

     john password.file

esto hará un ataque de diccionario, luego aplicará -rules y por último -i

## Que pasa si...

Bien, tienes que apagar tu cacharro de vez en cuando, no? Pero si estás tratando con claves que te llevarán más de 20 horas de craqueo entonces si quieres parar por la mitad,epuedes hacer que pulsando ctrl-c,de esa forma jonh podrá reanudar esa sesión posteriormente. Usa:
   
    john -restore

Si lo que te pasa es que hay un corte de electricidad o se te queda colgado, no podrás restaurar la sesión (a veces) y eso es un Putada, creeme, a mi me pasó una vez :-(

John es modular y esto es lo más potente de john th ripper, y es lo que le hace el craqueador más avanzado. John usa los modos que son descritos en john.ini (te acuerdas del modo incremental que ya he comentado? Los modos de rules e incremental son descritos en john.ini).

Aquí tienes un ejemplo de algunos parámetros que  el comnado -i tiene por defecto:

    # Incremental modes
          [Incremental:All]
          File = ~/all.chr
          MinLen = 0
          MaxLen = 8
          CharCount = 95

Muy bien, Qué tenemos aquí?

	[Incremental:All]  >> Estp representa el principio de la definición del parámetro 	-i:all
	File >> Nombre del archivo que tiene los caracteres usados en el modo -i:all (todo el set de caracteres)
	MinLen >> Lógicamente la longitud mínima de los passwords que john probará en este modo
	MaxLen  >> Adivina, la máxima longitud de las claves
	CharCount >> Nimero de caracteres usados por John cuando activas este parámetro.

Pero, hay más parámetros ...

Sí hay más y a continuación tienes los modos por defectos pegados de los documentos de John the rippers´:

### John the Ripper's Command Line Options

Puedes listar un número cualquiera de archivos de pases en la linea de comandos de john, y también especificar algunas de las siguientes opciones (todas distinguen entre mayúsculs y minúsculas, pero pueden ser abreviadas; así mismo, también puedes usar el estilo-GNU con sintaxis de opciones largas)

	-single                         "single crack" mode
Activa el modo de craqueo simple usando las reglas de [List.Rules:Single].

    -wordfile:FILE                  wordlist mode, read words from FILE,
        -stdin                          or from stdin

Estas son usadas para activar el modo lista de palabras.

    -rules                          enable rules for wordlist mode
Activa las reglas de listas depalabras, que lee de [List.Rules:WordList].

	-incremental[:MODE]             incremental mode [using section MODE]

Activa el modo incremental, usando lo especificado en las deficiciones de ~/john.ini (Secciones [Incremental:MODE] o [Incremental:All] por defecto).

    -external:MODE                  external mode or word filter
Acriva el modo Externo, usando las funciones externas definidas en la sección de ~/john.ini [List.External:Mode]. 

	-stdout[:LENGTH]                no cracking, write words to stdout

Cuando es usado con el modo de craqueo, a excepción del "single crack", hace que john imprima las palabras generadas en el stdout (salida estándar) en lugar de de craquear. Si se aplica también las reglas de las lista de palabras, la longitud significativa que se asume como LENGTH (longitud), o ilimitado por defecto. 

	 -restore[:FILE]                 restore an interrupted session

Continua una sesión de craqueo que ha sido interumpida, lee el punto de inicio en el archivo(FILE) especificado (~/restore por defecto).

	 -session:FILE                   set session file name to FILE

Permite especificar otro nombre de archivo como  punto de información para usar en esta sesión de craqueo. Esto es útil para ejecutar varios john en paralelo, o simplemente para recuperar viejas sesiones más tarde,ya que no siempre se continúa la última sesión.

	 -status[:FILE]                  print status of a session [from FILE]

Imprime el estado de una sesión interrumpida o de una sesión que está siendo ejecutada.Para obtener una información del estado de forma actualizada de una determinada sesión que está siendo ejecutada, envia esa copia de john a SIGUP antes de usar esta opción.

	  -makechars:FILE                 make a charset, overwriting FILE

Genera un archivo con un conjunto de caracteres, basado en las frecuencias de caracteres de ~/john.pot, para usarlo con el modo incremental. El ~/john.pot será usado como fichrero del set de caracteres a no ser que especifiques algunos archivo de claves. Puesde usar la rutina externa filter() con esta opción.

	-show                           show cracked passwords

Muestra las claves crackeadas de una forma cómoda. También debes especificar los archivos de claves. Puedes usar esta opción mientras otro John está crackeando para ver que hizo hasta ese momento.

	-test                           perform a benchmark

Hace un benchmark (banco de pruebas) de todos los formatos de crackeo cifrado de textos y al mismo tiempo los prueba para ver si funcionan.

	-users:[-]LOGIN|UID[,..]        load this (these) user(s) only

Te permite filtrar las cuentas que quieres que sean crackeadas (que son las listadas). El guión es para invertir, es decir, crackea todos los usuarios menos los que están en la lista.

	-groups:[-]GID[,..]             load this (these) group(s) only

Le dice a John que sólo crackee los grupos especificados.

	-shells:[-]SHELL[,..]           load this (these) shell(s) only

Para que sólo crackee las shell especificadas. Es útil para que John sólo crackee las cuentas con shells válidas. No se puede omitir el path antes del nombre de la shell. EJ: -shell:csh pillará las cuentas con /bin/csh y /usr/bin/csh , mientras que '-shells:/bin/csh'  sólo tendrá en cuenta las que tengan /bin/csh.

	-salts:[-]COUNT                 set a passwords per salt limit

Esta característica a veces te permite conseguir mejores resultados. Por ejemplo, puedes crackear algunas usando -salts:2 más rápidamente, y luego crackear el resto usando -salts:2. El tiempo de crackeo será más o menos el mismo, pero conseguirás algunas claves antes.  

	-format:NAME                    force ciphertext format NAME

Te permite saltarte la detección del formato de cifrado e texto. Actualmente los nombres de los formatos válidos son: DES, BSDI, MD5, BF, AFS, LM. Puedes usar esta opción cuando  crackeas o con -test. Nota: John no puede crackear claves con diferentes formatos de cifrado de texto al mismo tiempo.

	-savemem:LEVEL                  enable memory saving, at LEVEL 1..3

Puede que te haga falta esta opción si no tiene mucha memoria o no quieres que John afecte a otros procesos. Nivel 1 que no gaste memoria en login names, por lo que no los verás mientras crackeas. Niveles más altos tienen un impacto en la ejecución: evita usarlos a menos que no funcione o que utilize la swap.

##	Trucos

1. Una buena forma de atacar un archivo de claves es:	

    john -w:words.lst password.file   
    john -w:words.lst -rules password.file  
    john -w:words.lst password.file    
    john -i:digits password.file
    john -i:all password.file

2. So tienes un archivo que tien pases parecidos a

        owner:*:510:102:His name:/home/subdir/owner:/bin/bash

    Tienes un archivo de passwords con shadows. 

    Ve a Byte-Me de blacksun.box.sk y busca algo más de información de passwords files (esto te lo dejo que lo hagas tú, es importante que aprendas a sacarte las castañas del fuego).

3. Tienes unas pequeñas herramientas que van con el john. Son las listadas a continuación:

	    unshadow PASSWORD-FILE SHADOW-FILE

      Combina el passwd y el shadow (cuando tienes acceso a ambos) para ser usados por jonh. Es posible que necesites usar esto si sólo usaste el archivo shadow,la información del GECOS  no será usada por el 'modo simple de crackeo (single crack) tampoco podrás usar la opción '-shells'. Por lo general querras redireccionar las salida de 'unshadow' a un archivo.

	    unafs DATABASE-FILE CELL-NAME

      Obtiene los hashes de passwords fuera de la base de datos  binaria de AFS, y produce un archivo utilizable por John (otra vez, debes redireccionar las salida tu mismo). 

	    unique OUTPUT-FILE

      Elimina los duplicados de una lista de palabras (lee del stdin) sin cambiar el orden. Es posible que quieras usar esto con la opción '-stdout' de John, si sacaste mucho espacio en disco  para intercambiar por el reducido tiempo de craqueo. 

	    mailer PASSWORD-FILE
      
      Es un script de shell para enviar un mail a todos los usuarios de los que obtuviste sus passwords. Debes editar un mensaje dentro antes de usarlo.


----------------------------------------------------------------------------    
Bueno, pues esto estodo, espero que hayas sacado algo productivo de este texto. Si quieres ampliar más tus conocimientos prueba leyendo la documentación que viene con el john en el directorio de docs. Es posible que sea un poco caótico, pero, ... lo uqe hay es lo que hay :-)).
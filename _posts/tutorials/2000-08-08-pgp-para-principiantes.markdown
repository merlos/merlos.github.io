---
layout: post
post_id: pgpes
lang: es
title: "(traducción) Encriptación PGP para Principiantes"
description: "Traducción del artículo: PGP Encription for Beginners. Part I de saint de blacksun"
keywords: “pgp, cifrado, encriptación, certificados, traduccion, blacksun”
comments: false
categories: 
  - traducción
---

    PGP Encryption for Beginners. PART I - introduction.
    Version 1.0 | author: the saint - sainty@euroseek.com
    http://blacksun.box.sk

    Traducido por natasab

Este tutorial cubre los siguientes temas: 

1. ¿Qué es pgp? 
2. Introducción a la criptografía. 
3. Principales tipos de criptografía. 
4. ¿Cómo funciona la criptografía? Cryptografía convencional.
5. Criptografía de llave pública (Primeros pasos)

## ¿Qué es PGP?

Pero antes, hazte esta pregunta: ¿Por qué querrías encriptar la información? Bueno, supón que alguien se cuela en tu ordenador. En lugar de ser capaz de ver tus números de targetas de crédito, contraseñas, etc, tan sólo encuentra basura encriptada, que no tiene ningún significado para él, y que además es bastante difícil de descifrar.

Supón que no eres el único que usas el ordenador, ¿te arriesgarías a que tu información estuviera disponible para cualquier usuario con ideas maliciosas?   YO NO!

Espero que estes de acuerdo conmigo. Ahora veamos.

PGP (Pretty Good Privacy = Privacidad bastante buena) - es un sistema que combina las características de la criptografía convencional y las de clave pública (public key) (nota: el tema de las claves será tratado luego), por eso a veces es llamado sistema híbrido de cryptografía (hybrid cryptosystem)

## Introducción a la criptografía.

Lo primero que haré es daros a conocer algunos términos que son usados reiteradamente en este tutorial:


1. Texto claro (Plain Text/Clear text) -  Es información que puede ser leida y fácilmente comprendida sin tomar ninguna medida especial (ej: este  tutorial está escrito en texto claro)
2. Encriptar - Es la acción de cambiar el texto claro con intención de escoder la información y sin pérdida de ésta.
3. Texto cifrado - Es el resultado de encriptar,a primera vista parece basura. 
4. Desencriptar - Es la acción de convertir el legible la información a partir del texto cifrado.
5. Criptografía - Ciencia que se encarga del estudio de encriptar y desencriptar
         la infromación.
6. Criptoanálisis - Ciencia que se encarga de hackear la información encriptada 
         usando varias herramientas y técnicas
7. Attackers - Así son llamados comúnmente los criptoanalistas.
8. Criptología - combina la criptografía y el criptoanálisis.
9. Cipher - Es el algorítmo criptográfico, una función matemática utilizada
         para los procesos criptográficos.

	Esta es la cadena lógica que se sigue en este proceso:

	Texto claro >> Encriptar >> Texto cigrado >> Desencriptar >> Texto claro

	La criptografía de hecho es un a ciencia matemática, usa las matemáticas para encriptar/desencriptar la información que será guardada o transmida ta través de redes inseguras (ej: internet, pero puede ser otro tipo de redes, incluso no electrónicas) para asegurarse que la información le llega tan sólo al destinatario.

### Principales tipos de criptografía:

Los tipos principales es la débil (weak) y la fuerte (strong). La fiabilidad de la critografía se mide a partir del tiempo y  recursos que se emplean para obtener el texto claro. Cuando escribí este turorial si todos los ordenadores del mundo se pusieran a descifrar un texto no podrían, pero nunca se sabe, mañana puedes tener un ordenador extraordinariamente más potente y/o que alguien encuentre una solución matemática para desencriptar sin conocer la clave correcta.

### ¿Cómo funciona la criptografía?

Un algoritmo criptográfico (cipher) utiliza algúna frase, palabra, número y otro tipo de bits par encriptar datos (texto claro). Diferentes claves producen diferentes textos cifrados. Por lo que la calidad del cifrado  responde a dos factores: fiabilidad del algoritmo y la clave escogida. Así pues es muy recomendable escojer una clave cuidadosamente y mantenerla en un sitio seguro (la mejor solución es memorizarla, si es posible :)). Todo esto es lo que conforma un sistema de encriptación (como PGP).

###Criptografía convencional.

Este tipo de cifrado usa tan sólo una llave para la encriptación y la desencriptación de los datos. Un ejemplo de esto es DES (el Data Encryption Standard) que es ampliamente usado por el Gobierno Federal. Este tipo de criptografía tiene sus ventajas y sus desventajas. Para empezar, es muy rápida y adecuada para datos, que no serán usandos mas que por la persona que los encriptó. El pero está en que la  distribución segura de la clave es un taréa bastante complicada de llevar a cabo: es necesario acordar la clave de antemano, que es impráctico en la actualidad, porque no puedes fiarte de las compañias de teléfono, correo, email o servicios de internet. Entonces, te preguntarás: ¿Cómo consigo la clave sin que alguien la intercepte? En la actualidad, la solución a la que se ha llegado es:

### Criptografía de llave Pública (primeros pasos)

	Ésta soluciona los problemas de distribución de llaves. Whitefield Diffie y Martin Helman introdujeron el concepto de llave o clave pública en 1975. También se dice qur el Servicio Secreto Británico lo invento unos años antes, pero se mantuvo en secreto y no hicieron nada con el.
	La crptografía de llave pública es un sistema asimétrico que utiliza dos claves: la pública, usada durante la encriptación y la privada, usada para la desencriptación. La pública es distribuida en internet y la personal se mantiene en secreto. Cualquiera puede encriptar con tu clave pública, pero tan sólo tú (o más exactamente la persona que tenga tu llave privada) puedes desencriptar el texto cifrado.

## PARTE II  - Sepamos algo más de PGP

Uno de los sistemas de encriptación más populares es PGP. Como se dijo anteriromente PGP es un sistema mixto, es decir, combina ambas técnicas de encriptación Llave pública y convencional. PGP opera de la siguiente forma:

a. Encriptación:

1) Primero, PGP comprime el texto claro. Esto es útil por varias razoner: necesitas menos espacio en disco duro, un mensaje más corto ahorra tiempo (y dinero) a la hora de enviarlo via internet, además, aumenta la calidad  de la encriptación ya que en los datos comprimidos hay menos patrones (patterns) que en el texto claro. Estos patrones comunes son utilizados por los criptoanalistas a la hora de hackear el algoritmo de cifrado.

2) PGP genera la 'clave secreta una-vez-sólo' (one-time-only secret key) que a veces es llamada "clave de sesión" (session key). Esto es un número aleatorio generado a partir de datos aletatorios, basados en los movimientos del ratón, las pulsaciones del teclado, el ruido de la CPU. Para obtener este texto cifrado se utiliza un algoritmo de encriptación simétrico, rápido y seguro que utiliza la clave una-vez-sólo para la encriptación.

3) Después de encriptar los datos, la "clave de sesión" es enccriptada y junto a la llave pública del destinatario es transamitida.

b. DESENCRIPTACIÓN.
	
1) PGP utiliza la clave privada para recuperar la clave de sesión.
2) La clave de sesión es usada para desencriptar de el texto (como si del modo convencional se tratara)
3) Se descomprimen los datos.

La combinación de llave convencional y pública proporcionan un sistema de  encriptación muy rápido y seguro. Esto es logrado gracias a la velocidad de los algoritmos convencionales y la seguridad  de la llave pública.

#### Comentarios sobre las claves...

Una llave o clave es un valor que es usado por el algoritmo de encriptación para obtener el texto cifrado, de hecho, las claves son grandes números. El tamaño de la llave es medido en bits, a mayor tamaño mayor seguridad. La comparación llaves convencionales y públicas es bastante chocante -clave convencional de 128 bits tiene la misma fiabilidad que un clave pública de 3000 bits. Aunque, en realidad, ambas llaves no pueden ser comparadas debido a lo específico de los algoritmos utilizados en ambos tipos de criptografía (no se pueden comparar trenes con cerebros, ¿no?)

Para obtener el máximo de seguridad lo mejor es escoger la clave de mayor longitud, aunque que llevará más tiempo y recursos.

Las llaves son almacenadas encriptadas. Típicamente se usan 2 llaveros (keyrings)(son unos ficheros alamacenados en el Disco Duro) - uno para la clave pública y otro para la privada. NUNCA pierdas el llavero (archivo) con las claves privadas, porque toda la informacion que fue encriptada utilizando las llaves de ese llavero no podrá ser usada de nuevo, se perderá (bueno, excepto eres capaz de crackear el algoritmo de cifrado).

#### ... y sobre Firmas Digitales

Como las firmas escritas, las firmas digitales porporcionana una autentificación del origen de la información. Por lo general, este tipo de criptografía es mucho más usado que la encriptacion de datos. La firma digital es IMPOSIBLE de falsear, vamos, que si utilizas este tipo de firmas puedes estar realmente seguro de que estás tratando con la persona correcta (en cuanto a la autentificación, por supuesto)

La firma digital funciona de la siguiente forma:

1. El texto claro (plain text) es encriptado con tu clave privada.
2. Si la información  puede ser desencriptada con tu clave pública, entonces la informaión es tuya.

Este proceso es lento y produce un motón de datos innecesarios para la verificación de tu firma. Aquí aparece la  función Hash (función enredadora)

Esta función incrementa la fiabilidad de la firma, coge le mensaje de texto y produce un salida de longitud fija. La parte matemática de esta función asegura que incluso si se modifica mínimamente el mensaje obtienes una salida totalmente distinta(esto es conocido como "digestión del mensaje" (message digest). La clave privada y el digerido son usados para generar la firma, que es transmitida con el texto claro que conforma el mensaje. La función hash se asegura que nadie pueda coger tu firma y usarla como la suya propia ya que en tal caso se produciría un fallo en la verificación.
La firma digital es la principal forma de verificación de la llave pública.

### Certificados Digitales

Es claro que cuando usas el sistema de llave pública quieres  estar seguro de que usas la clave de encriptación del destinatario correcto. Aparece aquí un nuevo problema de confianza, es decir, imagina que alguien (un malhechor) te envía una llave falsa con el nombre de una persona con la que te escribes, entonces encriptas y envías la información a ese villano. Por tanto, es muy importante (en esto de la clave pública) que  te asegures de que usas la clave pública del destinatario. Para esto una manera un tanto peregrina sería el que el encriptar tan sólo esas claves cuyo dueño te haya entregado en persona (en un disquete, por ejemplo). Pero obviamente, esta no es una solución viable en muchos casos, puede suceder que no conozcas a la persona destinataria o que está en un lugar remoto en la isla de Madagascar.

Los certificados digitales simplifican la taréa de encontrar la clave correcta. Un certificado es información que puede ser utilizada como un certificado físico, este es incluido dentro de la clave pública para ayudar a verificar la validez de la clave. Son utilizados para evitar que la gente sustituya la clave de una persona por otra.  

Un certificado digital consiste en:

1. Llave Pública.
2. Información del Certificado  (información sobre el usuario: nombre,ID y cosas así)
3. Almenos una firma digital.

La firma digital en un certificado nos muestra que alguien aprueba la información certificada. Ésta no atestigua firmemente la autenticidad del certificado, sólo garantiza que el certificado es una llave pública que adjunta algunos datos de identificación. La mayoría de los beneficios que consigues con los certificados los obtienes cuando es necesario intercambiar llaves públicas cuando es imposible hacerlo en mano, pero esto es sólo conveniente hasta cierto punto, a veces es necesario poner todas las claves en un único lugar de almacenamiento, intercambio de llaves públicas con cualquiera que las necesite. Los sistemas que almacenata este tipo de datos son llamados Servidores y sistemas de Certificado (Certificate Servers and Systems),los que aportan además características adicionales de administración de llaves son llamadas Infraestreucturas de llave Pública (PKI Public Key Infraestructures)

Los Servidores de Certificados (cert server /key server) no son más que una base de datos que permite a los usuarios enviar y recibir certificados digitales. Este servidor puede, y normalmete lo hace, proporcionar herramientas de administración lo que permite que las compañías mantengan sus normas de seguridad y rollos así.

La Infraestructura de Clave Pública (ICP, en inglés  PKI) tiene las mismas características de un servidor de certificados pero además proporciona utilidades de manejo de de certificados, nos permite editar,cancelar,almacenar, restaurar y confiar certificados.  Las ICP introdicen la Autoridad de Certificados (AC, en inglés CA ;-)), que es una entidad humana que que tiene la autorización de expedir para los usuarios de una empresa. Una AC crea certificados y los firma digitalemte, usando claves privadas de AC. Si confías en AC, casi siempre puedes estar seguro del dueño de su certificado 

#### Formatos de los Certificados

Un certificado es información de identificación que es mezclada con la llave pública y la firma de alguien en el que confías (a la hora de probar su identidad). Si hablamos de PGP, éste reconoce dos tipos de certificados:

   1. Certificados PGP
   2. Certificados X.509

Un certificado PGP consiste en:

  1. en número de version, lo que identifica la versión del PGP utilizado 
     para crear la clave asociada.
  2. La llave pública del cartificador junto con el algoritmo de la llave 
     que puede ser: RSA DH o DSA.
  3. Periodo de validez del certificado, que indica la fecha de 
     expiración del certificado.
  4. Algoritmo simétrico de encriptación para la llave.Esto indica el algoritmo 
     de encriptación que prefiere el dueño del certificado. Estos algoritmos 
     son: CAST, IDEA, o Triple-DES.
 
### Validación (Validity) y Confianza

La validez es la seguridad que tienes de que algo pertenezca a su dueño real. Como la llave pública o el certificado, por ejemplo. La validez es muy importante en los sistemas de clave pública donde tienes que saber si el certificado es auténtico o no.

Cuando estás seguro de que un certificado pertenece a alguien, puedes añadir una copia en tu llavero (keyring) para atestiguar el hecho de que comprobaste ese certificado y que era auténtico y si exportas la firma a un servidor de certificados otras personas sabrán que tú has dado por bueno tal certificado. Para creer a alguien que ha aprobado un certificado tienes que confiar en él. Puedes comprobar tal validez, puedes quedar en ser el receptor de un mensaje y obtener su llave en mano. 
  
Otra forma es usar un fingerprint. El fingerprint de PGP es un Hash de certificado, éstos son únicos. Puede aparecer como un número hexadecimal o una serie de palabras biométricas con un distintivo fonético. Cuando tienes fingerprints y conoces la voz del dueño, sólo tienes que llamarle y pedirle que lea el suyo. Pero a veces no conoces su voz, en tal caso tienes que recurrir a un tercero, como por ejemplo un AC.

Pero no olvides que a menos que el dueño de la llave te la de en mano, es necesario que confíes en alguien,un tercero, cuya clave sea válida.

### Claves y frases de paso (Passwords and passphrases)

Casi todos los días, cuando usas un ordenador necesitas introducir una clave secreta para acceder a cierta información, por lo que debes de estar familiarizado con esta. Si no, - te has equivocado de tutorial.

Una  frase de paso es una versión más larga que una clave, y es supuestamente más segura. Éstas te ayudan a estar más seguro ante los ataques de diccionario  (comprometiendo la seguridad de PGP será cubierta en la Parte III - Comprometiendo a PGP).  Tlas mejores frases de paso son relativamente largas y complejas, contienen varios caracteres. PGP usa una frase de paso para encriptar tu llave púclica utilizando un Hash de tu frase de paso como clave secreta, esto es,se usa para desencriptar y usar tu clave privada.

Una frase de paso debe de ser algo que te sea fácil de recordar y simultáneamente difícil para otros de adivinar. Debe ser algo que esté firmemente establecido en tu memoria, y no algo que se te ocurriera en un momento ya que si olvidas tu clave privada es totalmente unútil y no podrás hacer nada al respecto (si no las hackeas, y quién sabe?)

<-- EOF -->
---
layout: post
post_id: estandarcolores
lang: es
title: "Códigos de colores EIA/TIA 568 y Telefonía"
description: "Asignaciones de los pines de colores del cableado estructurado"
keywords: "cableado estructurado, codigo colores, pines, cat5"
comments: false
categories: 
  - tutorial
---

Autor: Juan Manuel Merlos Tévar  (jmmerlos @ merlos . org) 

Fecha: Sept 06

##Introducción

Actualmente, en las redes de cableado estructurado, una práctica habitual para dar los servicios de voz y datos consiste en realizar toda la instalación con un único tipo de cable de red. Este cable tiene 4 pares trenzados y soporta los estándares Cat5, Cat5e o Cat6, es decir, es el típico cable para la red ethernet. Este tipo de redes suelen llamárse redes VDI (Voice and Data Integration Networks).Para situarnos un poco, veamos cómo sería la topología de la red. 

Siguiendo esta estructura de cableado único para cada usuario tendremos una o varias rosetas con tomas RJ45. De cada toma partirá un cable de red que terminará en un armario o recinto de telecomunicaciones donde dentro de un bastidor de 19" tendremos un panel de parcheo al que se conectarán los cables provenientes de las tomas de usuario en uno de sus extremos y, en el otro extremo, el panel dispondrá de una toma RJ45 para cada toma de usuario. 

En ese mismo rack, generalmente, tendremos también los equipos de telecomunicaciones como pueden ser los switch, los   servidores y las centralitas telefónicas. De este modo, si, por ejemplo, la toma de usuario 17 se ha empleado para un servicio de datos se conectará un latiguillo que unirá la toma del panel de parcheo correspondiente a la toma de usuario 17 con un swich. En caso de que a la toma de usuario 17 un día se conectara un teléfono, el administrador de la red sólo tendría que conectar ese latiguillo a la centralita telefónica. Así, este tipo de redes aporta bastante versatilidad ya que una misma toma en un momento dado se le puede dar un uso y en otro momento dado se le puede dar otro. Además, el disponer de una red de este tipo supone estar preparado para tener VoIP cuando el uso de esta tecnología se dispare definitivamente.

Bien, ¿Pero cómo es que esto de utilizar las mismas tomas para dos servicios distintos funciona? ¿y cuáles son las asignaciones de los pines para que esto sea posible? ¿Podría utilizar una misma toma para dar servicio telefónico y servicio de red a la vez? En este texto se intentará dar respuesta a estas preguntas.

Comenzaremos por la asignación de los pares en función del servicio.

## Código de colores Telefonía. Tomas RJ11

En telefonía analógica sólo hace falta un par para dar el servicio, sin  embargo, en telefonía digital suelen emplearse 2 pares. El conector utilizado en telefonía es el RJ11 que dispone de 6 pines y es el que tenemos todos en los teléfonos de casa. De esos 6 pines sólo se utilizan los 4 centrales. Los colorés que se suelen asignara estos 4 cables son de izquierda a derecha: negro (N), rojo (R), verde (V) y amarillo (A). 



             RJ11
     ---------------------
         Pin 1 2 3 4 5 6
             | | | | | |
       Color   N R V A
     ---------------------


Los dos pines centrales, el rojo y verde son los que se utilizan en telefonía analógica.

## Código de colores redes de datos Ethernet. Tomas RJ45

Los cables de datos tienen 4 pares diferenciados por colores: naranja, verde, azul y marrón. Cada par tiene un cable de su color con rayas blancas y el otro cable de color liso.

Principalmente hay dos estándares de asignación y ordenación de los pines y los colores: T568A y T568B. El más usado es el T568B:


         RJ45 T568B
    ------------------------------
      Pin  1  2  3  4  5  6  7  8  
           |  |  |  |  |  |  |  |  
    Color B/N N B/V A B/A V B/M M
    ------------------------------

	Leyenda:

	B/N = Blanco-Naranja
	N   = Naranja
	B/V = Blanco/Verde
	A   = Azul
	B/A = Blanco Azul
	V   = Verde
	B/M = Blanco Marrón
	M   = Marrón
  

Las conexiones Ethernet 10BaseT (10 Mbits) y 100BaseT (100 Mbits) tan sólo usan 2 de los 4 pares siendo asignados por el estándar los pares Naranja y Verde, quedando los otros dos para una conexión telefónica o para una segunda conexión de datos.

Las funciones asignadas a cada pin serían:

<pre>
  Pin   Color  Núm   T568
               Par   Name
  -----------------------------
   1    B/N    1      TxData +
   2    N      1      TxData -
   3    B/V    2      RecvData +
   4    A      3      
   5    B/A    3      
   6    V      2      RecvData -
   7    B/M    4
   8    M      4
</pre>

Nótese que los pines impares tienen siempre un cable rayado.

Como el lector puede observar en la forma de ordenar los cables en el estándar T568B es que los pares 2 (verde) y 3 (azul) están situados en los pines centrales 3, 4, 5 y 6 que serían precisamente los pares que utilizaría una extensión telefónica digital. En caso de que la extensión fuera analógica se utilizaría símplemente el par 3 (azul).

Así, si tenemos un teléfono analógico conectado en una toma RJ45 tendríamos que quitar su conector RJ11 y ponerle un conector RJ45 con los pines asignados de esta forma


      Pin     Color  Pin   Color   
      RJ11    Tlf    RJ45  T568B
      --------------------------
                     1     B/N
        1      -     2     N
        2      N     3     B/V
        3      R     4     A
        4      V     5     B/A
        5      A     6     V
        6      -     7     B/M
                     8     M


Es decir, el negro iría al pin 3 del RJ45, el rojo al 4, el verde al 5 y el amarillo al 6 o en caso de tener una extensión analógica con conectar los cables rojo y verde bastaría.

## Aprovechando los 4 pares

Como hemos visto, las tomas de red de hasta 100 Mbits sólo emplean 2 de los 4 pares y el servicio telefónico también utiliza 1 o 2 pares. Entonces, el lector tal vez se esté preguntando si podríamos utilzar el resto de los pares de forma simultánea. La respuesta es sí. Sólo hay que jugar con las asignaciones que le demos a los pines. 

No obstante, lo que en este apartado se comenta no debe utilizarse en un proyecto de cableado estructurado nuevo, no obstante, a mi juicio, sí que puede ser de gran utilidad a la hora de ofrecer una solución económica en una red que se está quedando pequeña. Además, hay que tener en cuenta que aunque FastEthernet (100 Mbits) sólo utilizar dos de los pares, Gigabit Ethernet (1 Gbps) ya utiliza los 4 pares del cable.

Nos vamos a plantear dos situaciones:

### Situación 1: 1 toma de usuario se utiliza para servicio de red y servicio telefónico analógico.

En el mercado existen duplicadores de tomas RJ45 que símplemente lo que hacen es duplicar el los pines uno a uno sacando de una única toma 2 tomas. Hay de dos clases, unos que incorporan un pequeño latiguillo y otros que son como una especie de ladrón similar a los que utilizamos en las redes eléctricas. El primero se utiliza en el panel de parcheo, ya que en el panel las tomas están muy juntas y no tenemos espacio. El segundo, que es más económico, si es posible, se utiliza en la toma de usuario.

Una vez que tenemos los duplicadores puestos es momento de reasignar pines. Como vimos el estándar T568B utiliza los pares 1 y 2. Si el teléfono que vamos a utilizar es analógico, ya está todo hecho, símplemente tendremos que conectar en la parte de usuario el teléfono a una de las tomas del duplicador y el cable de datos a la otra toma. En la parte de l panel de parcheo una de las tomas irá conectada al switch y la otra a la centralita telefónica. No obstante hay que tener precaución en una cosa. Imaginemos que la tarjeta que conectamos es Gigabit Ethernet, aunque nuestra red sea de 100 Mbps la tarjeta está preparada para usar los 4 pares y mientras que ethernet funciona a 5V pico a pico, el teléfono analógico funciona a 48V. Por tanto, sería conveniente utilizar latiguillos que sólo utilizaran los pares asignados, es decir, los pares 1 y 2 para la toma de datos y el par 3 para el teléfono. 

Como ejercicio queda para el lector pensar en cómo habría que realizar los cruces si el teléfono fuera digital.

#### Situación 2: Dos tomas de red.

Bien, ahora vamos a utilizar la toma de red para dos servicios de datos. Una toma está resuelta, simplemente tendría asignados los pines según el estándar T568B. Para la otra toma habría que hacer dos cables con las siguientes asignaciones:


        Extremo1            Extremo 2
        Pin      Color      Pin  
        1        B/N        4	  
        2        N          5
        3        B/V        7
        4        -          -
        5        -          -
        6        V          8
        7        -          -
        8        -          -


Así la forma de conexión de esta segunda toma sería la siguiente:

<pre>
 PC --> Extremo1 -- cable -- Extremo2--> Duplicador --> Toma --> Cable --> Panel 
 Panel --> Duplicador --> Extremo2 --> Extremo1-->Swich 
</pre>

Una vez más, puede que estemos usando una tarjeta Gigabit Ethernet en una red de 100Mbps, por tanto sería conveniente utilizar cables con los pares grimpados de los pines asignados.

## Conclusiones


Las ventajas de utilizar en una red de cableado estructurado cable de red de 4 pares es que, a pesar de se un poco más caro el metro lineal de cable ofrece una versatilidad mayor ya que se puede utilizar esa misma toma en un momento dado para datos o para teléfonía. Si en un momento dado cambiamos el uso tan sólo habría que cambiar el latiguillo del armario de telecomunicaciones que corresponde a esa toma de un switch a una centralita telefónica o viceversa.

También, hemos visto que de una misma toma, jugando un poco con las asignaciones de los pines se pueden sacar los dos servicios de forma simultánea o incluso dos tomas de red por un mismo cable.

Esta última práctica no es recomendable a la hora de pensar en realizar un proyecto de cableado estructurado ya que en las redes de Gigabit Ethernet ya se usan los 4 pares del cable de red. No obstante, para el administrador una red que se está quedando pequeña puede resultar un buen apaño.

Por último espero que al lector le haya servido para entender mejor el funcionamiento de estas redes que utilizan un único tipo de cable para integar voz y datos.






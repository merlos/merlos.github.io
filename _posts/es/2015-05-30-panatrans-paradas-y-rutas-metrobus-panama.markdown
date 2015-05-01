---
layout: post
title:  "Panatrans, paradas y rutas de Metrobus de Panamá"
post_id: panatrans-presentacion
disqus_comments: true
lang: es
keywords: "panatrans, metrobus, panama, bus panama, paradas bus panama, mibus panama, attt panama" 
categories:
  - github
image: '/assets/posts/2015-panatrans/panatrans-twitter-card.png'
---

Estas últimas semanas he estado en un proceso de transición profesional. Esto me ha dado la oportunidad de tener algo de tiempo que decidí usar para aprender algunas de las nuevas herramientas. Como soy partidario del _learn by doing_ o _aprender haciendo_, mi idea era hacer un pequeño proyecto en el que adquirir el conocimiento. Gracias a esta experiencia en primera persona, posteriormente podré tomar mejores decisiones a nivel profesional.

Por otro lado, si me ponía a trabajar en algo, quería que tuviera tanto un impacto social como personal y que fuera coherente con mis convicciones. Así es como nació la idea de __[Panatrans](http://www.panatrans.org), un mapa colaborativo con las paradas y rutas de Metrobus de Panamá__.

![ios GPS Tracker]({{page.image}})


## El problema

Actualmente resido en Ciudad de Panamá. Esta urbe tiene aproximadamente 1.5 millones de habitantes y consta de un servicio de bus público llamado __Metrobus__ que, aunque ciertamente es MUY mejorable, __lo usa entre un 20% y un 35% de la población de la ciudad cada día__ (unos 730.000 viajes según fuentes oficiales). 

Desde mi punto de vista hay __problema__ muy importante en el sistema y es __la falta de información__. Cuando llegas a una parada no sabes qué rutas pasan por la misma, ni la frecuencia, ni los horarios. Solo sabes que hay una parada de bus ¡nada más! De hecho, cada parada ni siquiera tiene un identificador visible como puede ser un nombre o un número.

![Parada de metrobus](/assets/posts/2015-panatrans/parada-bus-panama.jpg)


Uno puede pensar que aunque no esté in situ, en [su web](http://www.mibus.com.pa) o en una app móvil existe algo de información. Un lugar donde puedas ver, para cada parada, qué rutas pasan.

Efectivamente, hay "algo" de información. Mi Bus, la empresa responsable de la operación del servicio, ha publicado unos ficheros PDF con la información de las rutas. En su web dispones de un desplegable con ~200 entradas y cada entrada te permite visualizar un PDF con la información de una ruta.

![Captura de web de Metrobus](/assets/posts/2015-panatrans/captura-mibus-rutas.png)


Navegando por esta información te puedes encontrar con varios problemas. En ocasiones los PDF no existen, otras veces están anticuados y sin información actualizada de los cambios que ha habido en las rutas. También puede suceder que haya rutas repetidas o que haya PDFs de rutas que ya no existen, incluso todo lo contrario, que haya rutas que existen pero no aparecen en la web. 

![Captura de web de Metrobus](/assets/posts/2015-panatrans/pdf-mibus.png)

Debido a esta estructura de una ruta por PDF, si quisieras saber qué rutas pasan por una cierta parada tendrías que ir PDF a PDF para ver si pasa por ahí. 

Esta falta de información genera varios problemas:

* __Falta de independencia del usuario__. Por ti mismo no puedes manejarte en el sistema. Necesitas preguntar a alguien (otros pasajeros, conductores) para poder conocer cómo llegar a un destino nuevo.

* __Infrautilización por desconocimiento por parte de los usuarios__. Si no sé que existe una ruta no voy a tomarla. Por ejemplo, a mí me ha sucedido que quería ir a una zona de la ciudad, pero, sin embargo, no encontré ninguna ruta ni paradas que hubiera cerca cuando sí las había. Eso te obliga a usar otros medios como el taxi, degenerando en una infrautilización por desconocimiento.

* __Uso poco óptimo del servicio__. En otra ocasión, quería ir a una calle y la parada más cercana que conocía estaba a 1km. El resto del camino lo haría a pie. Sin embargo,  casi llegando a mi destino, me encontré con una parada de otra ruta que desconocía y que me hubiera sido más conveniente usar (uso poco óptimo).

Además, esta carencia información para el usuario demuestra una __falta de voluntad por parte de los gestores de dar un buen servicio__.

## La solución

La solución planteada, [Panatrans](http://www.panatrans.org), tenía que tener varios aspectos en cuenta: 

* Dado que no había una fuente de información, el sistema tendría que __usar la inteligencia/concimiento colectivo__. Tenía que ser ser una herramienta colaborativa, en la que el contenido fuera generado por los usuarios. Tomé como ejemplo [Wikipedia](http://www.wikipedia.org) y [Open Street Map](http://openstreetmap.org).

* El __tiempo (~1 mes) y los recursos (yo y yo mismo) eran limitados__, por lo que el alcance tenía que estar controlado. Por ejemplo, aunque este proyecto está intrínsecamente ligado a la movilidad, tuve que descartar hacer apps móviles. Sólo me daba tiempo a hacer una web. De hecho, que fuera _responsive_ lo consideré dentro del "espero que me de tiempo...". El objetivo de esta primera fase sería ofrecer un interfaz web para introducir y ver los datos de las paradas y rutas de metrobus.

  También descarté crear un sistema control de usuarios. Por dos motivos, uno por falta de tiempo y por simplificar, y dos, porque el no obligarte a registrarte me parecía que te da mayor libertad como usuario y rompe una barrera de entrada para colaborar. Aunque, he de reconocer que tiene el potencial problema del vandalismo.

* Sin embargo, de raíz quería que estuviera __preparado para dar un futuro soporte a apps móviles__, es decir, tenía que disponer de una API. Además, quería que la web fuera también un cliente puro basado en JavaScript, sin código generado en servidor. Este tipo de webs son las que se llaman SPA ([Single Page Applications](http://en.wikipedia.org/wiki/Single-page_application)), y constan sólo de JavaScript, HTML y CSS. Y son la tendencia actual en los nuevos desarrollos.

![Estructura de datos](/assets/posts/2015-panatrans/arquitecture.png)

* Adicionalmente, quería que fuera un proyecto de basado en __código libre y datos abiertos__ (datos estructurados y procesables). En realidad, cuando pensaba en cómo hacer Panatrans, me imaginaba en cómo me gustaría a mí que fuera el software que utilizara la administración o una empresa que ofreciera un servicio público. 

>    "Este proyecto está financiado por los contribuyentes, es público, 
>      por lo que el software pertenece a todos y los datos pertenecen a 
>      todos. Parte de mi labor es facilitar que todo esto
>      sea reutilizable y que se pueda innovar basándose en ellos."

  Esta forma de concebir los proyectos públicos de software convierte al __Estado en un facilitador de la innovación__. Al igual que las infraestructuras (carreteras, ferrocarriles, aeropuertos) hacen prosperar empresas del sector privado, en el mundo del software y los datos, el estado ayuda al sector privado si ofrece software y datos abiertos. 
      
* Siguiendo esta misma filosofía, los _frameworks_ que usara tenían que ser software libre. Por ejemplo, para los mapas descarté usar Google Maps API, en su lugar usé, [leaflet](http://www.leafletjs.com/) + Open Street Maps, que no tienen nada que envidiarle y son abiertos.


Teniendo en cuenta todo esto, se dividió la parte de software del proyecto en dos partes:

 1. __Una API muy sencilla__ que respondía a cosas como: dame la información de tal parada, dame los datos de tal ruta, dime qué paradas hay cerca de esta localización. Se desarrolló en ruby on rails y está publicado en el [proyecto panatrans-api](http://github.com/merlos/panatrans-api)
 
 2. __Un visor y editor web__ cuyo protagonista principal es el mapa. Publicado en el proyecto [panatrans-web](http://github.com/merlos/panatrans-web)
 
 
 ![Captura de Pantalla de Panatrans](/assets/posts/2015-panatrans/screenshot-panatrans.png)
 
### Los datos

A la hora de estructurar la base de datos usé como punto de partida [GTFS](https://developers.google.com/transit/gtfs/), que es el formato de la información que le facilitan las empresas de transporte público a Google para que lo incorporen a Google Maps y muchas otras herramientas. Me atrevería a decir que es un estándar de facto. 

Aunque GTFS fuera una estructura muy compleja, sí que me permitía tener una base extensible. No quiero entrar en detalles, pero básicamente, la información que se recopila en Panatrans es:

 * Nombre y geolocalización de las paradas (stops)
 * Nombre y dirección web "oficial" de las rutas (routes)
 * La lista/secuencia de paradas para cada ruta (stop_sequences)
 
![Estructura de datos](/assets/posts/2015-panatrans/data-structure.png)

Dado que una ruta puede tener varios trayectos, de ida y  de vuelta), también existe este concepto (trip) en la estructura de datos. Cada trayecto es el que tiene asociadas varias paradas.

El formato de exportación de los datos es [CSV](http://en.wikipedia.org/wiki/Comma-separated_values). Un formato que cualquier hoja de cálculo puede leer. 

Tienes más información sobre esto en el proyecto [panatrans-dataset de GitHub](http://github.com/merlos/panatrans-dataset/).

Aunque es una parte más aburrida, para que tenga sentido el proyecto hay que meter los datos. De hecho, ya metí como __750 paradas y unas 40 o 50 rutas__ en la base de datos. La parte positiva es que al ser yo mismo un usuario me permite conocer mejor los fallos.

## Presentando el proyecto en FLISOL 2015

Este pasado sábado 25 de abril, tuve la suerte de ser invitado como ponente a la [Feria Latinoamericana de Instalación de Software Libre de Panamá (FLISOL)](http://flisolpanama.org). Ahí presenté el proyecto [Panatrans](http://www.panatrans.org).

![Yo presentando](/assets/posts/2015-panatrans/floss-pa.jpg)

Aquí están las diapositivas de la presentación [disponibles en SpeakerDeck](https://speakerdeck.com/merlos/panatrans-flisol-panama-2015):

<script async class="speakerdeck-embed" data-id="e0e997a5755244feb850bd083fdbfdf5" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>



# Resultados y acogida

__Desde el punto de vista técnico estoy contento con la API__, creo que es muy sencilla, el código es fácil de leer y además incluye _testing_ automatizado (no seguí un [TDD](http://en.wikipedia.org/wiki/Test-driven_development) puro, pero sí que tiene _tests_). Esta técnica no la había usado hasta hace poco y es un gran invento, muy útil cuando hace falta refactorizar el código o hacer "cambios gordos". Quizás para esta primera fase, a la API sólo le queda meter algo de seguridad (bien control de versiones o pensar en implementar lo de los usuarios), y la posibilidad de permitir actualizaciones incrementales, es decir, que la API te informe de los cambios que hubo desde una determinada fecha.

En cuanto a la interfaz web, aunque sí que funcionalmente está bastante avanzada,__no la considero finalizada__. Tiene algunos _bugs_, las búsquedas todavía están algo verdes, hay algunas incoherencias/falta de uniformidad tanto en la interacción como en el aspecto visual, falta integrar la búsqueda de paradas y rutas en el propio mapa (ahora están en páginas separadas), la geolocalización del usuario no funciona bien todavía, y la interacción en el móvil todavía está sin pulir. Pero, bueno... tiempo al tiempo.

Ya desde un punto de vista de la acogida del proyecto, el balance también es positivo. Aunque de forma timida, algunos usuarios han aportado su granito de arena y los comentarios que me dieron en el FLISOL fueron muy positivos, incluso me han contactado responsables de entidades gubernamentales de Panamá. 

También, [un desarrollador](https://twitter.com/zubietaroberto/status/593591842215751681) me ha contactado mostrando su interés en hacer la app para Android. De hecho ya tiene una versión funcional.

En las redes sociales, a pesar de que apenas estamos empezando el proyecto tiene ~50 seguidores en twitter y los tuits tienen bastante "engagement", he incluso un medio de comunicación local con más de 50.000 seguidores se ha hecho eco:

<blockquote class="twitter-tweet" lang="en"><p lang="es" dir="ltr"><a href="https://twitter.com/hashtag/ElPa%C3%ADsDD?src=hash">#ElPaísDD</a> Mapa colaborativo con rutas y paradas de <a href="https://twitter.com/MetroBusPanama">@MetroBusPanama</a> <a href="https://twitter.com/panatrans">@panatrans</a> Da tu aporte <a href="http://t.co/CC3u0rLPK3">http://t.co/CC3u0rLPK3</a> <a href="http://t.co/I83uZINQFR">pic.twitter.com/I83uZINQFR</a></p>&mdash; Diario DiaaDia (@DiaaDiaPa) <a href="https://twitter.com/DiaaDiaPa/status/593536130357788672">April 29, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

# Corolario

La verdad es que estoy contento: 

 * He aprendido cosas nuevas muy útiles para mi carrera profesional.
 * He aportado mi granito de arena a la sociedad y al bien común.
 * Me han invitado a dar una charla y he conocido a gente interesante.
 * Parcialmente he resuelto un problema que tenía: mi desconocimiento de las rutas de Metrobus. 



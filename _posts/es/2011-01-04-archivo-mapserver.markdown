---
layout: post
title:  "Archivo: Artículos de Mapserver"
post_id: mapserver-archive
disqus_comments: false
lang: es
keywords: "mapserver, mapas, articulos, archivo, phpmapscript, postgis, postgresql" 
categories:
  - archivo
---

En mi proyecto fin de carrera, allá por el 2005, trabajé con [Mapserver](http://mapserver.org/), una excelente herramienta para generar mapas y planos a partir de datos georreferenciados.

__A modo de archivo, aquí dejo los artículos que escribí:__
 
{% assign posts = site.categories["mapserver"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>
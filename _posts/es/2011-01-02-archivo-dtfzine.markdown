---
layout: post
title:  "Archivo: Mis Artículos para el DTFzine"
post_id: linux-compilation
disqus_comments: false
lang: es
keywords: "seguridad, es" 
categories:
  - archivo
---

Durante mis años mozos estuve escribiendo en un magazine electrónico llamado DTFzine en el que escribía sobre temas relacionados con telecomunicaciones, seguridad y redes.

__Aquí mantengo los artículos que escribí para el ezine__
 
{% assign posts = site.categories["dtfzine"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>
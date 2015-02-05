---
layout: post
title:  "Archivo: Recopilación de mis tutoriales de GNU/Linux"
post_id: linux-compilation
disqus_comments: false
lang: es
keywords: "gnu,gnu linux, debian, tutoriales, como, howtos, en español" 
categories:
  - archivo
---

Entre de 2000 y 2006 no sólo fui un usuario de [Debian GNU/Linux](http://www.debian.org), sino que además cada vez que aprendía cómo configurar algo, escribía un pequeño documento de texto (generalmente en texto plano)

Aquí dejo los artículos que escribí como __archivo__
 
{% assign posts = site.categories["linux"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>
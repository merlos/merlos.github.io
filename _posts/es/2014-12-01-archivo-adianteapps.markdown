---
layout: post
title:  "Archivo: Blog adiante apps - promoción app móvil"
post_id: adianteapps-archive
disqus_comments: true
lang: es
keywords: "update, new version, wordpress, get rid off, merlos, personal web" 
categories:
  - archivo
---

Entre septiembre de 2013 y diciembre de 2014 he estado dedicando parte de mi tiempo a la generación de contenidos para el blog de __[adiante apps](http://www.adianteapps.com)__, el servicio de creación de apps móviles para pequeñas y medianas de la startup de la que he sido fundador.

Aquí destaco algunos que son interesantes __para alguien que vaya hacer una app móvil y necesite promocionarla__:
 
{% assign posts = site.categories["adianteapps"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>

<h3>Content marketing<h3>
<p>También se hizo alguna colaboración en otros blogs como el de todostartups:

{% assign posts = site.categories["todostartups"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>
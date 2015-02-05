---
layout: post
title:  "Archivo: Artículos de mi antiguo blog"
post_id: wordpress-archive
disqus_comments: false
lang: es
description: "Artículos de mi blog anterior de wordpress"
keywords: "" 
categories:
  - archivo
---

Archivo de artículos que escribí en mi blog entre de 2006 y 2011 

### Archivo de artículos blog merlos.org
 
{% assign posts = site.categories["blog-archive"] %}  
<ul class="post-list">
{% for post in posts %}
<li> {% include post-list-item.html post=post %}</li>
{% endfor %}
</ul>
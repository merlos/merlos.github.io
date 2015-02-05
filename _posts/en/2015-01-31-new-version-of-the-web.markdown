---
layout: post
title:  "New year and new web!"
date: 	  2015-01-31 17:00:00
post_id: blog1
disqus_comments: true
keywords: "update, new version, wordpress, get rid off, merlos, personal web" 
categories:
  - merlos 

image: 'assets/lucky-cat.jpg'
---

After a couple of years without caring about it, I've updated this website. This time it has not only been a simple makeup, but a whole change. The goal with this update is to break the barriers that made me not updating the contents.

Additionally, I wanted to:
 - Stop using a database (mysql, pg, ...)
 - Some look & feel changes.
 - Simple content updates / blogging
 - Use a free hosting if possible.

Apart from these, I've decided to get rid of almost all the contents of the old web. I felt they were outdated and no longer useful. These contents included some tutorials on how install and configure GNU/Linux, Mapserver or my articles of the DTFzine. Most of these texts were written in the early 2000s...  I'm only keeping the tutorial on [How to make the Pringles Antenna (in Spanish)](/documentos/articulos/41-construccion-de-una-antena-casera-pringles.html), which I think is still useful.

I still have to decide if I am going to import the old blog posts handled by an extremely outdated [wordpress](http://www.wordpress.org). Definitely, Using a local copy of wordpress has two disadvantages. First, it is recommended to update it from time to time to a newer version for security reasons, and I never used to do this. Second, every time you migrate to a new hosting you have to configure it again (database and checking that the upload folders have the right permissions, etc.).

##The solution: Jekyll + GitHub.

I had already heard about [Jekyll](http://jekyllrb.com) to create websites easily, but never looked more deeply into it, but it turns out to be a great solution for me. Jekyll generates an static website (the output is pure HTML) but the input are templates, HTML, Markdown, sass, cofee script, etc. Instead of generating the HTML for each request, it prebuilds all the HTML for each page of the site. This is great for fairly static websites such as mine. 

One of the best thing is that you can upload and host it [directly to your GitHub account](https://help.github.com/articles/using-jekyll-with-pages/). That is, you update your website and keep your git repository up to date at the same time. __Isn't it awesome?__

### So, what's next?

Well, let's see if the change helps me to blog more often...




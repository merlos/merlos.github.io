---
layout: post
lang: en
post_id: 2015-jekyll-auto-image
title: "Jekyll auto image plugin"
keywords: "jekyll, plugin, auto image, first image"
description: "Plugin for jekyll to get the first image of every post. Learn how to get the image of a page with jekyll."
categories:
  - github
  - jekyll
image: '/assets/posts/2015-jekyll-auto-image/sample-twitter-card.png'
---

Something that may be very useful while adding the meta information or listing your posts in jekyll is to have available the first image that appears on its contents.

You can add some `meta` elements that will make [your posts look more beautiful when sharing them on facebook](https://developers.facebook.com/docs/sharing/best-practices) or to create a [twitter card](https://dev.twitter.com/cards/overview):

![Example of twitter card](/assets/posts/2015-jekyll-auto-image/sample-twitter-card.png)


`jekyll-auto-image-plugin` allows you to find this first image easily. You have __[all the information on its github page](https://github.com/merlos/jekyll-auto-image)__.

The plugin can be easily installed as a gem, and you can assign a default image for the site on the `_config.yml` file. Unfortunately, if you are hosting you [jekyll web on github pages](https://help.github.com/articles/using-jekyll-plugins-with-github-pages/) this plugin won't work. A workaround is to upload the output of jekyll, i.e. the `_site` folder, instead of the jekyll source code.






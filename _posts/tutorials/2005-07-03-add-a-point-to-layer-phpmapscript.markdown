---
layout: post
post_id: addpoint
lang: en
title: "Add a point dynamically to a layer in PHPMapscript 4.2"
description: "We are going to add a point on the position the user clicked on a map using PHPMapscript"
keywords: "mapserver, php, phpmapscript"
comments: false
categories: 
  - mapserver
---

#Add a dynamic point to a layer

This is a simple example of how to use PHPMapScript. It is intended to be for begginers (as me). We are going to add a point on the position the user clicked on a map.

On our MapFile, we have blank Point layer called "INLINE", This is the layer where we are going to add our dynamic point. Here you have a sample:

    LAYER
      NAME "INLINE"
      TYPE POINT
      STATUS ON
     CLASS
         NAME "0"
         STYLE
           COLOR 255 0 0 # red
           MAXSIZE 300 # default 50
           SYMBOL 'phone' #In my case was a nice phone image symbol
           SIZE 16
         END #style
     END #class
   END #layer

## PHP code

The source filename is `query2.php`

  <?php


  //Load the dynamic library.
  dl('php_mapscript.so');
  //dl('php_mapscript_42.dll'); //For WinDoS Users

  //Convert pixels to map units (got from PHPMapscriptSnippet1)
  function click2map ($click_x, $click_y) {
      global $map;
      $e= &$map->extent; //for saving writing
      $x_pct = ($click_x / $map->width);
      $y_pct = 1 - ($click_y / $map->height);
      $x_map = $e->minx + ( ($e->maxx - $e->minx) * $x_pct);
      $y_map = $e->miny + ( ($e->maxy - $e->miny) * $y_pct);

      return array($x_map, $y_map);
  }

  $map= ms_newMapObj('data/test2.map');
  //Convert pixels to map units
  $map_pt = click2map($_GET['image_x'],$_GET['image_y'],$map->extent);
  //Create the point
  $pt = ms_newPointObj();
  $pt-> setXY($map_pt[0],$map_pt[1]);

  //Draw the map and add the point
  $img = $map->draw();
  $layer = $map->getLayerByName('INLINE');
  $pt->draw($map, $layer, $img, 0 ,'yuhuu');
  $url = $img->saveWebImage();
  ?>

  < html>< head></ head>< body>

  <form method="get" action="query2.php" >
     <input style="border:thin solid black;" type="image" 
            name="image" src="<?php echo $url?>" />
  </form>

  < pre>
  <!-- Debug Lines -->
  <?php
  echo "GET\n";
  print_r($_GET);
  echo "Point:\n";
  print_r($pt); ?>
  ?>
  < /pre>
  < /body>
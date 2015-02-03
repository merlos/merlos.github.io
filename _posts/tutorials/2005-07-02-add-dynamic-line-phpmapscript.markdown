---
layout: post
post_id: addline
lang: en
title: "Add dynamic lines to Mapserver using PHPMapscript 4.2"
description: "PHPMapscript. Draw a line on the fly. Each time the user clicks on the image it is added that point to a line, then the line is drawn on the map."
keywords: "mapserver, php, debian, apache, dso"
comments: false
categories: 
  - mapserver
---

#Adding dynamic Lines in Mapserver using PHPMapscript

Here we have a sample code to ilustrate the usage of PHPMapScript 4.2. It allows an user to draw a line on the fly. Each time the user clicks on the image it is added that point to a line, then the line is drawn on the map.

Basically, the tasks this script does are:

   1. Create the map
   2. Create a line
   3. Add last point to the line
   4. Create the shape
   5. Add the line to the shape
   6. Add the shape to the layer
   7. Draw the map 

This is the layer "lines" used in the code:

    LAYER
      GROUP "user"
      NAME "lines"
      TYPE line
      STATUS on
     CLASS
         NAME "0"
         TEMPLATE "ttt_query.html"
         STYLE
           COLOR 255 0 0 # red
         END #style
     END #class
    END #layer

## PHP code

The file is called `query3.php`


	<?php
	
	dl('php_mapscript.so');
	//dl('php_mapscript_42.dll'); //For WinDoS Users

	//Convert pixels to map units got from 	PHPMapscriptSnippet1
	function click2map ($click_x, $click_y) {
    	global $map;
    	$e= &$map->extent; //Tip for saving type time
    	$x_pct = ($click_x / $map->width);
    	$y_pct = 1 - ($click_y / $map->height);
    	$x_map = $e->minx + ( ($e->maxx - $e->minx) * $x_pct);
    	$y_map = $e->miny + ( ($e->maxy - $e->miny) * $y_pct);

    	return array($x_map, $y_map);
	}


	// --------------- MAIN -----------------------

	$map= ms_newMapObj('data/test2.map');

	//Avoid register global=Off (that way it is not neccesary use $_POST[])
	import_request_variables("gP", "");

	if (isset($image_x) && isset($image_y)){
    //Convert pixels to map units
    $map_pt = click2map($image_x,$image_y);

    //Construct the line
    $line = ms_newLineObj();
    $line->addXY($map_pt[0],$map_pt[1]);
    if (is_array($prev_x)) { //Add points of the hidden input fields
        foreach ($prev_x as $i => $x){
            $line->addXY($x, $prev_y[$i]);
        }
    }
    //Create the shape object that will be added to the layer
    $shp = ms_newShapeObj(MS_SHAPE_LINE);
    $shp-> add($line);

    $layer = $map->getLayerByName('lines');
    $layer->addFeature($shp);
	}
	//Draw the map
	$img = $map->draw();
	$url = $img->saveWebImage();

	//Now add hidden fields to the form
	for($i=0;$i<$line->numpoints;$i++) {
    	$pt = $line->point($i);
    	$x = $pt->x;
    	$y = $pt->y;
    	$HTML_HIDDEN.="<input type=\"hidden\" name=\"prev_x[$i]\" value=\"$x\"/>";
    	$HTML_HIDDEN.="<input type=\"hidden\" name=\"prev_y[$i]\" value=\"$y\"/>";
	}
	?>

	<html><head><title>hi</title></head>
	<body>
	<form method="post" action="query3.php">
   		<input style="border:thin solid black;"type="image" name="image" src="<?php echo $url ?>" />
    	<?php echo $HTML_HIDDEN ?>
	</form>
	<a href="query3.php">Clear</a>
 	</body>
	</html>

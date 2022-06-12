---
layout: post
lang: en
author: Merlos
post_id: 2020-open-gpx-tracker
title: "How to use Ml5 with nodejs and puppeteer step by step"
keywords: "ml5, puppeteer, node, machine learning, web machine learning, image classification"
description: "Mach"
categories:
  - ml5
  - machine-learning
  - node
image: '/assets/posts/2015-open-gpx-tracker/open-gpx-tracker.png'
---

![ml5 - Nodejs - puppeteer logos](/assets/posts/2021-ml5/ml5-node-puppeteer.png)

# How to use Ml5 with nodejs and puppeteer step by step

In this article we are going to train and save a simple model using ML5 and NodeJS.

[ML5](https://ml5js.org/) is a high level machine learning library that is very easy to use and that behind the scenes uses [TensorFlow JS](https://www.tensorflow.org/js).

One limitation of ML5 is that it was developed to be used within a browser. According to the documentation ML5 will eventually natively support NodeJS, but at the moment of writing this article ml5 requires a browser to run.

The thing is that because it is so easy to use you may still want to use it also in a pipeline or in a NodeJS script.

Thankfully, we have [puppeteer](https://github.com/puppeteer/puppeteer) to help us overcome that limitation.
For those who do not know puppeteer, it is a headless browser based on Chromium that can be controlled programmatically using NodeJS.
What we will do is create the a simple HTML page with the ml5 script and then call puppeteer to run it.

For this article we are going to train an image classification model. We will develop it using a browser as a normal ml5 script. Then, we will just need to create a node script that will open that page in puppeteer, it will wait till the ml5 script is completed and it will download the output.

Besides this approach is very simple it still may have some limitations. For example, the number of images that can be loaded on the browser is finite, specially if you have many classes and many training samples.

Also, the model we will train is based in MobileNet which is a lightweight model that has low latency on mobile and embedded devices, but it may not be as accurate as you may need.

## The ML5 script

As example, using [transfer learning](https://en.wikipedia.org/wiki/Transfer_learning), we will train a classification model to differentiate between two types of skateboards: longboards (left) and regular street skateboards (right).

![Longboard vs skateboard](/assets/posts/2021-ml5/longboard-vs-skateboard.jpg)

The javascript code for training the modeñ that I will be using here is heavily based on the fantastic [ML5 tutorial of The Coding Train](https://www.youtube.com/watch?v=26uABexmOX4&feature=youtu.be&list=PLRqwX-V7Uu6YPSwT06y_AEYTqIwbeam3y) by [Daniel Shiffman](https://twitter.com/shiffman).

# Setup

First, we initialize our project

```bash
mkdir myproject
cd my project
npm init
```

When running `npm init` we will be asked a few simple questions. Don't worry too much about what you fill, if you need to change something you can always edit `package.json`.

Now let's install a couple of dependencies that we will be using. The first one is `puppeteer`, our headless browser and the second one is `serve`, a very simple http server. We will use it for serving the HTML file that is loaded by puppeteer.

```bash
npm install puppeteer
npm install serve
```

Now we are going to create the HTML file that will hold the script to train the model.

```bash
mkdir public
cd public
touch public/index.html
```

Now edit the file `public/index.html`and add some code

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Getting Started with ml5.js</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/ml5@0.5.0/dist/ml5.min.js"></script>
  </head>
  <body>
    <h1>Hello ml5</h1>
    <script>
      /* We will add the code to train our model here */
    </script>
  </body>
</html>
```

Now, let's run the server to validate it works

```bash
./node_modules/serve/bin/serve.js ./public/
```

Open your browser in http://localhost:5000 and you should see the text _Hello ml5_.

Alternatively, you can import the script using the attribute 'src' in the script tag

```html
<head>
  ... ...
  <script src="script.js"></script>
  ...
</head>
```

For this example, we are going to pre-load the images in the HTML, and then we will add them to the classifier. The images will go just after the `<body>` and before the `<script>`. In a more realistic environment you can [include the images dynamically](https://github.com/ml5js/ml5-library/issues/260).

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Getting Started with ml5.js</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/ml5@0.5.0/dist/ml5.min.js"></script>
  </head>
  <body>
    <!-- images to train the classifier -->
    <img src="./longboard1.jpg" id="longboard1" />
    <img src="./longboard2.jpg" id="longboard2" />
    <img src="./longboard3.jpg" id="longboard3" />
    <img src="./longboard4.jpg" id="longboard4" />
    <img src="./longboard5.jpg" id="longboard5" />
    <img src="./longboard6.jpg" id="longboard6" />

    <img src="./skateboard1.jpg" id="skateboard1" />
    <img src="./skateboard2.jpg" id="skateboard2" />
    <img src="./skateboard3.jpg" id="skateboard3" />
    <img src="./skateboard4.jpg" id="skateboard4" />
    <img src="./skateboard5.jpg" id="skateboard5" />
    <img src="./skateboard6.jpg" id="skateboard6" />

    <!-- images to test -->
    <img src="./d.jpg" id="longboard" />
    <img src="./skateboard.jpg" id="skateboard" />
    <script>
      /* We will add the code to train our model here */
    </script>
  </body>
</html>
```

Now, we have to write the code we will use to train the cad-longboard classifier. The steps we will follow are:

1. Get the classifier from the pre-trained model (MobileNet).
2. Add the images to the classifier.
3. Train the classifier with the new classes.
4. Download the trained model.

Below you have the code. It is fairly commented but if you need more info you can refer to the [ml5.featureExtractor documentation](https://ml5js.org/reference/api-FeatureExtractor/).

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Getting Started with ml5.js</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/ml5@0.5.0/dist/ml5.min.js"></script>
  </head>

  <body>
    <!-- images to train the classifier -->
    <img src="./longboard1.jpg" id="longboard1" />
    <img src="./longboard2.jpg" id="longboard2" />
    <img src="./longboard3.jpg" id="longboard3" />
    <img src="./longboard4.jpg" id="longboard4" />
    <img src="./longboard5.jpg" id="longboard5" />
    <img src="./longboard6.jpg" id="longboard6" />

    <img src="./skateboard1.jpg" id="skateboard1" />
    <img src="./skateboard2.jpg" id="skateboard2" />
    <img src="./skateboard3.jpg" id="skateboard3" />
    <img src="./skateboard4.jpg" id="skateboard4" />
    <img src="./skateboard5.jpg" id="skateboard5" />
    <img src="./skateboard6.jpg" id="skateboard6" />

    <img src="./longboard.jpg" id="longboard" />
    <img src="./skateboard.jpg" id="skateboard" />
    <script>
      let classifier

      const featureExtractor = ml5.featureExtractor("MobileNet", modelLoaded)

      // Once the model is loaded
      function modelLoaded() {
        console.log("Model Loaded!")

        classifier = featureExtractor.classification()

        // Retrain the network. You can use a for loop too :)
        classifier.addImage(document.getElementById("longboard1"), "longboard")
        classifier.addImage(document.getElementById("longboard2"), "longboard")
        classifier.addImage(document.getElementById("longboard3"), "longboard")
        classifier.addImage(document.getElementById("longboard4"), "longboard")
        classifier.addImage(document.getElementById("longboard5"), "longboard")
        classifier.addImage(document.getElementById("longboard6"), "longboard")

        classifier.addImage(
          document.getElementById("skateboard1"),
          "skateboard"
        )
        classifier.addImage(
          document.getElementById("skateboard2"),
          "skateboard"
        )
        classifier.addImage(
          document.getElementById("skateboard3"),
          "skateboard"
        )
        classifier.addImage(
          document.getElementById("skateboard4"),
          "skateboard"
        )
        classifier.addImage(
          document.getElementById("skateboard5"),
          "skateboard"
        )

        //addImage accepts a third argument that is a callback.
        classifier.addImage(
          document.getElementById("skateboard6"),
          "skateboard",
          imagesLoaded
        )
      }

      // Function that will be called once the images are loaded
      // It trains the model with the new categories
      function imagesLoaded() {
        console.log("do train", classifier.hasAnyTrainedClass)

        // train argument is a callback that has as argument the current lossValue.
        // When lossValue is null, it means the training is finished
        classifier.train(lossValue => {
          console.log("Loss is", lossValue)
          if (lossValue == null) {
            trainFinished()
          }
        })
      }

      // Called once the classifier is trained with the new classes
      function trainFinished() {
        // Get a prediction for that image
        console.log("train finished")

        // Examples to test the classifier
        // Examples to test the classifier
        classifier.classify(
          document.getElementById("longboard"),
          (err, result) => {
            console.log("is longboard?", result, result[0].label) // Should output 'longboard'
          }
        )
        classifier.classify(
          document.getElementById("skateboard"),
          (err, result) => {
            console.log("is skateboard?", result, result[0].label) // Should output 'skateboard'
          }
        )
        // Saves two files model.json and model.weights.bin
        classifier.save()
        // This is the signal to tell puppeteer we are done with the
        done = document.getElementById("done").style.display = "block"
      }
    </script>
    <p id="done" style="display: none;">Done!</p>
  </body>
</html>
```

What we have done until now is pretty similar to what you'll do using a regular ml5. Now, it's time for the magic.

## NodeJS script

The script is very simple, it navigates to the page of our local server, allows to download the files (our model) and wait till the model is trained which is signaled by displaying an element with the id "done" in the HTML.

```javascript
//index.js
const puppeteer = require("puppeteer")

;(async () => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()

  // Navigate to the page that trains the model
  await page.goto("http://localhost:5000")

  // if you want to trigger some function in the page use evaluate
  console.log(await page.evaluate("ml5.version")) // prints "0.5.0"

  // Display browser console messages on screen
  page.on("console", msg => console.log(">", msg.text()))

  // This allows to save the model when classifier.save() is called.
  // downloadPath is the folder in which the model will be saved.
  await page._client.send("Page.setDownloadBehavior", {
    behavior: "allow",
    downloadPath: "./",
  })

  //Wait till element with id="done" is visible
  //By default puppeteer will wait 30s and then throw error. `timeout = 0` disables the timeout.
  await page.waitForSelector("#done", { visible: true, timeout: 0 })

  console.log("DONE!")
  browser.close()
})()
```

To run the script

```bash
node index.js
```

It is important to note that you need to be running `serve` in port 5000 while running the node script.

## Wrapping up

We have trained an image classification model using transfer learning using ml5, then through a Node script using puppeteer we have been able to run this task with just a few lines of code, which is awesome!


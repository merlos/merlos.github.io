![ml5 - Nodejs - puppeteer logos](./ml5-nodejs-puppeteer-logos.png)

# About this

This is the sample code for training a ML5 model using NodeJS instead of a browser.

Everything you need to know is explained in this article https://dev.to/merlos/how-to-use-ml5-with-nodejs-and-puppeteer-step-by-step-132e

# How to use this script

```bash
# Download the code and go to the the folder
cd code/ml5-puppeteer
# install dependencies
npm install

# run the web server with the ML5 script
./node_modules/serve/bin/serve.js ./public/
```

In another terminal

```
node index.js
```

When "DONE!" is displayed on the screen you'll have the model trained and
you´ll get two files in the `model.json` and `model.weights.bin``

Refer to ml5 documentation on how to load the new model

# How to implement a scalable WebSocket middleware for Redux (Part I)

In this article wi will implement a composable and scalable middleware for managing web sockets. At the end of this series of articles we will have a complete multi user chat application and the code for a scalable middleware.  

I assume that you already have some knowledge about Redux, and that you have used other middleware such as [Redux Thunk](https://github.com/reduxjs/redux-thunk), or [Redux sagas](https://redux-saga.js.org/).

# What are web sockets?

From [MDM](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API): _The WebSocket API is an advanced technology that makes it possible to open a two-way interactive communication session between the user's browser and a server. With this API, you can send messages to a server and receive event-driven responses without having to poll the server for a reply_.

The cool thing of WebSockets is that the browser can receive messages asynchronously from the server because it has a continuous connection with it. WebSockets is the technology that allows simultaneous document edition, such as Google Docs or Office 365, any other browser based chat.

Let's see some browser code

```javascript
// Create WebSocket connection.
const socket = new WebSocket('ws://localhost:8080')

// Once the connection is opened we can send messages to the server
socket.onopen = () =>
    socket.send('Hello Server!')
}

// The server can also send messages. In order to do that we listen to on message event
socket.onmessage = (event} => {
  console.debug("WebSocket message received:", event)
}

// Sometimes the connection can be lost...
socket.onclose = (event) => {
  console.log("WebSocket is closed now.")
}

```

As you can see, whenever the browser needs to send some information to the server, once the connection is established it just needs to use `socket.send`. To receive data from the server, the browser just needs to subscribe to the `onmessage` event. Finally, because we are keeping the connection open there may be situations in which it is broken, for example, the server has a segmentation fault, or your dog bytes your router). We need to keep handle these situations and for that we subscribe to the `onclose` event.

# Warm up exercise. Develop a echo in Node.js

Because for this tutorial we need to have a server to play around we will implement also the server side. We will use Node.js and we will start with Echo is the equivalent to the hello world when we talk about client-server technologies. Basically, echo is a service that replies with the same message that it receives.

Let's implement it using WebSockets and node:

```
npm init
npm install ws
```

Let's start with a simple echo server that broadcasts any message it receives

```javascript
// index.js
const WebSocket = require("ws")

const server = new WebSocket.Server({
  port: 8080,
})

//each connection will be an item.
let sockets = []

server.on("connection", (socket) => {
  sockets.push(socket)

  // When you receive a message, send that message to every socket.
  socket.on("message", (msg) => {
    console.log("Forwarding:", msg)
    // Broadcast the message to every client
    sockets.forEach((s) => s.send(msg))
  })

  // When a socket closes, or disconnects, remove it from the array.
  socket.on("close", () => {
    sockets = sockets.filter((s) => s !== socket)
  })
})

```

For the client, instead of using the browser, for now, we are going to implement our client also as a Node script. It will prompts the user to type something and send it to the server. When it receives the information, it will display it using the console. I leave it as an exercise for you to implement this using vanilla javascript in a browser.

```javascript
// client.js client to test
const WebSocket = require("ws")
const ReadLine = require("readline")

//init web socket
let client = new WebSocket("ws://localhost:8080")

// Handle error
client.onerror = (error) => {
  console.log(`WebSocket error: ${error}`)
}

// If connection is closed
client.onclose = () => {
  console.log("Connection closed")
  process.exit(0)
}

/// Display the received message.
client.onmessage = (msg) => {
  console.log("> ", msg.data)
}

//Create the readline interface
const rl = ReadLine.createInterface({
  input: process.stdin,
  output: process.stdout,
})

//for handling when the user sends the close command
rl.on("close", () => {
  console.log("\nBye bye !!!")
  process.exit(0)
})

//Callback run when the websocket connection is established
client.onopen = () => {
  console.log("Connection established...")
  //infinite loop that loads from command line
  rl.on("line", (command) => {
    // if the command is "/quit", exit the app.
    if (command == "/quit") {
      rl.close()
    } else {
      // in other case we send the command to the server
      client.send(command)
    }
  })
}
```

Now lets play with our first implementation of sockets:

Open one terminal go to the folder where you have created the two files and run

```
node index.js
```

And now in another terminal run the client
```
node client.js
```
 
// Insert ECHO.GIF


# The chat server

As we said, we are going to build a simple chat. At this moment we have the foundation, the skeleton of the server, we just need to add the chat logic. In this case we will do a tribute to [IRC](https://en.wikipedia.org/wiki/Internet_Relay_Chat). In the IRC era, you connected to a server and through commands that started with `/` you were able to join channels (equivalent to a WhatsApp group) or send private messages to any user.

In this example we will simplify the [available commands](https://en.wikipedia.org/wiki/List_of_Internet_Relay_Chat_commands) to the following commands that will be available:

- __/nick nickname__ sets the user nickname
- __/join channel__ Enter a channel room.
- __/names channel__ Lists users in a channel.
- __/part channel__ Leave a channel.
- __/msg channel message__ sends a message to a channel.
- __/privmsg nickname message__  sends a private message only to a user.
- __/help__ displays some help .
- __/quit__ closes the connection.

We won't allow spaces in nicknames nor channels as we will use it as separator for the regular expressions for parsing the commands.

### Server unit tests

```
npm install --save-dev jest
```

Edit `packages.json`

```javascript
 "scripts": {
    "test": "jest"
  },
```

```
npm test
```

# Part I summary

## Let's go to the meat. The React/redux implementation

```
npx create-react-app client --template redux
```

The core middleware

# What is a redux / middleware?

In [Redux](https://redux.js.org/advanced/middleware) _a middleware is some code you can put between the framework receiving a request, and the framework generating a response_...[in the case of Redux] _It provides a third-party extension point between dispatching an action, and the moment it reaches the reducer_

```
 Dispatch Action ----> Middleware ----> Reducer
```

So, a middleware is just a piece of code that runs every time an action is dispatched before it reaches the reducer. Most probably you have already used middlewares such as Redux Thunk or Redux Sagas for handling asynchronous calls. For example, in the case of Redux sagas, it watches for certain actions (the request) and when it receives the response from the server, it dispatches another action (which are not watched by any saga)

Something that you also need to know is that middlewares are run in sequence. That is if you have more than one middleware they will run one after the next:

```
Dispatch Action ----> Middleware 1 ----> Middleware 2 ----> Reducer
````

In Redux, a middleware has the following awkward signature 

```javascript

const myMiddleware1 = store => next => action => {  

  // Note that the middleware is called for every single action dispatched.
  
  // This just displays on console the action that is being dispatched.
  console.log('dispatching', action)

  // If the middleware needs to dispatch another action, the dispatch function
  // can be extracted from the store using the following line
  const {dispatch} = store
  
  // Same for the state. If the middleware needs to get some data from the
  // state it can call `getState` 
  console.log('next state', store.getState())

  // once this middleware has finished doing its stuff, it returns the call to the 
  // next middleware and passes the action as parameter.
  return next(action)
}
```

Looking at the code above a middleware has available the `action` (same object as in a reducer), the `store` object which provides access to `dispatch` and the `state`, and a function `next`, which allows to run middlewares in sequence, must be called at the end of each middleware execution.

Once you have your middleware code, to register it you need to do the following:

```javascript
import { createStore, combineReducers, applyMiddleware } from 'redux'

const myApp = combineReducers(reducers)
const store = createStore(
  myApp,
  applyMiddleware(myMiddleware1)
)
```

If you have more than one middleware add it as an argument to `applyMiddleware`.

```javascript
 applyMiddleware(myMiddleware1, middleware2)
```

## Two way communication - the singularity of WebSockets middleware

The large majority of the middlewares handle actions that are initially dispatched from the components within the React app, for example, a user clicks a button that dispatches an action. In our naming convention we will call the functions that listen to actions originated from the components **action watchers**.

Earlier we mention that WebSockets establish a two way communication between browser and server. That is, the server can send information in the form of messages to the client at any time. The code responsible of listening to these messages is our middleware and we will call the functions that handle them **message watchers**.

```
 Receive message from server --> middleware message watchers (dispatch action) ---> Reducer
 ```

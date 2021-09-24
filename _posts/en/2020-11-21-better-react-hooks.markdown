---
layout: post
lang: en
post_id: 2020-Better
title: "TBD"
keywords: "TBD"
description: "TBD"
categories:
  - ml5
  - machine-learning
  - node
image: '/assets/posts/2015-open-gpx-tracker/open-gpx-tracker.png'
---


# Write code for people: Dos and donts to improve your React code

During the last couple of years I have reviewed many pull requests of React applications. I observed consistently in different developers some practices that could be improved just by thinking: I am writing code for people (other people).


## Why: General Principles 

Although it seems counter-intuitive, because code is meant to be run by machines, the truth is that good code is written for people. 

Either if you are writing enterprise applications or creating an open source project, **your code is going to be read and maintained by humans**. This is a **mantra** you must always keep in mind.

Some readers may pose that code is run on machines, so if the code is not efficient you cannot condider it good code. That's a good point, but if the code is readable, it will be easier to understand where to change it to make it faster.

Good code that is developer-friendly has several advantages.

1. On boarding of new developers is much smoother and less costly. 
2. Takes less time to maintain. It is very common to spend a lot of time in an application/library, then you release it, and you don't modify it for a while. One day, after some months you need to change something and you don't remember what you did...


# How: Recipies / Tips

We'll start with some general JavaScript tips and then move to more specific tips for React.

## Do use significant names in variables.

Whenever you create a variable ask yourself: Does the name of a variable convey what is the content of the variable?

In general, follow these rules:

1. Use the **shortest** name,
2. But also be as **precise** as possible.

 ```javascript
 //  ❌  Not good
 const list = ['USA', 'India', 'Peru', 'Spain']
 list.map(item => console.log(item))

 //  ✅  Better
 const countries = ['USA', 'India', 'Peru', 'Spain']
 countries.map(country => console.log(country))
 ```

In general do not use generic names such as `list`, `item`, they are short but not very meaningful. A list can contain anything and it will not give any clue about its contents to the reader of your code. A more precise name, such as `countries`in the example above, is better. 

Also, I personally prefer to avoid acronyms in variables as they may be harder to understand for junior/new developers.

```javascript
 //  ❌  Not that good
const handleClk = e => { 
	console.log("User clicked the button" + e.current.value) 
}

//  ✅  Better
const handleClick = event => { 	
	console.log("User clicked the button" + event.current.value) 
}

```

This "rule" makes the code more verbose but also easier to understand.

In other languages like Python it is common to use acronmys/abreviated versions - for example when importing modules - which is somewhat fine as these are widely spread conventions across existing documentation, examples and even novice learners. 

```python
# Typical way of renaming modules in python
import numpy as np
import tensorflow as tf
import seaborn as sns

```

The rational of this convention is to type less, be more productive (Now with autocomplete of the editors is no longer true), make the code less verbose and "faster" to read for expert eyes.

Following this idea, there may be cases in JavaScript in which you use shorter versions, for example:

```javascript
# doc is a instead of document 
const doc = createNewDocument()

```

As summary, do give some thought when naming variables in your code. I believe it is one of the hardest part of software development and it differenciates good developers from bad developers.


## Do use consistent names across the app. 

Give good names to variables is not enough, they have to be consistent across the whole react app. 

``` 
```

To solve complex problems we create small independent logic units. We follow the strategy of _divide and conquer_ to make it easier. We implement components in an isolated way, they have some inputs and throw some output. However, we should not forget these units belong to a higher order organism, your application.

Ask yourself upon creating a variable, function, component or a file, if its name is consistent with the names already used in the application. 
  Example:

  ```javascript
  //Not good
  
  //File1.jsx
  const sectorsData = useSelector(sectorsSelector)
  
  //File2.jsx
  const sectorsList = useSelector(sectorsSelector)
  
  
  // Better
  //File 1
  const sectors = useSelector(sectorsSelector)
  
  //File 2
   const sectors = useSelector(sectorsSelector)
  ```



  For files:

  - `/redux/constants/<entity>Constants.js`
  - `/redux/actions/<entity>Actions.js`
  - `/redux/selectors/<entity>Selector.js`
  - etc..

- Do follow the _Don't repeat yourself_ (DRY) principle. That is, if you see that your are repeating similar code or logic in two places, refactor that code to use a function, component, etc.


## Do keep files short. 

I use 200 lines as a benchmark. Specially when we talk about React components, if you have a file that has more than 200 lines, ask yourself if you can split it in smaller components.

Also, if the large majority of your component code is for fetching and processing data, think about moving that code to support/helper files.

/src/lib/

----
How to structure a large project is too broad and out of the scope of this guide, but  

```
/src/components/ => JSX components
/src/services/ => API, authentication oprations etc...
/src/helpers/ => data transformation functions
```
----

## Do create a compact code.


```javascript
// ❌ Not that good
   -- example of using default initilizer
   --- example of using ? : operator
    
  // ✅ Better
   
```


```javascript
  // ❌ Not that good
  const handleClick = newValue => {
    const valueAsString = newValue.toString()
    if (onClick !== undefined) {
      onClick(valueAsString)
    }
  };
  
  // ✅ Better
  // Previous code in 1 single line.
  const handleClick = newValue => onClick && onClick(newValue.toString())
```

Although compact code as a general principle is good, it may sometimes obfuscate what is the code actually doing. So,

## Do document your code. 

Specially for helper functions the interface needs to be clear.

Do include comments for pieces of code that may not be very obvious. Example:

  ```javascript
  // ❌ Not that good
  editor.countWorths= nodes => {
    const content = editor.serialize(nodes);
    return content.length ? content.match(/\b[-?(\w+)?]+\b/gi).length : 0;
  }
  
  // ✅ Better
  /**
   * Counts the number of words within the passed nodes
   *
   * @param {Node} SlateJS nodes
   * @returns integer Number of words
   */
  editor.countWords = nodes => {
    const content = editor.serialize(nodes); // one string with all node contents
    //Extracts number of words with the regex unless empty string (0)
    return content.length ? content.match(/\b[-?(\w+)?]+\b/gi).length : 0;
  };
  ```
 
Documenting your code is another 

## Do use linters and code formatters

_Linters_ are code analyzers that provide estilistic suggestions. The most widely spread in Javascript is [esLint](https://eslint.org/). Setting it up in a react application is pretty easy.

The other tool that will make your code more readable and save you time is a code formatter. It will indent and break the lines of your code. It will really make your code much easier to read and will save you time. In JavaScript we are lucky, we have  [prettier](https://prettier.io/) that formats your code on save. 


## Do use `on` and `handle` as prefix on event props and handlers 

This is a _de facto_ standard on React naming conventions. It is widely used on the official react documentation and gives the reader a cue on what is the prop for.

 
For event props use `on` as prefix (for instance, `onClick`, `onSubmit`, `onBlur`).

For the handlers of those events use the prefix `handle` (for instance, `handleClick`, `handleSubmit`, `handleBlur`).

```javascript
	// ❌ Not that good
	export default function SendEmailForm (sendEmail) {

	/// process / validate email form
	sendEmailWasClicked(event) {
	  sendEmail && sendEmail(formFields)
	}
	
	return(
	 <form>
	   ...
	   <input type="submit" onClick={sendEmailWasClicked}>
	    Send email
	   </input>
	   ...
	 </form>
	)
	
	// ✅ Better
	export default function SendEmailForm (onSendEmail) {

	  handleOnSubmit(email) {
	    // process email info
	    // ...
	    //
	    onSendEmail && onSendEmail(email)
	  }
	
	  return(
	   <form>
	     ... 
	     <input type="submit" onClick={sendEmailWasClicked}>
	       Send email
	     </input>
	     ...
	 </form>
	)

```

## Do not add handler code in the render

In my experience it makes the code harder to read when the logic of the handler is within the render. 

  ```javascript
  // ❌ Not that good
  <button onClick={() => {
    if (name==='') {
  	   setError("Name is mandatory")
  		return
  	 }
  	 if (surname==='') {
  	   setError("Name is mandatory")
  		return
  	 }
  	 onSubmit && onSubmit({name, surname})
  }}>Submit</button>

  	// ✅ Better
    const handleOnSubmit = () => {
     if (name === '') {
  		 setError("Name is mandatory")
  		 return
  	  }
  	  if (surname === '') {
  		 setError("Surname is mandatory")
  		 return
  	  } 
  	  onSubmit && onSubmit({name, surname})
  	 }
	
	...
	
	return( 
	  ...
  	  <button onClick={handleOnSubmit}>Submit</button>
  	  ...
  	 )
  ```

One liners may be ok to make code more compact.
Example:

```javascript
  	// ✅ This is ok
	return (
		<button onClick={() => onCancel && onCancel()}>
			Cancel
		</button>
	)
```

  




## Do use `const` by default
Whenever you create a _variable_ use `const` by default. Use `let`
only when it is going to be assigned several times. Avoid `var`.

It will save you some hard to find bugs.


```javascript
	// ❌ Not that good
 	let today = new Date()  // Today 99.9999999% won't be reasigned
 		
 	// ✅ Better
 	 const today = new Date()
```

Note that you assign a variable when the `name` is in front of an `=`. So  you can modify Arrays and Objects as constants.

```javascript
	
	// ✅ This will run 
 	let day = new Date() 
 	day = new Date()
 	
 	// ❌ It will not run
 	const day = new Date() 
 	day = new Date()  // you cannot reasign a const
 	
 	// ✅ This will run 
 	const myObject = { a: 'prop created during assignment' }
 	myObject.b = {b: 'object content can be modified after creation'}
 	
 	const animals = [ 'dog', 'cat']
 	animals.push('lion')

```

Only when you put a `const` before `=` more than once, the code won't run.


## Do use the best maping function in arrays

  1. Use `map()` for returning an array with the same number of elements.
	
	```javascript
		const numbers = [1, 2, 3]
  		const double =  numbers.map( number => (2 * number)) // [2, 4, 6]
  	```	
  
  2. Use `filter()` for returning the items that match a _criterium_.
	
	```javascript
		const numbers = [1, 2, 3]
  		const double =  numbers.filter( number => (number > 1)) // [2, 3]
  	```	
  
  3. Use `find()` for searching the first item that matches a _cirterium_.
	
	```javascript
		const numbers = [1, 2, 3]
  		const double =  numbers.find( number => (number > 1)) // [2]
  ```	
  
  4. Use `forEach()` for not returing an array.
 
	```javascript
     const list = [1, 2, 3] 
     let sum list.forEach( number => sum += number) // 6
	```



## Do handle situations in which there is no value

  Example:

  ```javascript
  export default function MyForm(value, onSubmit) {
  const handleOnSubmit => (newValue) => {
  // do whatever other transformations
  onClick(newValue)
  }
  return (
  {/* this assumes input handles null or empty values correctly */}
  <Input value={value} />
  <Button onSubmit={handleOnSubmit}>Submit</Button>
  }

  // Better
  const default function MyForm(value, onSubmit) {

    const handleOnSubmit = () => {
    	// It won't do anything BUT won't crash.
    	onClick && onClick(values)
    }
  ```

  Example 2:

  ```javascript
    //Not good
    export default function IndicatorsList({sectors}){
    return(
      <ul>
       {sector.indicators.map(indicator => <li key={indicator.id}>{indicator.text}</> )}
      </ul>
    }
    //Better
    //It receives the indicator list
    export default function IndicatorsList({indicators}) {
    indicators = indicators || []

    (indicators.length == 0) ? (
      <p>No indicators</p>
    ) : (
    <ul>
    {indicators.map ( indicator => <li key={indicator.id}>{indicator.text}</> )}
    <ul>
    )

  ```

- Do use the following order of elements when coding your components (It is just a convention) 1. state,variables and constants 2. `useEffects` 3. effect handlers (`handleOnClick`, etc.)


- Do add validations for fields and handle form errors. When there is a network request, it can fail. Your code has to handle that failure and display the appropriate feedback to the user.
  1. Page error when the issue is at the page level (loading fundamental data).
  2. Validation errors when the issues are related with the data provided by the user
  3. Display an alert error when the issue is related with a submit button.
  4. Async badge error on asynchronous calls of onBlur.

---



## Wrapping up

Always keep in mind that 

> **You write code for people, not machines** - although it may look counterintuitive. 

So always try to think if a reader would understand it. Code with meaninful variables, that follows some wide spread conventions, that is documented and that, in general is _developer friendly_  will be much easier to maintain, less prone to errors and if a new team member joins, she/he will be on board and productive in less time. 

Some of the recommendations I expose here may have corner case exceptions  so use the common sense in that case. Also, if you have any argument against or you can complement any or find any issue leave a comment

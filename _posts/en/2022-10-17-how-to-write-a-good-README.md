---
layout: post
lang: en
post_id: 2022-how-to-write-a-good-readme
title: "How to write a good README"
keywords: "readme, documentation, git, github, markdown, how to, tutorial"
description: "The README file is the one-stop documentation file. Usually, it is not only the first file any person will read when reaching an open source software project for the first time, but also it is the key document for your recurring visitors."
categories:
  - dev
image: '/assets/posts/2022-readme/g52zia7v62gur6drtauc.png'
---

![](/assets/posts/2022-readme/g52zia7v62gur6drtauc.png)

**The README file is the one-stop documentation file**. Usually, it is not only the first file any person will read when reaching your project for the first time, but also it is the key document for your recurring visitors.

## Why is important the README? 

A few weeks back I had to install an open source project in my computer. It was the first time I was interacting with the project and experience was horrible, something that should have taken me no more than one or two hours to do, took me two days, and the main reason it took me so long was because it had a README file that could be improved to help developers new to the project to have a better first interaction. 

Integrate and use open source solutions, library or tools in our own projects is the day-to-day for many developers, and the starting point for this tasks is arguably the README file.  So a good README, is as indispensable for an open source project as it is the quality of the code. 

## Who is your audience?

Before digging into what are good contents and how to write a README file, let's dig into who's going to read this document.

To write a good README **one of the keys is to think about the reader**. Who is this file for? Who is your audience? In this regard, I like to classify them in three categories. 

1. **End users**. They are the actual users of your application. These may also be business analysts that are seeking for a solution. They may not have a strong technical knowledge and they are more worried about the functional aspects of your solution and not so much about the technology implementation.

2. **Technical users**. These are people that have technical background and are going to install or setup the project in their own environment. You can consider them also as some kind of integrators. They are going to take your project and integrate it into the project they are working on. They care about the technical aspects, but just as a user, that is, they do not care too much about how it is implemented, but more about the functionality offered. For example, if your project exposes an API or it is a library, they want to use the API/library, but they are not interested in learning about all the implementation details. 

     Note that depending on the project type, sometimes the _end user_ and the _technical user_ may be the same target audience. For example, if your project is a Javascript library such as React JS, your end user is also, most of the time, the technical user, a developer. However, if your repository is an iOs application, your end user - someone with an iPhone who will use App Store - is not necessarily the same as your technical user - someone that wants to install the app using Xcode.

3. **Contributors**. They are people you are going to interact with somewhat because they go one step beyond in their involvement with your project. For example, a contributor can be a technical user that needs some support to install the solution, someone that wants to report a bug or suggest a new feature, someone that wants to submit a pull request with an enhancement, or someone that wants to support economically the project. As you can see, this is the most diverse group, but including all of them in one group keeps things simple.


## README format and writing style

Although README files are plain text files because most of the source code hostings such as [Github](https://github.com), [GitLab](https://gitlab.com/) or [Azure Repos](https://azure.microsoft.com/en-us/products/devops/repos/?nav=min) support the [Markdown format] (https://en.wikipedia.org/wiki/Markdown). Because of that, most of the README files you will see in the wild are written using the [Markdown syntax](https://www.markdownguide.org/basic-syntax). 

This text format is pretty simple but rich enough for having a nice output. It supports headings, bold, italic, bulleted lists, numbered lists, code blocks, links, etc. Indeed, behind the scenes, this blog post is written in Markdown too. 

Quick example of Markdown:

```markdown

# Heading 1

Preprending a `#` at the beginning of the first 
line of a paragraph converts it into a heading 
1 (biggest font heading).

## Heading 2

Two `#` is for heading 2. And so on so forth till 6.

To set a text in *bold* just enclose it 
in asterisks. For _italic_ use the underscore. 

Markdown also supports [links](http:/dev.to/merlos)
```




Based on the axiom _"[people don't read, they scan](https://www.nngroup.com/articles/how-users-read-on-the-web/)"_, the proper use of Markdown will allow you to give the document some visual structure and help users scan the contents of the file.

By setting a structure (using headers, lists, paragraphs) you are helping you users to quickly find the information they are seeking. 

For example, a developer found your project while he was in the subway coming back home, because he was on the phone he starred it and a few days later came back to install it. Some weeks later he found a bug, and he wanted to report it. By adding headings - that is structure - to your README - he will have it much easier to find the particular section he is interested in.

Furthermore, to **adapt the text to the way we read online**, i.e. scanning, searching for key words, etcetera, you can follow some basic principles for [writing for the web](https://www.usability.gov/how-to-and-tools/methods/writing-for-the-web.html), like the following:

 1. **Use short paragraphs**. Using around 3 to 5 lines is a good rule of thumb. Each paragraph should have only one concept. This will help scanning.

 2. **Use bulleted or numbered list** instead of comma separated lists. This list of basic rules is na example. Again this helps scanning.

 3. **[Never ever use `click here`](https://www.smashingmagazine.com/2012/06/links-should-never-say-click-here/)** for a link, use some meaningful text instead. Among other  reasons, using [click here] (https://www.lamar.edu/web-communication/resources/avoid-using-click-here.html) forces users to read the context around the link, whereas a more appropriate text, will explain the reader [why you shall never use click here](http://stephanieleary.com/2015/05/why-click-here-is-a-terrible-link-and-what-to-write-instead/).

 4. **Highlight key words or sentences paragraphs** with bold. Avoid using underline, because it may be confused with a link.

 5. **Start with the most important information** in each paragraph. [Use inverted pyramid structure](https://www.aresearchguide.com/inverted-pyramid-structure-in-writing.html)** in your writing. Start with the content that is most important to your audience, and then provide additional details.



## README contents

Ok, now that we know who are we writing for and good practices about how to give structure and form to the file, let's see some suggested contents for the README. 

The structure presented here follows the natural way of interacting with your project:

1. First we will shortly **explain what it is the project about**, 
2. then, we will continue on **how to install and how to get started with it** and,
3. finally, we will provide the reader **how to get involved**, how to collaborate.

This structure follows the level of involvement with your project it is expected from each of the categories of users we have presented. End user just wants to learn about the project.

Note that some sections may not fit your project in particular or you may prefer to label them differently, but in any case the three level structure above will apply for sure.

Let's start with the sections: 

### Overview

Here you want to **briefly introduce your project**. It should not be more than two or three paragraphs. Think what you need to tell to someone that is looking at your project for the first time. The main audience for this section are your _end users_.

After this short intro, you may include links to the website, wiki page with further explanation and/or a demo for those that are interested in getting more about your project.

Finally, you may want to list some of the technologies, frameworks that you are using or supporting (if it is not obvious). This piece of info is interesting for the _technical users_ that may need to evaluate if it fits the architecture of their project or organization.

Here is an example of the React JS project (in Markdown)

```markdown
React is a JavaScript library for building user interfaces.

1. Declarative: React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes. Declarative views make your code more predictable, simpler to understand, and easier to debug.
2. Component-Based: Build encapsulated components that manage their own state, then compose them to make complex UIs. Since component logic is written in JavaScript instead of templates, you can easily pass rich data through your app and keep the state out of the DOM.
3. Learn Once, Write Anywhere: We don't make assumptions about the rest of your technology stack, so you can develop new features in React without rewriting existing code. React can also render on the server using Node and power mobile apps using [React Native]().

[Learn how to use React in your project]().

```

As you can see, first the project is showcased and at the end, you get a link to more info. In this case, the main audience are developers, and therefore _end users_ and _technical users_ are the same. 

### Install

At this point, you got enough attention from the README reader, so he wants to go one step beyond and try it.

Here you have to **expose the steps to install your stuff**. For example for a NodeJS application, usually you will instruct something like:

```bash
git clone http://url-to-my-repo
npm install
npm start
```

Or for a python library

```bash
pip install your-library-name
```

and so on so forth.

---------
**PRO Tip:** In Markdown you can enclose code blocks with three apostrophes. If you add the name of the language after the first set of three apostrophes (for instance `ruby`, `javascript`, `typescript`, `swift`, `bash`) when rendered, syntax highlighting will be applied. 

For example:
   
![Markdown for the javascript that is displayed after the text Is rendered below](/assets/posts/2022-readme/2hhyfbslnq0dnug7bh5f.png)

Is rendered:

 ```javascript
    // This is my Javascript code
    if (a > b) return true;
```
---



Note that in this case you are assuming that the reader has the package managers, `npm` or `pip`, installed on his system, which may not be the case. So, **think about specifying the pre-requisites needed before attempting to install your project**. Just providing a link to the install page of each pre-requirement may be a great help for your reader. In the NodeJS example above:

```markdown
  To install this application you need 
  (Node JS 16.0 or above)[https://nodejs.org/en/download/]
```


### Usage / Getting started

Now that the reader has your project in his system, it is time to showcase the superpowers he can do now thanks to your stuff. 

In getting started you can either include some basic instructions inline or point to a more rich documentation.

The goal is to **guide the reader in what to do once he has just installed** your project in his environment.

### Documentation

In addition to the basic first steps/getting started the reader may want to dive into all the functionality of the project. It may depend on the kind of project:

* For an application it may describe how to use it, the options, how to set it up for different use cases. 
* For a library, framework it may describe API, methods, classes, or some advanced examples.

Some additional documentation you may think about are:

* Deployment good practices. How to deploy it in a production environment.
* Security guidelines. How to harden any installation to avoid any cybersecurity issue. 
* Troubleshooting.
* etc.

Depending on how you structure your documentation and your README you may merge this section with the _Getting started_ one. 

### Development

From now on, this and the following sections will be for the readers that get into the nitty-gritty of your project or that want to become an active member of the community. Within the classification of potential readers are the ones that we called the contributors.
 
This development section is for setting up the environment in _dev mode_. What are the tools that you need and how to run the project in debug mode, run the unit testing, etc.

```bash
# Example of running the automated unit test suite
npm test
```
### Contributing

This section is for providing any additional information for the reader that wants to really contribute. 

* How to report a bug
* Code of conduct 
* Coding Style guide
* How to make a pull request (PR)
* How to get support
* How to make a donation
* How to contact for commercial support
* etc.

You may want to add part of this documentation in a separate file. For example, [GitHub allows you to set up the  `CODE_OF_CONDUCT.md`](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-code-of-conduct-to-your-project) and [other files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/about-community-management-and-moderation).


### Acknowledgements 

It is a good practice to **acknowledge those who have been _inspiration_ of your work** (other repos, other projects) or **mention those key contributors** of the project, that is, those that have added new features, submitted pull requests, fixed bugs, etc.

### License 

The last section of the README typically is reserved for the copyright and license.

Though, at a first glance, you may think that this is not important, the truth is that it setting up a **license is key as it helps other developers to understand the limits of the use** of your software.

Here you have a list of [open source licenses](https://opensource.org/licenses). You should have a rough idea of what each license means. Personally, I usually choose between GPL3 and MIT.

1. [MIT](https://opensource.org/licenses/MIT) is the simplest license one, more or less it says: you can do whatever you want with this piece of code. Do it at your own risk and do not suit me. 

2. [GPL](https://opensource.org/licenses/gpl-license), is a [copyleft license](https://en.wikipedia.org/wiki/Copyleft). It is a more restrictive license than the MIT as it forces any contribution or customization of the code to be publicly released, as well as to be distributed under the same GPL license. It is less attractive for a commercial usage, but better for the overall community as any contribution reverts back to the community. For example the [GNU/Linux kernel](https://www.kernel.org/doc/html/latest/process/license-rules.html) is distributed under this license. 

In this section of the README, you don't need to add the whole text of the license, just the banner, but usually, you should include a copy of the whole license in the file `LICENSE` or `LICENSE.md`.
 
## Extra balls

A couple of things that you can add to your project README are images and status badges.

### Images

As it was mentioned earlier, README files generally are written in Markdown. This language, allows you to link images within that will be displayed once the Markdown is rendered. 

In particular there are two cases which this may be useful:

 1. To make it look cooler. For example adding a logo at the beginning of the readme, makes it look good. It gives a good first impression.

 2. Showcasing / Providing a demo. An image is 1,000 words worth. You can record a simple animated GIF and showcase key features of your project helping the reader to grasp what's your project about with less effort.

### Status badges

![A bunch of status badges from a GitHub repo](/assets/posts/2022-readme/badges.png)

Another "cool" thing you can add in your README file is a status badge. A status badge displays what is the status of a particular aspect of your repo, it can be if the unit testings are passing failing, if your pipelines are working, what is the latest version released, the code coverage, and a long etcetera.

It gives a snapshot to your visitors in a nutshell some indicators of the project.

You can check the [badges/shields repo](https://github.com/badges/shields) to add some badges to your project.

The only drawback of using images and the badges in the README is that they will not be rendered in a simple text editor, but  you can ignore it as most of the time this file will be displayed either in the repo website or in a _developer friendly editor_ which usually support Markdown rendering.

## Summary

If you are working in an Open Source project, the **README file is a key one-stop document** that can boost the developer experience.

To write a good readme you need to **keep in mind the types of audience** that will read the file: end-users, technical users and contributors. 

You should **pay attention on how people read on the web**, helping them to scan your README using Markdown, and the good practices for writing for the web such as short paragraphs, lists and the inverted pyramid writing schema.

The contents of the README should **follow a structure** that first introduces the project, then explains how install and  use it and, finally, explains how to get involved in the project as contributor.

This article was published in <http://dev.to/merlos>
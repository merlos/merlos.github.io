---
layout: post
lang: en
post_id: 2015-open-gpx-tracker
title: "Open GPX Tracker for iOS"
keywords: "gpx tracker, gpx, gpx, open street maps, osm, open source, iphone, ipad, ios"
description: "GPX tracker for iOS is free a GPS tracker with no ads, no in app purchases and no"
categories:
  - github
  - ios
image: '/assets/posts/2015-open-gpx-tracker/open-gpx-tracker.png'
---

When I released the [latest refreshed version of this web]({% post_url en/2015-02-07-new-version-of-the-web %}) in February, I promised myself to write more often... and yes, I know, it seems that I lied... it's been a while since last post! But the truth is that I've been busy writing and learning new stuff. Among them, I learnt some [SWIFT](https://developer.apple.com/swift/), the new programming language of Apple. 

An because I primarily learn by doing, I made an iOS app:  __Open GPX Tracker__.

![ios GPS Tracker]({{page.image}})

Open GPX Tracker is a GPS tracker works on all iOS devices (iPhone, iPad, iPod...). The app tracks your device GPS location and draws the the "line" of your path. Then, you can save it and then export it to [GPX](http://en.wikipedia.org/wiki/GPS_Exchange_Format), a file format that is widely used in many other apps. You can also add waypoints on the map and name them. To run it, you need iOS 7.0 or above. 

This app, although is pretty simple, has a couple cool features:

 * No annoying time restrictions, no ads and no in-app-purchases. You can reate unlimited GPX traces :-). In most of apps available in iOS you have to pay for these things.
 
 * It's Open Source distributed under GNU/GPL license. You have the [source code available on GitHub](https://github.com/merlos/iOS-Open-GPX-Tracker).
 

### Why did you make this app?

I made it for these reasons:

1. I've started being part of the [Open Street Maps community](http://www.openstreetmap.org/user/merlos). Mainly, I'm adding some features on Panama City, where I currently live. To ease the edit process, people use apps. I searched on the App Store one that could be used to add waypoints, track my location and export the data to GPX format. This last requisite was in my list because on the Open Street Maps website you can upload GPX traces. Uploaded files add an overlay layer which is very helpful to edit the map. The thing is that __I couldn't find any free app that I liked and fitted my requirements__.

2. __I needed an excuse to try SWIFT__ and see if it was better than Objective C. I like simple apps, and I thought I could enjoy making one app.

Although, I started this project on October 2014, it has not been till this April when I felt the UI it was ready for being published. I've used the app a few times in real scenarios and I'm pretty happy with the user interface, and far from being perfect it's very simple.

### Is it available on the App Store?

Well, I started the publication process a couple of weeks ago. Unfortunately, Apple Rejected it on the first attempt. I [posted an issue in the app project where you have more information](https://github.com/merlos/iOS-Open-GPX-Tracker/issues/1). I sent it again last week, so in the next few days we'll know if it has been rejected again.

Once it is published I will update this post and [share it on twitter (@merlos)](http://twitter.com/merlos).

Meanwhile if you want to run it and you have the iOS development environment, the source code is available on [GitHub](https://github.com/merlos/iOS-Open-GPX-Tracker).

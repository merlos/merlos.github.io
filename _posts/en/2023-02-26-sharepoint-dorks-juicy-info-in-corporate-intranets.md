---
layout: post
lang: en
post_id: 2023-sharepoint-dorks
title: "SharePoint Dorks: Getting Juicy info in corporate Intranets"
keywords: "sharepoint, security, hacking, google dorks, intranet"
description: "How SharePoint can be used to find usernames, passwords, personal information, and other juicy data within a corporate intranet."
categories:
  - hacking
---

![](/assets/posts/2023-sharepoint-dorks/3900674676_A_colored_cartoon_of_a_wireframe_without_letters_of_the_homepage_of_a__company_intranet.png)


# SharePoint Dorks: Getting Juicy info in corporate Intranets

In this article, we'll explain how SharePoint can be used to find usernames, passwords, personal information, and other juicy data. To do that we'll just transpose the concept of **Google Hacking/Google Dorks** to an intranet file sharing solution, such as SharePoint, Microsoft's solution.

First, let's start with the concept of Google Dorks.
 
## So what are Google Dorks?

During the first steps of hacking process, the main goal is to gather as much as information as possible of the target. A well known hacking technique, [Google Dorks](https://en.wikipedia.org/wiki/Google_hacking) uses Google Search to find _juicy_ information on the Internet by [performing very specific queries](https://www.exploit-db.com/google-hacking-database) that use the google search advanced operators. 

![Google Hacking / Google Dorks Homepage](/assets/posts/2023-sharepoint-dorks/google-dorks-homepage.png)


For example, you can search for login pages, directory listing, users, passwords, configuration files, database files etc. 

* `intitle:"login"`: In the title of the page appears login. This is useful to find login pages and try brute force or other tactics to get into.

* `intitle:"index of /" intext:".db`: pages whose title includes "index of /" - a text that appears in the title of HTTP servers such as Apache when they list a folder and in which contents the text ".db" appears - which is the extension of some database files. 

* `inurl:.com index of movies`: .com sites that include the text index of movies. Useful to find pages that have movies.

I won't enter more in detail of the syntax or what else can be found using this technique, but if you are interested, [here you have an article that expands in Google Dorks](https://www.hackingloops.com/google-dorks/). 

Also, the guys of [Offensive Security](https://www.offensive-security.com) have created a [database with lots of Google Dorks](https://www.exploit-db.com/google-hacking-database)

For the purposes of this article, the only thing you need to know is that **by creating some crafted queries in a search engine you can find _interesting information_**. 


## SharePoint Dorks

Ok, cool. So now that we know what are Google Dorks, what I am calling **SharePoint Dorks** is to apply the same concept but in SharePoint, or to any other file sharing platforms within a corporate Intranet. 

The question you have to ask yourself is **what search queries can I make that may expose _interesting_ information?** 

By _interesting information_ I mean queries that may return credential information of applications, social networks, admin accounts, test accounts, but also personal information such as the passport, back accounts, social security numbers, etc. 

Given that the amount of documents and information indexed is limited to the corporate environment, simple queries like the ones below may pop _interesting_ results:  

* `password`
* `login`
* `token`
* `oauth`
* `credentials`
* `invoice`
* `passport`
* `bank account`
* `social security number`, `ssn`
* or simply a name of an employee or client 

Compared with Google, SharePoint search does not offer very advanced filters or options, but you can use the [SharePoint search boolean operators](https://sharepointmaven.com/how-to-use-boolean-operators-in-sharepoint-search/): `AND`, `OR` and `NOT` written in in capital letters. For instance:

- `user AND password`
- `login AND password`
- `invoices AND pdf`

One thing that is important to know is that when you perform a [search query in SharePoint](https://support.microsoft.com/en-us/office/modern-search-in-sharepoint-b81ab573-ec9c-4aa9-a369-b3c630f878a7) the results will only include the files you have access to including sites you have access to, and your own OneDrive. Getting those results does not mean that everyone in the organization will have access to them.

Another, notable difference with Google Dorks is that to perform a search, first you need an account on the particular SharePoint.

## Why should you care?

The main reason for a regular user to be concerned about this is that some personal information may be publicly available to all your colleagues. This may include your passport, your salary, your home address, personal number, or, if you are a contractor or individual contractor, your invoices.

As I mentioned earlier, SharePoint only returns files you have permission to access to to. So, maybe even if it throws some worrying results, your information may not be disclosed to the whole organization. To validate who has access to the file

1. Access the Sharepoint Site where the file is located
2. And at the top right corner click on the cog icon.
3. Click on Site permissions

![Menu displayed to access Site Permissions in Sharepoint](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tus3fdnkrrgmctye8hxn.png)


4. Expand the options to see the groups and people that are assigned to on each level.


![Three groups of SharePoint permissions](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hwxgpamjpdv1bh73lyt4.png)



If you see a group that says "All Staff", "Everyone" or something like that... yes, that info is shared with the whole organization.

## Why should an organization care?

Maybe you or me - because we are "good" guys ;-] - we may not be willing to use this data even if we have access to, but there are other individuals that may not think the same way. For example:

- **Disgruntled employee**. There are cases in which an employee is not happy at work or he has just been fired. So, he may want to use this information to make some harm.

- **Greedy employee**. This kind of insider information can be sold on the DarkNet. For example, the people behind of [REvil ransomware used to buy credentials to hack into large corporate intranets](https://darknetdiaries.com/episode/126/).
 
- **Contractors** Contractors may take advantage of using financial information to increase their fees, for instance, if they find invoices.

- **Hacker to escalate privileges**. If a hacker was able to get the access of an employee, he will definitely try to find credentials, or information that can be valuable.

- **Hacker to send a very targeted phishing email (aka Spear Phishing)**. Maybe as a mean to escalate privileges or for other purposes, such as requesting the payment of an [synthetic invoice](https://darknetdiaries.com/episode/124/) . 

## What may be the issues?

In the case of SharePoint, I think these are a couple of issues to look at.

1. **Loose default access permissions policy on new sites within the organization**. This may happen if whenever a new site is provisioned, the default policy may give read access all members of the organization to all the contents. 

2. **Misleading Private group access**. On SharePoint [Collaboration Team sites](https://support.microsoft.com/en-us/office/use-the-sharepoint-team-collaboration-site-template-75545757-36c3-46a7-beed-0aaa74f0401e), a Private group is a group on which only the Owners can add/remove members. Public groups on the other side, allow anyone to become a member. The type of group is displayed on the top right corner within the Collaboration site.
 
![Screenshot Sharepoint showing a Private group](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/4779npe8s913luulc3cv.png)

  As you can see in the screenshot above, the group is Private has 25 members. This presentation may mistakenly make users to think that ONLY those 25 members have access to view the site contents and confidently share documents thinking only they have access. But that's not true, who can view the contents is set by the users and groups that are defined within the _Site Visitors_ access group (which can be viewed through _Cog icon menu > Site Permissions > Site Visitors_), and those are not reflected in the members count. 

   If by default, when provisioning the site, everyone in the organization is given read permissions in collaboration sites, the contents will be accessible by anyone regardless of what is displayed in the number of members. 
 
## Wrap up

Intranets and sharing documents platforms such as SharePoint, are key for efficiency and efficacy of the operations of large organizations, however, **malicious players may take advantage of the search capabilities** if the default [permissions are not properly understood or handled](https://learn.microsoft.com/en-us/sharepoint/collaboration-options), which may be tricky sometimes.

Also, note that if you try this at your workplace using your username, you may be leaving your _fingerprints_ as search queries may be logged. 

Now, your turn:

* **What other queries or useful information can be gathered? What queries may provide _juicy data_ within an Intranet?**

* **Other than SharePoint, what other Intranet solutions do you know that may be squeezed to gather _interesting data_?**

Thanks for reading!

----

_Disclaimer: This article is only for creating awareness of a potential issue and educational purposes._

----

This article was also released at: [http://dev.to/merlos](https://dev.to/merlos/sharepoint-dorks-getting-juicy-info-in-corporate-intranets-57am)
---
title: "Blog Deployment Process Vol.1 "
date: 2019-05-04T15:42:52+09:00
subtitle: "Hugo Installation & Local Settings "
wordCount: true
tags: ["Hugo", "GitHub Pages", "Travis CI", "English"]
---

Hello Everyone.

Today, I'd like to talk about my blog deployment process.
It is the first time that I create webblogs and so I don't know 
any knowledge(Actually, I needed 2 days to deploy this blog), I'm sorry that having mistakes, and Your comments are welcomed.
<!--more-->
  
When creating it, I have some requirements.
  
 - Easy Hosting and Source Management
 - All for free

Actually, there are many hosting sites but I don't want to have new site.
I surveyed some, discovered [this article(Japanese site)](https://qiita.com/bgpat/items/d4ed0e499a9ab92c5741), and took up some components based on this 
because repository of GitHub can manage web sources ! That is very surprising !
  

Component Overviews are below.
  
 - [GitHub Pages](https://pages.github.com/) : Hosting site to connect to GitHub repositories
 - [Hugo](https://gohugo.io/) : Framework for building websites
 - [Travis CI](https://travis-ci.org/) : Auto deployment tool
  
{{< columns >}}
{{<figure src="/imgs/github-pages.png">}}
{{< column >}}
{{<figure src="/imgs/hugo.jpeg">}}
{{< column >}}
{{<figure src="/imgs/TravisCI.png">}}
{{< endcolumns >}}
  
In this article, Details of tools aren't be described(will be described in other articles) but installation steps and Troubles/Troubleshootings are introduced.

## Tool Installations
When installing tools, I used *Homebrew* because of Mac. It is very easy.
```bash
  $ brew install travis hugo
```

## Creating Sources via Hugo
At first, you type the below command and after this, 
Hugo create the directory of *\<site\_name\>* and templete trees in it.
```bash
  $ hugo new site <site_name>
```

There are [Hugo Theme lists](https://themes.gohugo.io/).
It is easy to use uploaded already themes and you can choose the theme you like.
Perhaps, the theme has the installation guide in the tutorial and you should 
fellow the theme explanations page.
    
Generally you may implement the (git) clone of the theme you choose in *themes* directory. You should check the installation of the theme.
For example, I chose [Beautiful Hugo](https://themes.gohugo.io/beautifulhugo/) and 
tested the command result.
```bash
  $ ls <Path to site_name>/themes
  beautifulhugo(you choose theme)
```

When creating new articles, you type the command in the top directory, which means \<Path to site\_name\>.
```bash
  $ cd <Path to site_name>
  $ hugo new <Directory Path>/<Article Name>
```
After doing, Hugo make the new \<Article  Name\> of *md(Markdown)* file 
in /content/\<Directory Path\>.
All you must edit is only markdown file.


You can check the deployed article in browsers such as Google Chrome when 
you build local server following the *server* command. 
```bash
  $ hugo server -D -w
  (omitted)
  Web Server is available at http://localhost:1313/ (bind address XXX.XXX.XXX.XXX)
```
If the URL is above, when checking articles, you type https\://localhost\:1313, which is the root html. 

[Continue ...]({{< ref "hugo-githubpages-travisci-v2.md" >}}) 

References :
 - [Beautiful Hugo](https://themes.gohugo.io/beautifulhugo/)

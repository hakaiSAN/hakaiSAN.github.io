---
title: "Blog Deployment Process Vol.3 "
date: 2019-05-04T20:30:52+09:00
subtitle: "Hugo Customizing Tips"
draft: true
wordCount: true
tags: ["Hugo", "GitHub Pages", "Travis CI", "English"]
---

<!--more-->
  
## GitHub Pages Setting 
[GitHub Pages](https://pages.github.com/) connects directly with GitHub Repositories and free to use.
GitHub Pages set **\<username\>.github.io** (My case:hakaisan.github.io) as the top page.  
If you set the repository name is the same as **\<username\>.github.io**, GitHub publishes automatically the blog in GitHub Pages.

There some points you should take care for.  
  
  - **master** branch is the only branch to be used to open.
  - The source code in master branch **have to be ready to open**.
Note : They are only the settings for **\<username\>.github.io**

The second column means we have to prepare deployed codes to be able to publish.
Deployment mustn't have environment dependencies between builds and productions,
and so we shouldn't make them on our side.  


Thus, I use Travis CI as auto deployment tool and have two branches in the GitHub repository.
  
  - master : to publish articles in GitHub Pages from Travis CI
  - development : the full original source branch for me


## Auto Deployment through Travis CI
You have to set up settings for both repository and Travis CI site.

### Repository Side 
At first, in ***Settings -> Developer settings -> Personal access Tokens -> Generate new token***, We can get the new access token for GitHub.
The scope for Travis CI is only **repo**.

The next is you describe **.travis.yml** in the top in the repository. 
My setting is here.
<!-- #TODO ref to file -->
``` yml
language: bash

env:
  global:
    - GIT_AUTHOR_EMAIL=kawai.arch.jk@gmail.com
    - GIT_AUTHOR_NAME=hakaiSAN
    - HUGO_VERSION=0.53
    - secure: <omit>
    - GIT_URL=https://${GITHUB_TOKEN}@github.com/hakaiSAN/hakaisan.github.io.git

install:
  - wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
  - tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

before_deploy:
  - git remote set-url origin ${GIT_URL}
  - git checkout development 
  - git fetch origin master:remotes/origin/master
  - git worktree add -B master public origin/master
  - ./hugo

deploy:
  skip_cleanup: true
  provider: script
  script: chmod +x scripts/deploy.sh && scripts/deploy.sh
  on:
    branch: development
```

Also, scripts/deploy.sh contents is here.
<!-- #TODO ref to file -->
```bash
#!/bin/bash

set -eu
set -o pipefail

cd public
git add --all
git commit -m 'Publish to GitHub Pages'
git push origin master

```


### Travis Side
It is very simple.  
You just log on Travis CI via GitHub accounts and select/add your GitHub repository.
If then, you can see deployment status as below.
{{<figure src="/imgs/travis-ci-sample-result.png">}}



  
By here, you can complete all settings !
The last task is pushing evaluation branch to GitHub !
```bash
  $ git push origin evaluation
```

If you completed all settings and pushing successfully, you can see the similar setting with below in GitHub.
{{<figure src="/imgs/github-repo-pages.png">}}

[GitHub Pages Deployment](https://docs.travis-ci.com/user/deployment/pages/)
  
[How to setup the settings(Japanese site)](https://qiita.com/bgpat/items/d4ed0e499a9ab92c5741)

## Adding Google Analysis

## Enable Comments

## Inserting Figure

```markdown
{{</* columns */>}}
{{</* figure src="path/fig" */>}}
{{</* columns */>}}
{{</* figure src="path/fig" */>}}
{{</* endcolumns */>}}
```

References :
  
 - [Inserting figures and movies(Japanese site)](https://qiita.com/waytoa/items/4107945cbd3883f51755)
 - [Google Analysis](https://analytics.google.com/analytics/web/provision/?authuser=0#/provision)
 - [Disqus](https://disqus.com/)

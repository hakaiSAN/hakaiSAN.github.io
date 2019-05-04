---
title: "Re-Installing Homebrew and Environment for High Sierra"
date: 2019-01-02T20:54:53+09:00
wordCount: true
tags: ["Environment", "Homebrew", "High Sierra", "English"]
---

Hello Everyone.
  
I used Apple Macbook Air privately from 2013 and setup environment for programming(Vim+Tmux+zplug+fzf).
It is long time since I updated High Sierra from Yosemite(As you know, current newest OS version is Mojave), but I didn't do environment by today.
  
<!--more-->
However, because it is 2019, I will use it for programming but Homebrew was very slow(I don't know why), I update/re-make them today.
Then, I decribe installation memos.
  
## Reinstalling Homebrew
At first, I executed uninstallation Homebrew following [Reinstalling Homebrew(Japanese site)](https://qiita.com/SonoT/items/f6cc91c4cbb778bf1fae).
```bash
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```
As the result, installed packages were uninstalled at the same time.
  

Next is newest Homebrew version installation.
```bash
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
After that, I installed some packages via Homebrew.
```bash
  $ brew install zsh zplug tmux vim the_silver_searcher reattach-to-user-namespace
```
Actually, I have uploaded [dotfiles](https://github.com/hakaiSAN/dotfiles) and by cloning it, I finished settting up environment immediately.
  

## Overriding Vim
To use newest vim via Homebrew, it is necessary to overriding vim.
  
However, there is one problem when overriding *'/usr/bin/vim'*.
```bash
  $ sudo mv /usr/bin/vim /usr/bin/old_vim
  mv: rename /usr/bin/vim to /usr/bin/old_vim: Operation not permitted
```
  
The reason about error is [SIP(System Integrity Protection)](https://support.apple.com/en-us/HT204899), which is the security function implemented from El Captain.
When checking the status, the command and result massage are below.
```bash
  $ csrutil status
  System Integrity Protection status: enabled. 
```

The steps to turn off SIP are below in order to override vim.
  
1. Shutdown/Reboot the PC
2. Push **Command+R** when booting it to enter Recovery Mode 
3. Click **Utility->Terminal**
4. Execute **csrutil disable** in terminal  
Successful message is ***Successfully disabled System Integrity Protection. Please resart the machine for the changes to take effect.***
5. Execute **reboot** in terminal 

After that, previous command is available.
```bash
  $ sudo mv /usr/bin/vim /usr/bin/old_vim
  $ sudo ln /usr/local/Cellar/vim/<version>/bin/vim /usr/bin
```
My current version is 8.1.0650.
  
I hope this article is useful for you.
  
  
Natsu

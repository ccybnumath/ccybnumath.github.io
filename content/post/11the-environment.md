---
title: 11The Environment
slug: 11the-environment
date: "2019-03-27"
tags: 
categories:
  - linux
link: 
description: 
type: text
---

* printenv
* set
* export
* alias
As we discussed earlier, the shell maintains a body of information during our shell session called the environment. Data stored in the environment is used by programs to determine facts about the system's configuration.
## What Is Stored In The Environment?
* sheel variables
* environment variables
* aliases
* shell functions
## Examing The Environment
* `printenv` and `set`
```bash
printenv | less
printenv  USER
set | less
echo $USER
```
* alias
## How is the environment established?
When we log on to the system, the bash program starts, and reads a series of configuration scripts called startup files, which define the default environment shared by all users.
This is followed by more startup files in our home directory that define our personal environment.
* Startup Files For Login Shell Sessions
	* /etc/profile
	* ~/.bash_profile
	* ~/.bash_login
	* ~/.profile
* For non-Login Shell Sessions
	* /etc/bash.bashrc
	* ~/.bashrc
```bash
chencanyi@DESKTOP-0HHN0UG:~$ foo="This is some "
chencanyi@DESKTOP-0HHN0UG:~$ echo $foo
This is some
chencanyi@DESKTOP-0HHN0UG:~$ foo=$foo"text"
chencanyi@DESKTOP-0HHN0UG:~$ echo $foo
This is some text
```
## Modifying the environment
* As a general rule, to add directories to your PATH, or define additional environment variables, place those changes in .bash_profile (or equivalent, according to your distribution. For example, Ubuntu uses .profile). For everything else, place the changes in
.bashrc
* create a backup 
```bash
 cp .bashrc .bashrc.bak
```


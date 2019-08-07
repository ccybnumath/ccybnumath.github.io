---
title: Git basics
author: chencanyi
date: '2019-08-06'
slug: git-basics
categories:
  - linux
tags:
  - git
---
A great and easy understanding introduction to [git](https://rogerdudler.github.io/git-guide/index.html). Here are just my notes.

* force pushing
```bash
git push -u origin master -f
```
* Create new branch
```bash
git checkout -b src
```
* switch branch
```bash
git checkout src
```
Branch `src` has already existed.
* show all branches
```bash
git branch
```
* show commitment history
```bash
git log
git log --graph
```
Display with `less`
* Roll back
```bash
# roll back one step
git reset --hard HEAD~1 
git add . 
git commit ‘roll-back’ 
git push -f origin master
# or
git reset --hard 139dcfaa558e3276b30b6b2e5cbbb9c00bbdca96 
```
## References
* [https://blog.csdn.net/Jesounao/article/details/51580647](https://blog.csdn.net/Jesounao/article/details/51580647)
* [https://www.cnblogs.com/duanweishi/p/7834364.html](https://www.cnblogs.com/duanweishi/p/7834364.html)
* [https://blog.csdn.net/zhuge1127/article/details/82494783#rebase-vs-merge](https://blog.csdn.net/zhuge1127/article/details/82494783#rebase-vs-merge)

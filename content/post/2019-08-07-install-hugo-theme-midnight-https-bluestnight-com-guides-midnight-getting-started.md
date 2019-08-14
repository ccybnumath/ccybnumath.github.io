---
title: Install Hugo & Theme Midnight
author: chencanyi
date: '2019-08-07'
slug: install-hugo-theme-midnight-https-bluestnight-com-guides-midnight-getting-started
categories:
  - linux
tags:
  - hugo
disable_comments: yes
hide_authorbox: yes
---
Mainly follow [quick-start](https://gohugo.io/getting-started/quick-start/).

* Installment
```bash
sudo apt-get update
sudo apt-get install hugo
hugo version # check version
hugo new site www.chencanyi.cn
cd www.chencanyi.cn
git init
git submodule add https://gitlab.com/BluestNight/Midnight.git themes/Midnight
cp themes/Midnight/exampleS
ite/config.toml . -f
```
* Add some content(Optional)
```bash
hugo new posts/my-first-post.md
```
* Start server
```bash
hugo server -D
```
## References
* [https://bluestnight.com/guides/midnight/getting-started/](https://bluestnight.com/guides/midnight/getting-started/)
* [https://themes.gohugo.io/theme/Midnight/](https://themes.gohugo.io/theme/Midnight/)
* [https://gohugo.io/getting-started/quick-start/](https://gohugo.io/getting-started/quick-start/)
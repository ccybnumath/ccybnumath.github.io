---
title: Prefix bash code with $ using `awk`
author: chencanyi
date: '2019-08-06'
slug: prefix-bash-code-with-using-awk
categories:
  - linux
tags:
  - awk
---
## Problem
We plan to prefix $ before bash code block.
## Solution
Use `awk` in bash line to progress strings.
```bash
# .zshrc
alias bashcode=Bashcode
function Bashcode(){
        history | awk '{print "$ " $2}'
}
```
## References
* [http://www.ruanyifeng.com/blog/2018/11/awk.html](http://www.ruanyifeng.com/blog/2018/11/awk.html)
* [https://gregable.com/2010/09/why-you-should-know-just-little-awk.html](https://gregable.com/2010/09/why-you-should-know-just-little-awk.html)

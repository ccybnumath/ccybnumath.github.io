---
title: gohugo & mklink & sed & Typora
author: chen canyi
date: 2019-8-14
---

* Hard link in windows


```bash
mklink /d "C:\Users\chencanyi\Desktop\Typora" "D:\Documents\RStudio\ccybnumath.github.io\content\post"
mklink /d "C:\Users\chencanyi\Desktop\Typora\images" "C:\Users\chencanyi\Desktop\Typora\images"
```

* Typora

  ![1565787183436](/images/2019-8-14-gohugo-&-mklink-&-sed.assets/1565787183436.png)

* `sed` regular expression

  set `![1565787183436](images/2019-8-14-gohugo-&-mklink-&-sed.assets/1565787183436.png)` to `![1565787183436](/images/2019-8-14-gohugo-&-mklink-&-sed.assets/1565787183436.png)`
  
  ```bash
  find ./content/post/ -type f -name \*.md -exec sed -i 's!(images!(/images!g' {} \;
  ```

* blogupload.sh

  ```bash
  find ./content/post/ -type f -name \*.md -exec sed -i 's!(images!(/images!g' {} \;
  hugo
  git add .
  git commit -m "autopush from blogpush"
  git push
  cd public
  git add .
  git commit -m "autopush from blogpush"
  git push
  cd ..
  ```

  ## References

* (mklink /d hard link)[https://www.cnblogs.com/gx018/p/gx002.html]
* (`sed`)[https://blog.csdn.net/qq_37373203/article/details/86020048]
* (https://www.everythingcli.org/find-exec-vs-find-xargs/)[https://www.everythingcli.org/find-exec-vs-find-xargs/]

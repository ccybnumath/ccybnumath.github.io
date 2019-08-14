#!/usr/bin/env sh
cd /d/Documents/RStudio/ccybnumath.github.io/
cd ./content/post/
find . -type f -name \*.md | grep -f old.file -v |xargs sed -i 's!(images!(/images!g'
cd ..
cd ..

hugo
git add .
git commit -m "autopush from blogpush"
git push
cd public
git add .
git commit -m "autopush from blogpush"
git push
cd ..
cd ./content/post/
find . -type f -name \*.md > old.file
cd ..
cd ..


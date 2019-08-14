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

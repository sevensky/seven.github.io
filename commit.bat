git remote add origin git@github.com:sevensky/seven.github.io.git
git remote add origin https://github.com/sevensky/seven.github.io.git

git checkout -b source

git add .
git commit -am "Initial commit"

git push -u origin source
git push -u origin master
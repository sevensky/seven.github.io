提交
=
    git  commit -m "changes log"
    alias tijiao='git  commit -m "changes log"'
推送
=
    git push -u origin master
    alias tuisong='git push -u origin master'

How do I commit all deleted files in Git?
=
This tells git to automatically stage tracked files
-- including deleting the previously tracked files.

    $ git add -u

If you are using git 2.0, you should now use:

    $ git add -u :/

Warning, starting git 2.0 (mid 2013),
this will stage files on the whole working tree.
If you want to stage file only under your current path with that working tree,
then you need to use

    $ git add -u .

## git修改远程仓库地址
#### 方法有三种：
##### 1.修改命令
    git remote origin set-url [url]
##### 2.先删后加
    git remote rm origin
    git remote add origin [url]
##### 3.直接修改config文件

## 查看当前的远程库
    git remote

## 获取
    git fetch origin
## 拉取
    git -c diff.mnemonicprefix=false -c core.quotepath=false fetch origin
    git -c diff.mnemonicprefix=false -c core.quotepath=false pull --no-commit origin gh-pages
    From https://github.com/sevensky/peripheral_brain
     * branch            gh-pages   -> FETCH_HEAD


    Already up-to-date.


    git -c diff.mnemonicprefix=false -c core.quotepath=false submodule update --init --recursive

## 丢弃重置所有
    git -c diff.mnemonicprefix=false -c core.quotepath=false reset -q --hard HEAD --
    git -c diff.mnemonicprefix=false -c core.quotepath=false submodule update --init --recursive

## 如何 clone git 项目到一个非空目录 [url](http://www.oschina.net/question/54100_167919)
    解决的办法是：
    - 进入非空目录，假设是 /workdir/proj1
    - git clone --no-checkout https://git.oschina.net/NextApp/platform.git tmp
    - mv tmp/.git .
    - rmdir tmp
    - git reset --hard HEAD
    然后就可以进行各种正常操作了。

## --no-checkout后还原
    git -c diff.mnemonicprefix=false -c core.quotepath=false checkout master
    git -c diff.mnemonicprefix=false -c core.quotepath=false submodule update --init --recursive
    git -c diff.mnemonicprefix=false -c core.quotepath=false checkout 6a2465e43be4b73597af3ff0f21b96a37d521290
    git checkout -b <new-branch-name>
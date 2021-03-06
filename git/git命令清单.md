<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

 - [git命令清单](#git%E5%91%BD%E4%BB%A4%E6%B8%85%E5%8D%95)
   - [1. 新建代码库](#1-%E6%96%B0%E5%BB%BA%E4%BB%A3%E7%A0%81%E5%BA%93)
   - [2. 配置](#2-%E9%85%8D%E7%BD%AE)
   - [3.  增加/删除文件](#3--%E5%A2%9E%E5%8A%A0%E5%88%A0%E9%99%A4%E6%96%87%E4%BB%B6)
   - [4. 代码提交](#4-%E4%BB%A3%E7%A0%81%E6%8F%90%E4%BA%A4)
   - [5. 分支](#5-%E5%88%86%E6%94%AF)
   - [6. 标签](#6-%E6%A0%87%E7%AD%BE)
   - [7. 查看信息](#7-%E6%9F%A5%E7%9C%8B%E4%BF%A1%E6%81%AF)
   - [8. 远程同步](#8-%E8%BF%9C%E7%A8%8B%E5%90%8C%E6%AD%A5)
   - [9. 撤销](#9-%E6%92%A4%E9%94%80)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

 git命令清单
-----
[阮一峰:常用git命令清单](http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html)

这是在了解了git基础知识的情况下，作为平常开发使用的命令手册。git基本知识可以参考一下博客：

[廖雪峰git教程](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

[阮一峰：git远程操作详解](http://www.ruanyifeng.com/blog/2014/06/git_remote.html)

[阮一峰：git分支管理策略](http://www.ruanyifeng.com/blog/2012/07/git.html)

[阮一峰：git工作流程](http://www.ruanyifeng.com/blog/2015/12/git-workflow.html)

[易百git教程](https://www.yiibai.com/git/)


**以下是复制粘贴**

一般来说，日常使用只要记住下图6个命令，就可以了。但是熟练使用，恐怕要记住60～100个命令。

![./pic/git命令清单/1.png](http://oojl6chve.bkt.clouddn.com//18-8-2/22454273.jpg)

[//]:  ![./pic/git命令清单/1.png](./pic/git命令清单/1.png)
几个专用名词的译名如下。
*   Workspace：工作区
*   Index / Stage：暂存区
*   Repository：仓库区（或本地仓库）
*   Remote：远程仓库

# 1. 新建代码库

```bash
# 在当前目录新建一个Git代码库
$ git init

# 新建一个目录，将其初始化为Git代码库
$ git init [project-name]

# 下载一个项目和它的整个代码历史
$ git clone [url]
```


# 2. 配置
```bash
# 显示当前的Git配置
$ git config --list

# 设置提交代码时的用户信息
$ git config [--global] user.name "[name]"
$ git config [--global] user.email "[email address]"
```

# 3.  增加/删除文件

```bash
# 添加指定文件到暂存区
$ git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
$ git add [dir]

# 添加当前目录的所有文件到暂存区
$ git add .

# 添加每个变化前，都会要求确认
# 对于同一个文件的多处变化，可以实现分次提交
$ git add -p

# 删除工作区文件，并且将这次删除放入暂存区
$ git rm [file1] [file2] ...

# 停止追踪指定文件，但该文件会保留在工作区
$ git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
$ git mv [file-original] [file-renamed]
```

# 4. 代码提交

```bash
# 提交暂存区到仓库区
$ git commit -m [message]

# 提交暂存区的指定文件到仓库区
$ git commit [file1] [file2] ... -m [message]

# 提交工作区自上次commit之后的变化，直接到仓库区
$ git commit -a

# 提交时显示所有diff信息
$ git commit -v

# 使用一次新的commit，替代上一次提交
# 如果代码没有任何新变化，则用来改写上一次commit的提交信息
$ git commit --amend -m [message]

# 重做上一次commit，并包括指定文件的新变化
$ git commit --amend [file1] [file2] ...
```

# 5. 分支

```bash
# 列出所有本地分支
$ git branch

# 列出所有远程分支
$ git branch -r

# 列出所有本地分支和远程分支
$ git branch -a

# 新建一个分支，但依然停留在当前分支
$ git branch [branch-name]

# 新建一个分支，并切换到该分支
$ git checkout -b [branch]

# 新建一个分支，指向指定的commit
$ git branch [branch] [commit]

#拉取远程分支到贝蒂
 git fetch origin [branch_name]
# 创建远程origin的dev分支到本地

$ git checkout -b dev origin/dev


# 新建一个分支，与指定的远程分支建立追踪关系
$ git branch --track [branch] [remote-branch]

# 切换到指定分支，并更新工作区
$ git checkout [branch-name]

# 切换到上一个分支
$ git checkout -

# 建立追踪关系，在现有分支与指定的远程分支之间
$ git branch --set-upstream [branch] [remote-branch]

# 合并指定分支到当前分支
$ git merge [branch]

# 选择一个commit，合并进当前分支
$ git cherry-pick [commit]

# 删除分支
$ git branch -d [branch-name]

# 删除远程分支
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]
```

# 6. 标签

```bash
# 列出所有tag
$ git tag

# 新建一个tag在当前commit
$ git tag [tag]

# 新建一个tag在指定commit
$ git tag [tag] [commit]

# 删除本地tag
$ git tag -d [tag]

# 删除远程tag
$ git push origin :refs/tags/[tagName]

# 查看tag信息
$ git show [tag]

# 提交指定tag
$ git push [remote] [tag]

# 提交所有tag
$ git push [remote] --tags

# 新建一个分支，指向某个tag
$ git checkout -b [branch] [tag]
```

# 7. 查看信息

```bash
# 显示有变更的文件
$ git status

# 显示当前分支的版本历史
$ git log  [--pretty=oneline]

# 显示commit历史，以及每次commit发生变更的文件
$ git log --stat

# 搜索提交历史，根据关键词
$ git log -S [keyword]

# 显示某个commit之后的所有变动，每个commit占据一行
$ git log [tag] HEAD --pretty=format:%s

# 显示某个commit之后的所有变动，其"提交说明"必须符合搜索条件
$ git log [tag] HEAD --grep feature

# 显示某个文件的版本历史，包括文件改名
$ git log --follow [file]
$ git whatchanged [file]

# 显示指定文件相关的每一次diff
$ git log -p [file]

# 显示过去5次提交
$ git log -5 --pretty --oneline

# 显示所有提交过的用户，按提交次数排序
$ git shortlog -sn

# 显示指定文件是什么人在什么时间修改过
$ git blame [file]

# 显示暂存区和工作区的差异
$ git diff

# 显示暂存区和上一个commit的差异
$ git diff --cached [file]

# 显示工作区与当前分支最新commit之间的差异
$ git diff HEAD 

# 显示工作区与当前分支fie文件之间的差异
$ git diff HEAD -- [file]

# 显示两次提交之间的差异
$ git diff [first-branch]...[second-branch]

# 显示今天你写了多少行代码
$ git diff --shortstat "@{0 day ago}"

# 显示某次提交的元数据和内容变化
$ git show [commit]

# 显示某次提交发生变化的文件
$ git show --name-only [commit]

# 显示某次提交时，某个文件的内容
$ git show [commit]:[filename]

# 显示当前分支的最近几次提交
$ git reflog
 
 # 查看分支的合并情况
$ git log --graph --pretty=oneline --abbrev-commit

```

# 8. 远程同步 
```bash
# 下载远程仓库的所有变动
$ git fetch [remote]

# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]

# 强行推送当前分支到远程仓库，即使有冲突
$ git push [remote] --force

# 推送所有分支到远程仓库
$ git push [remote] --all
```

# 9. 撤销

```bash
# 让这个文件回到最近一次git commit或git add时的状态。
$ git checkout [--] [file]

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [--] [file]

# 恢复版本库的所有文件到工作区
$ git checkout .

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset　HEAD [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset  --hard HEAD

# 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
$ git reset --hard [commit]

# 重置当前HEAD为指定commit，但保持暂存区和工作区不变
$ git reset --keep [commit]

# 新建一个commit，用来撤销指定commit
# 后者的所有变化都将被前者抵消，并且应用到当前分支
$ git revert [commit]

# 暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
```

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

  - [Git](#git)
- [分支管理](#%E5%88%86%E6%94%AF%E7%AE%A1%E7%90%86)
  - [分支介绍](#%E5%88%86%E6%94%AF%E4%BB%8B%E7%BB%8D)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Git
---
# 分支管理
## 分支介绍
* **主分支Master**:代码库应该有一个、且仅有一个主分支。所有提供给用户使用的正式版本，都在这个主分支上发布。Git主分支的名字，默认叫做Master。它是自动建立的，版本库初始化以后，默认就是在主分支在进行开发。

* **开发分支Develop**:主分支只用来分布重大版本，日常开发应该在另一条分支上完成。我们把开发用的分支，叫做Develop。这个分支可以用来生成代码的最新隔夜版本（nightly）。如果想正式对外发布，就在Master分支上，对Develop分支进行"合并"（merge）.

前面讲到版本库的两条主要分支：Master和Develop。前者用于正式发布，后者用于日常开发。其实，常设分支只需要这两条就够了，不需要其他了。
但是，除了常设分支以外，还有一些临时性分支，用于应对一些特定目的的版本开发。临时性分支主要有三种：**功能（feature）分支**、**预发布（release）分支**、**修补bug（fixbug）分支**。

这三种分支都属于临时性需要，使用完以后，应该删除，使得代码库的常设分支始终只有Master和Develop。
* **功能分支**：它是为了开发某种特定功能，从Develop分支上面分出来的。开发完成后，要再并入Develop。
* **预发布分支**：它是指发布正式版本之前（即合并到Master分支之前），我们可能需要有一个预发布的版本进行测试。预发布分支是从Develop分支上面分出来的，预发布结束以后，必须合并进Develop和Master分支。它的命名，可以采用release-*的形式。

目的
=============

* 我想要使用opensuse kiwi持续构建系统，我需要一个可以运行kiwi的opensuse节点
* 这是个鸡跟蛋的问题，我需要先有一个基本的系统，这个是节点基本系统vagrant构建源码
* 将来目标是使用这个基础节点创建出这个基础节点，用opensuse kiwi持续构建opensese kiwi节点
* 目前我还不能使用kiwi生成opensuse kiwi镜像，所以先使用vagrant创建，借助外力创建鸡，让其生蛋


使用步骤
============

* ci运行 `ci.sh` 进行系统构建
* 构建运行 `script.sh` 安装节点需要的软件以及配置
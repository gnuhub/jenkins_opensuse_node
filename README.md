why
=============
```
* 项目使用的jenkins slave是我当初本地环境脚本构建的
* 我想要使用opensuse kiwi持续构建系统slave,最终可以制作iso kvm各种平台包括vagrant使用的镜像
* 为了使用kiwi持续构建系统镜像，我需要一个可以运行kiwi的opensuse节点
* 这是个鸡跟蛋的问题，我需要先有一个基本的系统，这个是节点基本系统vagrant构建源码
* 将来目标是使用这个基础节点创建出这个基础节点，用opensuse kiwi持续构建opensese kiwi节点
* 目前我还不能使用kiwi生成opensuse kiwi镜像，所以先使用vagrant创建，借助外力创建鸡，让其生蛋
```

文件说明
============

* `ci.sh` 进行虚拟机构建(不初始化，可以快速检查`script.sh`)
* `script.sh` 在虚拟机内执行的脚本
* `jenkins_ci.sh` jenkins job执行的脚本 重新初始化系统 安装 配置 将配置好的系统导出
* `jenkins_opensuse_node.xml` jenkins job jenkins_opensuse_node自动导出的配置
* `Vagrantfile` vagrant 配置文件
* `authorized_keys` 本地无密码登陆认证的公钥

外部依赖
============

* `jenkins.cli` ~/bin/下jenkins cli接口的封装脚本
* `~/tmp/jenkins.jar` 与jenkins 交互的 cli 可执行jar
* `opensuse13.1` [vagrant cloud opensuse-13.1-x86_64 box](https://vagrantcloud.com/berendt/opensuse-13.1-x86_64)

最终目标
=============

```
这是一个过渡系统，
最终使用kiwi构建出jenkins_opensuse_node镜像
然后使用镜像启动节点来构建镜像
```
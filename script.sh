#!/usr/bin/env bash
set -x
# 增加kiwi v开发版软件包源
#sudo zypper --gpg-auto-import-keys  ar -f http://download.opensuse.org/repositories/Virtualization:/Appliances/openSUSE_13.1/ openSUSE-13.1-DEV
# 删除源
sudo zypper rr openSUSE-13.1-DEV
# 修改root密码
sudo su - root -c 'echo "root:gnuhub" | chpasswd'
# 安装rsync
sudo zypper -n install rsync
# 安装jdk
sudo zypper -n in /vagrant/jdk-7u65-linux-x64.rpm
# 安装kiwi
sudo zypper -n install kiwi
# 安装git
sudo zypper -n install git
# 修改时区
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 更新时间
sudo ntpdate cn.pool.ntp.org
# 安装c c++ 开发工具包 
sudo zypper -n install patterns-openSUSE-devel_C_C++
# 创建 root ssh目录
sudo su - root -c 'mkdir ~/.ssh/'
sudo su - root -c 'cp -f /vagrant/authorized_keys ~/.ssh/'

# 安装kiwi最新版
cd /opt
if ! [ -f kiwi-5.06.132-835.1.x86_64.rpm ];then
	wget http://download.opensuse.org/repositories/Virtualization:/Appliances/openSUSE_13.1/x86_64/kiwi-5.06.132-835.1.x86_64.rpm
fi
sudo zypper -n in kiwi-5.06.132-835.1.x86_64.rpm
kiwi --version
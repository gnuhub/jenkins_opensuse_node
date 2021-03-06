#!/usr/bin/env bash
set -x
# 增加kiwi 开发版 软件包源
#sudo zypper rr openSUSE-13.1-DEV
sudo zypper rr Virtualization_Appliances

# 修改root密码
sudo su - root -c 'echo "root:gnuhub" | chpasswd'
# 安装rsync
sudo zypper -n install rsync
# 安装jdk
sudo zypper -n in /vagrant/jdk-7u65-linux-x64.
# 安装git
sudo zypper -n install git
# 修改时区
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 更新时间
# sudo ntpdate cn.pool.ntp.org
# 安装c c++ 开发工具包 
sudo zypper -n install patterns-openSUSE-devel_C_C++

# 安装kiwi
sudo zypper -n install genisoimage
# 安装kiwi测试需要的模块 https://github.com/gnuhub/kiwi/issues/6
sudo zypper -n install perl-Test-Unit-Lite
sudo zypper addrepo -G http://download.opensuse.org/repositories/Virtualization:Appliances/openSUSE_13.1/Virtualization:Appliances.repo
sudo zypper mr -p 1 Virtualization_Appliances
sudo zypper refresh
sudo zypper -n install --from Virtualization_Appliances --force-resolution kiwi
sudo zypper -n install --from Virtualization_Appliances --force-resolution kiwi-desc-vmxboot 
sudo zypper -n install --from Virtualization_Appliances --force-resolution kiwi-templates
sudo zypper -n install --from Virtualization_Appliances --force-resolution kiwi-doc
sudo zypper rr Virtualization_Appliances


# 创建 root ssh目录
sudo su - root -c 'mkdir ~/.ssh/'
sudo su - root -c 'cp -f /vagrant/authorized_keys ~/.ssh/'
sudo su - root -c 'cat ~/.ssh/authorized_keys'
sudo su - root -c 'kiwi --version'
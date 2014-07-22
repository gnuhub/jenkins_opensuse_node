#!/usr/bin/env bash
set -x
# ci需要运行的脚本
vagrant halt -f
# 启动当前虚拟机
vagrant up
vagrant ssh -c "sudo /vagrant/script.sh"


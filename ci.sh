#!/usr/bin/env bash
set -x
# ci需要运行的脚本
# 删除当前虚拟机
vagrant destroy -f 
# 启动当前虚拟机
vagrant up

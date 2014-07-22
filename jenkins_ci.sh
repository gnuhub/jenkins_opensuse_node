#/usr/bin/env bash
set -x
cd ~/gnuhub/git/jenkins_opensuse_node
vagrant destroy -f 
./ci.sh
vagrant halt -f
vagrant package --output jenkins_opensuse_node_${BUILD_NUMBER}.box
jenkins.cli get-job jenkins_opensuse_node > jenkins_opensuse_node.xml
vagrant box add jenkins_opensuse_node_${BUILD_NUMBER} jenkins_opensuse_node_${BUILD_NUMBER}.box

# 防止本地没有提交代码
git add .
git commit -a -m "jenkins backup"
# 用分支名与jenkins build对应
git checkout -b build_${BUILD_NUMBER}
git push origin HEAD
# 回到主开发分支
git checkout master

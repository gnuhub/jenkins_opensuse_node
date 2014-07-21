#/usr/bin/env bash
set -x
cd ~/gnuhub/git/jenkins_opensuse_node
vagrant destroy -f 
./ci.sh
vagrant halt -f
vagrant package --output jenkins_opensuse_node_${BUILD_NUMBER}.box
jenkins.cli get-job jenkins_opensuse_node > jenkins_opensuse_node.xml
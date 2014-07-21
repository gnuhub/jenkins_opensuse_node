#/usr/bin/env bash
set -x
cd ~/gnuhub/git/jenkins_opensuse_node
./ci.sh
vagrant halt -f
vagrant package --output jenkins_opensuse_node_${BUILD_NUMBER}.box
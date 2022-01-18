#!/bin/bash


IP=$(hostname -I | awk '{print $1}')

RED='\033[1;31m' # Red Color
GREEN='\033[1;32m' # Green Color
NC='\033[0m' # No Color

#------------------------ install gitlab locally -------------------------------
sudo curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://$IP" apt-get install gitlab-ee
sudo gitlab-ctl reconfigure
echo "Username: root" > /home/afaraji/git-credentiels.txt && \
sudo cat /etc/gitlab/initial_root_password | grep -v "#" | grep "\S" >> /home/afaraji/git-credentiels.txt
echo "################## go to $IP and coonect using ########################"
sudo cat /home/afaraji/git-credentiels.txt
echo "#######################################################################"
echo "username and password saved in ~/git-credentiels.txt"
echo $IP
echo "END - installing gitlab - "
#-------------------------------------------------------------------------------

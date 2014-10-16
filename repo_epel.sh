#!/bin/bash
########### add epel-repo ############
#cat <<EOM | sudo tee -a /etc/yum.repos.d/epel.repo
#[epel]
#name=epel
##baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
#baseurl=http://192.168.1.140/yum-repo/epel
#enabled=1
#gpgcheck=0
#EOM

if ! rpm -q epel-release > /dev/null; then
  sudo rpm -ihv http://192.168.1.140/vmshare/epel-release-6-8.noarch.rpm

############## .repo backup ###################
cp -p /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak

############ comment out mirrorlisr ##############
for i in epel ; do
sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/$i.repo
done

############### sed epel.repo #################
sed -i -e 's:^#baseurl=http\://download.fedoraproject.org/pub/epel/6/$basearch:baseurl=http\://192.168.1.140/yum-repo/epel/:g' /etc/yum.repos.d/epel.repo

fi

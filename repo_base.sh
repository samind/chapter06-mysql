#!/bin/bash
############## CentOS-Base.repo backup ###################
cp -p /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

############ comment out mirrorlisr ##############
for i in CentOS-Base ; do
sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/$i.repo
done

############### sed yum.repo #################
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/os/$basearch/:baseurl=http\://192.168.1.140/yum-repo/base/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/updates/$basearch/:baseurl=http\://192.168.1.140/yum-repo/updates/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/extras/$basearch/:baseurl=http\://192.168.1.140/yum-repo/extras/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/centosplus/$basearch/:baseurl=http\://192.168.1.140/yum-repo/centosplus/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/contrib/$basearch/:baseurl=http\://192.168.1.140/yum-repo/contrib/:g' /etc/yum.repos.d/CentOS-Base.repo

#!/bin/bash

if ! rpm -q remi-release > /dev/null; then
  sudo rpm -ihv http://192.168.1.140/vmshare/remi-release-6.rpm

############## *.repo backup ###################
cp -p /etc/yum.repos.d/remi.repo /etc/yum.repos.d/remi.repo.bak

############ comment out mirrorlisr ##############
for i in remi ; do
sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/$i.repo
done

############### sed remi.repo #################
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/remi/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/php55/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-php55/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/php56/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-php56/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/test/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-test/:g' /etc/yum.repos.d/remi.repo

fi

############ enable=1 ##############

if [ `grep -c enabled=1 /etc/yum.repos.d/remi.repo` = 0 ]; then
  for i in `seq 1 2` ; do
  sed -i -e '1,/enabled=0/s/enabled=0/enabled=1/g' /etc/yum.repos.d/remi.repo
  done

 else
 exit 0
fi

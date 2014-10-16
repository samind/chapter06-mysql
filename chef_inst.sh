#!/bin/bash
########### chef install #############
if ! rpm -q chef > /dev/null; then
  sudo rpm -ihv http://192.168.1.140/vmshare/chef-11.16.2-1.el6.x86_64.rpm
fi

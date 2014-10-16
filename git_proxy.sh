#!/bin/bash
file=/home/vagrant/.gitconfig

if [ -e $file ]; then
    exit 0
else
echo "[http]" > $file
echo "       proxy = http://proxy2.nttcom.co.jp:8080" >> $file
echo "[https]" >> $file
echo "       proxy = http://proxy2.nttcom.co.jp:8080" >> $file

fi



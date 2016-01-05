#!/usr/bin/env bash

if [ $ROOT_PASS -eq '']
then 
  echo 'root:root' | chpasswd
else
  echo "root:$ROOT_PASS"
  echo "root:$ROOT_PASS" | chpasswd
fi

if [ $USER_PASS -eq '']
then
  echo 'jack:jack' | chpasswd
else
  echo "jack:$USER_PASS"
  echo "jack:$USER_PASS" | chpasswd
fi



/usr/sbin/sshd -D

#!/bin/sh

[ -z $1 ] && echo "usage: ./test.sh <module/playbook>" && exit

ip=$(quik deploy 512mb | tee /dev/stderr | awk '$1 == "new" {print $4}')
sleep 10
echo "SERVERS = void@$ip" > config.mk
make ln
cd $1
make
echo "$(tput setaf 10)Okay, now verify it's working$(tput sgr0)"
ssh void@$ip
quik rm $ip

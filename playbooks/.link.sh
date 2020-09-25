#!/bin/sh

for fd in $(ls .)
do
	[ -d $fd ] && {
		cd $fd 
		ln -s ../makefile ./makefile 2>/dev/null
		ln -s ../config.mk ./config.mk 2>/dev/null
		cd ..
	}
done

#!/bin/bash
dir_name="/data/repositories.bak/poject/"
proname=`ls ${dir_name}`
url="git@127.0.0.1:code/"
cd $dir_name

for i in $proname
do
	cd $i
	git init
	git remote add origin ${url}${i}
	git add ./*
	git commit -m "Initial commit"
	git push -u origin master
	echo "pwd:`pwd`"
	echo "name:$i"
	cd ..
done

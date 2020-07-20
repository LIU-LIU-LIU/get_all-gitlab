#!/bin/bash
#同步gitlab
#按需设置以下变量key url
#对脚本传参控制功能
#get|获取所有库名到projects_name.txt
#clone|在./repository克隆所有库
#pull|同步./repository的所有库

key="serdgaaaaaaaaaaprC-L"
url="http://127.0.0.1/api/v4/"

get_name(){
num=`curl -si --header "PRIVATE-TOKEN: ${key}" "${url}projects/?per_page=1&page=1" | grep "X-Total:" | awk '{print $2}'`
let "num++"

echo "" > projects_name.txt
echo "------开始获取库名-----"
i=1
while (( i<$num ))
do
	echo $i
	curl -s --header "PRIVATE-TOKEN: ${key}" "${url}projects/?simple=true&per_page=1&page=$i" | awk -F'ssh_url_to_repo":"|","http_url_to_repo' '{print $2}' >> projects_name.txt
	let "i++"
done
}
#获取所有库名

clone(){
	projects=`cat projects_name.txt`
	if [ -e repository ]
	then
		cd ./repository
	else
		mkdir ./repository
		cd ./repository
	fi
	for name in ${projects}
	do
		echo "------开始克隆${name}-----"
		git clone ${name}
	done
}
#克隆所有库

pull(){
	if [ -e repository ]
	then
		cd ./repository
	else
		echo "repository目录不存在，无法同步。请先克隆一遍所有库。(./get_all.sh clone)"
		exit
	fi
	dirs=`ls`
	for dir in ${dirs}
	do
		cd ${dir}
		echo "------开始同步${dir}-----"
		git pull
		cd ..
	done
}
#同步所有库

case $1 in
get)
	get_name
;;
clone)
	clone
;;
pull)
	pull
;;
*)
	echo -e "#对脚本穿参控制功能\n#get|获取所有库名到projects_name.txt\n#clone|在./repository克隆所有库\n#pull|同步./repository的所有库"
esac

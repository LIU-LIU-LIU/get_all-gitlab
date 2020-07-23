#!/bin/bash
projects=`cat ./projects_list.txt`
api-key="defqrsghj"
url="http://127.0.0.1:8088/api/v4/"

for proname in $projects
do
	info="name=$proname&path=$proname&namespace_id=4&visibility=internal&private_token=$api-key"
	curl -d "$info" ${url}projects
	echo "$info"
done

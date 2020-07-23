# get_all-gitlab
同步 克隆 上传gitlab所有库
一些可以用来备份恢复gitlab的脚本

---

## get_all.sh
导出同步脚本
一个完整的导出步骤是，
1. 编辑此脚本填入api-key和url
2. `./get_all.sh get_name`获取所有项目名
3. `./get_all.sh clone`从gitlab中克隆所有库
4. 设置定时任务，每过一段时间执行一下`./get_all.sh pull`同步所有库。
### get_name
运行./get_all.sh脚本并传参get_name
获取gitlab所有项目名，并输出至当前目录projects_name.txt中。(不存在则创建，存在则覆盖。)
### clone
运行./get_all.sh脚本并传参clone
从projects_name.txt中获取项目名，遍历克隆项目到当前路径repository目录中。（此目录不存在则创建。）
### pull
运行./get_all.sh脚本并传参pull
遍历路径repository中所有文件夹，（此目录不存在则终止。）并从gitlab中同步。

---

## create-project.sh
遍历当前路径repository中的所有目录，使用gitlab-api批量创建空项目。
## push-project.sh
遍历当前路径repository中的所有目录，并进入目录中，逐个初始化git(git init)，并推到gitlab中。

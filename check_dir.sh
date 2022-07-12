#!/bin/bash
read -p  "Просьба указать  директорию: " dir
#echo "$dir"
cd /$dir/ 
#sudo ls -lsa
sudo du -d 1 /$dir | sort -n -r | awk '{print $1/1024 " MB " $2}'



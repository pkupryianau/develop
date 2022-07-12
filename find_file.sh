#!/bin/bash

max_size=`find /etc -user root  -type f -exec ls -alh {} \; | sort -hr -k5 | head -n 1`
echo "Самый большой файл: $max_size"

max_length=`find /etc -user root -print | awk -F/ '{print length($NF)" "$NF}' | sort -k1,1nr | head -1`
echo "Самое длинное имя файла: $max_length"


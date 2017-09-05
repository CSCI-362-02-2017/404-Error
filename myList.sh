#!/bin/bash
echo "" > myList.html;
for i in $(ls -d */); do echo ${i} >> myList.html;
xdg-open ./myList.html;
done

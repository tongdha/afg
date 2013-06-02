#!/bin/bash

count=$1

for i in `pgrep -f unicorn`
do
   let count-=1
done

cd /var/www/afg/current
while [ $count -gt 0 ]
do
   ./runafg.sh
   let count-=1
done

#!/bin/bash

. /home/ec2-user/.bash_profile

cd /var/www/afg/current

pid=$$

nohup rvmsudo RAILS_ENV=production bundle exec unicorn -p 80 > ./log/afg_${pid}.log 2>&1 &&
#nohup rvmsudo bundle exec unicorn -p 80 > ./log/afg_${pid}.log 2>&1 &&

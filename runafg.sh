#!/bin/bash

. /home/ec2-user/.bash_profile

cd /var/www/afg/current

nohup rvmsudo RAILS_ENV=production bundle exec unicorn -p 80 &

#!/bin/bash

pids=`pgrep -f .*unicorn.*`
for pid in ${pids[@]}
do
  sudo kill -9 $pid
done

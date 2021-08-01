#!/usr/bin/sh

for cfg in $(cat configs.list) 
do
  me=$(whoami)
  from=$(echo $cfg | sed "s/__usrname__/$me/")
  to="./src$cfg"
  echo "Copying $cfg"
  mkdir -p `dirname $to`
  cp $from $to
done

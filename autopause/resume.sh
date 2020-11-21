#!/bin/bash

. /start-utils

if [[ $( ps -a -o stat,comm | grep 'java' | awk '{ print $1 }') =~ ^T.*$ ]] ; then
  logAutopauseAction "Knocked, resuming Java process"
  killall -q -CONT java
  fg 1 # frontground process should be resumed by `fg <job-id>`
fi

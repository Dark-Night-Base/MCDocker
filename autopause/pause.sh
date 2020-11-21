#!/bin/bash

. /start-utils

# use [p]ython3 to exclude grep itself
if [[ $( ps -a -o stat,command | grep '[p]ython3 MCDReforged.py' | awk '{ print $1 }') =~ ^S.*$ ]] ; then
  # wait until mc-monitor is no longer connected to the server
  while :
  do
    if [[ -z "$(netstat -nt | grep "$SERVER_PORT" | grep 'ESTABLISHED')" ]]; then
      break
    fi
    sleep 0.1
  done

  # finally pause the process
  logAutopauseAction "Pausing Java process"
  kill -STOP $(ps -a -o pid,command | grep '[p]ython3 MCDReforged.py' | awk '{ print $1 }')
fi

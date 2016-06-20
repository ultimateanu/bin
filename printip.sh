#!/usr/bin/env bash


EXT_IP=$(curl --silent ipinfo.io/ip)
unameStr=$(uname)
if [[ "$unameStr" == 'Darwin' ]]; then
  LOCAL_IP=`ifconfig  | grep -E 'inet.[0-9]' | grep -v '127.\|169.' | awk '{ print $2}'`
  terminal-notifier -message "$LOCAL_IP"$'\n'$"$EXT_IP" -title "IP Address"
elif [[ "$unameStr" == 'Linux' ]]; then
  LOCAL_IP=$(ip route get 1 | awk '{print $NF;exit}')
  notify-send "IP Address" "$LOCAL_IP\n$EXT_IP"
fi

printf "\tLocal IP:\n$LOCAL_IP\n\n"
printf "\tExternal IP:\n$EXT_IP\n"

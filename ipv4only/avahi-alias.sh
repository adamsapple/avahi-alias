#!/bin/bash
set -e
SUBDOMAIN=$1
HOSTNAMES=($(uname -n))
HOSTNAMES+=("octprint")
IFACE="wlan0"
#ADDRS=$(ip a show dev eth0 | awk '$1~/inet/{print $2}' | cut -d/ -f1)
ADDR=""
ctr=0

while [ -z "$ADDR" ]
do
  if [ $ctr -ne 0 ];then
	  sleep 3
  fi
  
  ADDR=$(ip addr show dev $IFACE | grep -w inet | grep -Eo '([0-9]+(\.[0-9]+){3})' | head -1)
  #echo $ctr
  ctr=$(( ctr + 1 ))
done

echo hosts: ${HOSTNAMES[@]}
echo addr : $ADDR

for HOSTNAME in ${HOSTNAMES[@]}; do
  echo "Add $HOSTNAME.local $ADDR"
  #/usr/bin/avahi-publish -a -R $SUBDOMAIN.$HOSTNAME.local $ADDR&
  /usr/bin/avahi-publish -a -R $HOSTNAME.local $ADDR&
done

wait

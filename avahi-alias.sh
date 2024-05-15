#!/bin/bash
set -e
SUBDOMAIN=$1
HOSTNAMES=($(uname -n))
HOSTNAMES+=("octprint")
#ADDRS=$(ip a show dev eth0 | awk '$1~/inet/{print $2}' | cut -d/ -f1)
ADDR=$(ip addr show dev wlan0 | grep -w inet | grep -Eo '([0-9]+(\.[0-9]+){3})' | head -1) 


echo ${HOSTNAMES[@]}
echo $ADDR


for HOSTNAME in ${HOSTNAMES[@]}; do
    echo "Add $HOSTNAME.local $ADDR"
    #/usr/bin/avahi-publish -a -R $SUBDOMAIN.$HOSTNAME.local $ADDR&
	/usr/bin/avahi-publish -a -R $HOSTNAME.local $ADDR&
done

wait

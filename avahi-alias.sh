#!/bin/bash
set -e
NIC=$1
SUBDOMAIN=$2
HOSTNAME=$(uname -n)
#ADDDOMAIN=$SUBDOMAIN.$HOSTNAME.local
ADDDOMAIN=$SUBDOMAIN.local
ADDRS=$(ip a show dev $NIC | awk '$1~/inet/{print $2}' | cut -d/ -f1)

for ADDR in $ADDRS; do
    echo "Add $ADDDOMAIN $ADDR"
    /usr/bin/avahi-publish -a -R $ADDDOMAIN $ADDR &
done
wait

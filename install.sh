#!/usr/bin/sh

DOMAIN_ALIAS=$1
SERVICE_FILE="avahi-alias@${DOMAIN_ALIAS}.service"
SERVICE_FILE_PATH="/etc/systemd/system/$SERVICE_FILE"
CONF_FILE="avahi-alias@${DOMAIN_ALIAS}"
CONF_FILE_PATH="/etc/default/$CONF_FILE"

if [ -z "$1" ]; then
  echo "Error: require domain name. <arg1>"
  exit 1
fi

if [ ! -e $SERVICE_FILE_PATH ]; then    
    echo install service
    cp $SERVICE_FILE $SERVICE_FILE_PATH
else
    echo $SERVICE_FILE is already exist.
fi

if [ ! -e $CONF_FILE_PATH ]; then
    echo install config file
    cp $CONF_FILE.conf $CONF_FILE_PATH
fi

# sudo systemctl daemon-reload

echo enable service
systemctl enable $SERVICE_FILE

echo start service
systemctl start $SERVICE_FILE

echo $SERVICE_FILE install finished.

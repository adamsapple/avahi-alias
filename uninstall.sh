#!/usr/bin/sh

DOMAIN_ALIAS=$1
SERVICE_FILE="avahi-alias@${DOMAIN_ALIAS}.service"
SERVICE_FILE_PATH="/etc/systemd/system/$SERVICE_FILE"

if [ -z "$1" ]; then
  echo "Error: require domain name. <arg1>"
  exit 1
fi

if [ -e $SERVICE_FILE_PATH ]; then
    echo stop service
    systemctl stop $SERVICE_FILE

    echo disable service
    systemctl disable $SERVICE_FILE

    echo remove service file
    rm $SERVICE_FILE_PATH
else
    echo $SERVICE_FILE is not exist.
fi

echo $SERVICE_FILE uninstall finished.

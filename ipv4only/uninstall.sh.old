#!/usr/bin/sh

EXEC_FILE="avahi-alias.sh"
SERVICE_FILE="avahi-alias.service"
SERVICE_FILE_PATH="/etc/systemd/system/$SERVICE_FILE"


# echo $SERVICE_FILE

if [ -e $SERVICE_FILE_PATH ]; then
    echo stop service
    systemctl stop $SERVICE_FILE

    echo disable service
    systemctl disable $SERVICE_FILE

    echo remove service file
    rm $SERVICE_FILE_PATH
    rm /usr/local/bin/$EXEC_FILE
else
    echo $SERVICE_FILE is not exist.
fi

echo $SERVICE_FILE uninstall finished.

#!/usr/bin/sh

EXEC_FILE="avahi-alias.sh"
SERVICE_FILE="avahi-alias.service"
SERVICE_FILE_PATH="/etc/systemd/system/$SERVICE_FILE"

# echo $SERVICE_FILE_PATH

chmod 755 $EXEC_FILE

if [ ! -e $SERVICE_FILE_PATH ]; then    
    cp $SERVICE_FILE $SERVICE_FILE_PATH
    cp $EXEC_FILE /usr/local/bin/$EXEC_FILE
else
    echo $SERVICE_FILE is already exist.
fi

# sudo systemctl daemon-reload

echo enable service
systemctl enable $SERVICE_FILE

echo start service
systemctl start $SERVICE_FILE

echo $SERVICE_FILE install finished.

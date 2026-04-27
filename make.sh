#!/bin/bash

# make.sh - Generate avahi-alias service file from template
# Usage: ./make.sh <network_interface> <domain_alias>

if [ $# -ne 2 ]; then
    echo "Usage: $0 <network_interface> <domain_alias>"
    echo "Example: $0 eth0 mydomain"
    exit 1
fi

NETWORK_INTERFACE="$1"
DOMAIN_ALIAS="$2"
CURRENT_DIR=$(pwd)

TEMPLATE_FILE="avahi-alias@${DOMAIN_ALIAS}.service"

cat > "${TEMPLATE_FILE}" << EOF
[Unit]
Description=Publish %I.%H.local as alias for %H.local via mdns
Requires=avahi-daemon.service
After=avahi-daemon.service

[Service]
Type=simple
ExecStart=${CURRENT_DIR}/avahi-alias.sh ${NETWORK_INTERFACE} ${DOMAIN_ALIAS}
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

echo "Created ${TEMPLATE_FILE}"
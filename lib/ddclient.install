#!/bin/bash
apt-get install ddclient

echo "INFO - Setup the dynamic IP service"
read -p "Enter your provider : " PROVIDER
read -p "Enter Login         : " LOGIN
read -p "Enter password      : " PASSWORD
read -p "Hosts (@,www,qr)    : " HOSTS

cat > /etc/ddclient.conf <<EOL
daemon=600
syslog=yes
pid=/var/run/ddclient.pid

use=web, web=checkip.dyndns.com/, web-skip='IP Address'

protocol=${PROVIDER}
server=dynamicdns.park-your-domain.com
login=${LOGIN}
password=${PASSWORD}
ssl=yes
${HOSTS}
EOL

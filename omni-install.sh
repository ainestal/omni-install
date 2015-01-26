#!/bin/bash

apt-get update
apt-get install nmap htop apache2 mongodb python-virtualenv vim

#to install rpm on debian
apt-get install alien

#apache config
a2enmod proxy

#configure dynamic ip
apt-get install ddclient

#!/bin/bash

MY_PATH=$(dirname "${0}")

cmd=(dialog --separate-output --checklist "Select options:" 12 76 10)
options=(1 "Basic   - nmap,htop,python-virtualenv,vim" off    # any option can be set to default to "on"
         2 "Apache  - apache2,alien(to convert rpm to deb)" off
         3 "MongoDB - mongodb" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            BASIC='nmap htop python-virtualenv vim'
            echo 'syntax on' >> .vimrc
            ;;
        2)
            APACHE='apache2 alien'
            a2enmod proxy
            ;;
        3)
            MONGODB='mongodb'
            ;;
    esac
done

apt-get install ${BASIC} ${APACHE} ${MONGODB}

#ToDo: add the apache configuration

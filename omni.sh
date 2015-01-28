#!/bin/bash

MY_PATH=$(dirname "${0}")

apt-get install dialog
cmd=(dialog --separate-output --checklist "Select options:" 12 76 10)
options=(1 "Main Stack - Install for a standalone server" off    # any option can be set to default to "on"
         2 "LXC        - Install and create container" off
         3 "DDclient   - Install and configure your dynamic ip" off
         4 "Docker     - Install" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            . ${MY_PATH}/lib/main-stack.install
            ;;
        2)
            . ${MY_PATH}/lib/lxc.install
            ;;
        3)
            . ${MY_PATH}/lib/ddclient.install
            ;;
        4)
            . ${MY_PATH}/lib/docker.install
            ;;
    esac
done

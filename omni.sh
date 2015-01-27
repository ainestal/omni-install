#!/bin/bash

MY_PATH=$(dirname "${0}")

function main_stack(){
    echo "INFO - Installing main stack: apache2, mongodb, ddclient"
    . ${MY_PATH}/lib/main-stack.install
    echo "INFO - Done !!!"
}

function lxc(){
    . ${MY_PATH}/lib/lxc.install
    echo "INFO - Done !!!"
}

apt-get install dialog
cmd=(dialog --separate-output --checklist "Select options:" 10 76 10)
options=(1 "Install main stack for a standalone server" off    # any option can be set to default to "on"
         2 "LXC install and create container" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            main_stack
            ;;
        2)
            lxc
            ;;
    esac
done

#!/bin/bash

function main_stack(){
    echo "INFO - Installing main stack: apache2, mongodb, ddclient"
    . main-stack.install
    echo "INFO - Done !!!"
}

function lxc(){
    echo "INFO - Installing LXC and configuring"
    . lxc.install
    echo "INFO - Done !!!"
}


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

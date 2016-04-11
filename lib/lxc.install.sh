#!/bin/bash

dialog --title "Creating container" --backtitle "Configuring LXC \
Containers" --inputbox "Enter a name for the container" 8 60 2>/tmp/input.$$
sel=$?
na=`cat /tmp/input.$$`
case $sel in
  0) NAME="${na}" ;;
#echo "Hello $na" ;;
  1) echo "Cancel is Press. Exiting" ;;
  255) echo "[ESCAPE] key pressed. Exiting" ;;
esac
rm -f /tmp/input.$$

if [ -z ${NAME} ]; then
  dialog --title "Creating container" --backtitle "Configuring LXC \
Containers" --msgbox "ERROR - The container must have a name" 6 60
  exit 1
fi

dialog --title "Creating container" --backtitle "Configuring LXC \
Containers" --inputbox "Enter technology to use in the container (ubuntu)" 8 60 2>/tmp/input.$$
sel=$?
na=`cat /tmp/input.$$`
case $sel in
  0) TECH="${na}" ;;
#echo "Hello $na" ;;
  1) echo "Cancel is Press. Exiting" ;;
  255) echo "[ESCAPE] key pressed. Exiting" ;;
esac
rm -f /tmp/input.$$

if [ -z ${TECH} ]; then
  dialog --title "Creating container" --backtitle "Configuring LXC \
Containers" --msgbox "Using 'ubuntu' as technology" 6 60
  TECH="ubuntu"
fi


#install and configure
apt-get update && apt-get install lxc
cat >> /etc/fstab <<EOL
cgrouip         /sys/fs/cgroup  cgroup  defaults        0       0
EOL

#mount /sys/fs/cgroup
mount -a

#create container
lxc-create -t ${TECH} -n ${NAME}

#start container and login
lxc-start -n ${NAME} --daemon

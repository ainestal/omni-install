###### Debian
#echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list

#apt-get update
#apt-get install -t wheezy-backports linux-image-amd64 curl

#curl -sSL https://get.docker.com/ | sh
#########

###### Ubuntu
# From package
#apt-get update
#apt-get install docker.io
#source /etc/bash_completion.d/docker.io
######
# Last
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

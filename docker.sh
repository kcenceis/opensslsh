#/bin/sh

#install docker for debian 10(buster)
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

#Enable TCP port 2375 for external connection to Docker
mkdir /etc/systemd/system/docker.service.d/
wget -P /etc/systemd/system/docker.service.d/ https://raw.githubusercontent.com/kcenceis/shell/master/docker/override.conf

wget -P /etc/docker/ https://raw.githubusercontent.com/kcenceis/shell/master/docker/daemon.json

#restart docker
systemctl daemon-reload
systemctl restart docker
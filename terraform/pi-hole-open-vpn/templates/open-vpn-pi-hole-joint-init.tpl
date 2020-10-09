#!/bin/bash

apt-get update -y
apt-get upgrade -y
sudo hostnamectl set-hostname ${instance_hostname}
mkdir /etc/pihole
touch /etc/pihole/setupVars.conf

wget https://raw.githubusercontent.com/leomoon-studios/openvpn-installer/master/src/openvpn-installer -O ~/openvpn-installer
chmod +x ~/openvpn-installer
cd ~/ && SILENT=y DNS_TYPE=11 sudo -E ~/openvpn-installer

MENU=5 CLIENT=default_client PASS=n sudo -E lmovpn
MENU=1 CLIENT=default_client PASS=n sudo -E lmovpn

sudo resolvectl dns tun0 "10.8.0.1"

cat >/etc/pihole/setupVars.conf <<EOL
WEBPASSWORD=${web_admin_password}
PIHOLE_INTERFACE=tun0
IPV4_ADDRESS=10.8.0.1
IPV6_ADDRESS=2601:444:8111:403:55d6:2f11:41bf:13bb
QUERY_LOGGING=true
INSTALL_WEB=true
DNSMASQ_LISTENING=single
PIHOLE_DNS_1=208.67.222.222
PIHOLE_DNS_2=208.67.220.220
PIHOLE_DNS_3=2620:0:ccc::2
PIHOLE_DNS_4=2620:0:ccd::2
DNS_FQDN_REQUIRED=true
DNS_BOGUS_PRIV=true
DNSSEC=true
TEMPERATUREUNIT=C
WEBUIBOXEDLAYOUT=traditional
API_EXCLUDE_DOMAINS=
API_EXCLUDE_CLIENTS=
API_QUERY_LOG_SHOW=all
API_PRIVACY_MODE=false
EOL

curl -L https://install.pi-hole.net | bash /dev/stdin --unattended

cat >>/etc/openvpn/server/server.conf <<EOL
push "dhcp-option DNS 10.8.0.1"
EOL

MENU=5 CLIENT=default_client PASS=n sudo -E lmovpn

#!/bin/bash

apt-get update -y
apt-get upgrade -y
mkdir /etc/pihole
touch /etc/pihole/setupVars.conf

current_public_facing_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

cat >/etc/pihole/setupVars.conf <<EOL
WEBPASSWORD=${web_admin_password}
PIHOLE_INTERFACE=eth0
IPV4_ADDRESS=$current_public_facing_ip
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
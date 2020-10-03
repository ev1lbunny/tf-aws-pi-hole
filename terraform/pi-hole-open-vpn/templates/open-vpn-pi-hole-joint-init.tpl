#!/bin/bash

apt-get update -y
apt-get upgrade -y
mkdir /etc/pihole
touch /etc/pihole/setupVars.conf

cat >/etc/pihole/setupVars.conf <<EOL
WEBPASSWORD=${web_admin_password}
PIHOLE_INTERFACE=eth0
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

wget https://raw.githubusercontent.com/leomoon-studios/openvpn-installer/master/src/openvpn-installer -O ~/openvpn-installer
chmod +x ~/openvpn-installer
cd ~/ && SILENT=y sudo -E ~/openvpn-installer

cat >/etc/openvpn/server/server.conf <<EOL
port 1194
proto udp
dev tun
sndbuf 0
rcvbuf 0
push "dhcp-option DNS 10.8.0.1"
#push "dhcp-option DNS 8.8.8.8"
#push "dhcp-option DNS 8.8.4.4"
push "redirect-gateway def1 bypass-dhcp"
dh none
ecdh-curve prime256v1
tls-crypt tls-crypt.key 0
crl-verify crl.pem
ca ca.crt
cert server_eeL5LN7Xv6IETcCD.crt
key server_eeL5LN7Xv6IETcCD.key
auth SHA256
cipher AES-256-GCM
ncp-ciphers AES-256-GCM
tls-server
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
topology subnet
server 10.8.0.0 255.255.255.0
keepalive 10 120
user nobody
group nogroup
persist-key
persist-tun
ifconfig-pool-persist ipp.txt
status status.log
verb 3
EOL

MENU=5 CLIENT=default_client PASS=n sudo -E lmovpn
MENU=1 CLIENT=default_client PASS=n sudo -E lmovpn
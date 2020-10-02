#!/bin/bash
#For additional silent config/options please see https://leomoon.com/downloads/scripts/openvpn-installer-for-linux/
apt-get update -y
apt-get upgrade -y

wget https://raw.githubusercontent.com/leomoon-studios/openvpn-installer/master/src/openvpn-installer -O ~/openvpn-installer
chmod +x ~/openvpn-installer
cd ~/ && SILENT=y sudo -E ~/openvpn-installer
MENU=1 CLIENT=default_client PASS=n sudo -E lmovpn
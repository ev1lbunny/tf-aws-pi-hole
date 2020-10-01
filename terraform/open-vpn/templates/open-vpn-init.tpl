#!/bin/bash
#For additional silent config/options please see https://leomoon.com/downloads/scripts/openvpn-installer-for-linux/
apt-get update -y
apt-get upgrade -y

curl -Ls https://raw.githubusercontent.com/leomoon-studios/openvpn-installer/master/src/openvpn-installer -O ~/openvpn-installer
chmod +x ~/openvpn-installer
SILENT=y sudo -E ./openvpn-installer
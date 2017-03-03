#!/bin/bash
set -ex
current_dir="$(dirname "$0")"
sudo apt-get install -y squid3 net-tools ufw
echo y | sudo ufw enable
sudo ufw deny out https
sudo ufw deny out http
curl -I "https://github.com" --proxy https://127.0.0.1:3128
wget -e use_proxy=yes -e http_proxy=127.0.0.1:3128 -e https_proxy=127.0.0.1:3128 https://github.com
sudo cat /var/log/squid3/access.log

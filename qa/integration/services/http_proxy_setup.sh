#!/bin/bash
set -ex
current_dir="$(dirname "$0")"
sudo apt-get install -y squid3 net-tools ufw
echo y | sudo ufw enable
wget -e use_proxy=yes -e http_proxy=127.0.0.1:3128 -e https_proxy=127.0.0.1:3128 https://github.com
sudo iptables -A OUTPUT -p tcp --dport 443 -m owner ! --uid-owner proxy -j REJECT
sudo iptables -A OUTPUT -p tcp --dport 80 -m owner ! --uid-owner proxy -j REJECT

echo "Connecting to a remote host should fails without proxy"
curl -I "https://travis-ci.org"

echo "Connecting to a remote host with a valid proxy should succeed"
curl -I "https://travis-ci.org" --proxy https://127.0.0.1:3128

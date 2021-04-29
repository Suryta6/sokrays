#!/bin/bash

ipv4s=$(curl -4 -s ifconfig.co)

echo -e "\033[31;4m how the ports should be (example 30000 ) \033[0m";read port1

wget https://raw.githubusercontent.com/Suryta6/sorpty/main/3proxy.sh

chmod +x 3proxy.sh

sed -i 's/\r//' 3proxy.sh

sed -e "s/burasi/${ipv4s}/" /root/3proxy.sh > /root/32proxy.sh

chmod +x 32proxy.sh

sed -i 's/\r//' 32proxy.sh

sed -e "s/2001:as45s/${port1}/" /root/32proxy.sh > /root/frivul.sh

chmod +x frivul.sh

sed -i 's/\r//' frivul.sh

bash frivul.sh > /etc/3proxy/3proxy.cfg

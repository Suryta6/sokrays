#!/bin/bash

ipv6s=$(curl -6 -s ifconfig.co | cut -f1-4 -d':')

ipv4s=$(curl -4 -s ifconfig.co)

echo -e "\033[33;4m Port Adeti: \033[0m";read adet

echo -e "\033[33;4m Port Sayisi kactan baslasin: 30000-50000 Tarzi Girin \033[0m";read port1

wget --no-check-certificate https://raw.github.com/barankilic/3proxy/master/3proxyinstaller.sh
chmod +x 3proxyinstaller.sh
./3proxyinstaller.sh

/sbin/ip -6 addr add ${ipv6s}::2/64 dev ens3
/sbin/ip -6 route add default via ${ipv6s}::2
/sbin/ip -6 route add local ${ipv6s}::/64 dev lo
ip -6 addr add ${ipv6s}::2/64 dev lo
/sbin/ifconfig ens3 inet6 add ${ipv6s}::2/64
ip -6 addr add ${ipv6s}::2/64 dev ens3
/sbin/ip -6 addr add ${ipv6s}::1/64 dev ens3
/sbin/ifconfig ens3 inet6 add ${ipv6s}::1/64

sudo apt-get install nano

sudo apt-get install net-tools

apt install build-essential -y

apt install git

cd /root

wget --no-check-certificate https://raw.githubusercontent.com/Suryta6/sorpty/main/gen64.sh

chmod +x gen64.sh

sed -i 's/\r//' gen64.sh

sed -e "s/MAXCOUNT=500/MAXCOUNT=$adet/" /root/gen64.sh > /root/gene64.sh

chmod +x gene64.sh

sed -i 's/\r//' gene64.sh

sed -e "s/network=2001:19f0:5401:11d7/network=${ipv6s}/" /root/gene64.sh > /root/random2.sh

chmod +x random2.sh

sed -i 's/\r//' random2.sh

bash random2.sh > /etc/3proxy/ip.list

cd /root

chmod +x ip.list2.sh

bash ip.list2.sh

cat >> /etc/sysctl.conf << END
net.ipv6.ip_nonlocal_bind = 1
fs.file-max = 700000
net.ipv4.tcp_timestamps=1
net.ipv4.tcp_max_tw_buckets=1440000
net.ipv4.ip_local_port_range = 512 65535
net.core.somaxconn = 61440
net.core.rmem_max = 12582912
net.core.wmem_default = 31457280
net.core.wmem_max = 12582912
net.ipv4.tcp_keepalive_time = 300
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_rfc1337 = 1
net.core.optmem_max = 25165824
net.ipv4.tcp_mem = 65536 131072 262144
net.ipv4.udp_mem = 65536 131072 262144
net.ipv4.tcp_rmem = 8192 87380 16777216
net.ipv4.udp_rmem_min = 66384
net.ipv4.tcp_wmem = 8192 65536 16777216
net.ipv4.udp_wmem_min = 76384
net.ipv4.xfrm4_gc_thresh = 52768
net.netfilter.nf_conntrack_tcp_timeout_established=200
kernel.threads-max = 220000
kernel.pid_max = 200000
END

sysctl -p

apt install libproxy-tools -y

cd /etc/3proxy

rm -rf /etc/3proxy/3proxy.cfg

cd /etc/3proxy/ && wget 'https://raw.githubusercontent.com/Suryta6/sorpty/main/3proxy.cfg'

cd /etc/3proxy/ && wget 'https://raw.githubusercontent.com/Suryta6/sorpty/main/3proxy.sh'

chmod +x /etc/3proxy/3proxy.sh

sed -i 's/\r//' /etc/3proxy/3proxy.sh

sed -e "s/portbira12/$port1/" /etc/3proxy/3proxy.sh > /etc/3proxy/sene64.sh

chmod +x /etc/3proxy/sene64.sh

sed -i 's/\r//' /etc/3proxy/sene64.sh

sed -e "s/port34s/$port1/" /etc/3proxy/sene64.sh > /etc/3proxy/kls.sh

chmod +x /etc/3proxy/kls.sh

sed -i 's/\r//' /etc/3proxy/kls.sh

sed -e "s/IP/${ipv4s}/" /etc/3proxy/kls.sh > /etc/3proxy/smsa.sh

chmod +x /etc/3proxy/smsa.sh

sed -i 's/\r//' /etc/3proxy/smsa.sh

sed -e "s/i149.248.57.94/i${ipv4s}/" /etc/3proxy/smsa.sh > /etc/3proxy/sen24.sh

chmod +x /etc/3proxy/sen24.sh

sed -i 's/\r//' /etc/3proxy/sen24.sh

bash /etc/3proxy/sen24.sh > /etc/3proxy/sda.sh

apt apt-get install unzip
sudo apt-get install zip

cd /etc/3proxy/

random=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 10)
klis=$random
zip -r --password ${klis} proxy.zip proxylist2.txt
URL=$(curl --upload-file ./proxy.zip https://transfer.sh/proxy.zip)

echo -e "\033[32;4m indirme linki: ${URL}\033[0m"

echo -e "\033[32;4m Zip Sifresi: ${klis}\033[0m"

chmod +x /etc/3proxy/sda.sh

sed -i 's/\r//' /etc/3proxy/sda.sh

cat /etc/3proxy/sda.sh | tail -n+2 >> /etc/3proxy/3proxy.cfg

cd /etc/3proxy/

echo -e "\033[32;4mSuccessfully completed\033[0m"

echo -e "\033[33;4m (/etc/init.d/3proxyinit start) Bu Parantez icerisindeki kodu kopyalayip buraya tekrar yapistirin enter basin\033[0m"

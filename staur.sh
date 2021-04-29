#!/bin/bash

apt-get update && apt-get install "gcc++" git make screen mc wget -y

apt install net-tools

ifconfig

echo -e "\033[33;4mipv6 giriniz.\033[0m";read ipv6

echo -e "\033[33;4mKac adet istiyorsunuz\033[0m";read adet

echo -e "\033[33;4mUsername giriniz\033[0m";read userr

echo -e "\033[33;4mSifre giriniz\033[0m";read pasrs

ip -6 addr add $ipv6::2/64 dev lo

/sbin/ifconfig ens3 inet6 add $ipv6::2/64

ip -6 addr add $ipv6::2/64 dev ens3

cd /root

wget --no-check-certificate https://github.com/Suryta6/sorpty/raw/main/gen64.sh

chmod +x gen64.sh

sed -i 's/\r//' gen64.sh

sed -e "s/MAXCOUNT=500/MAXCOUNT=$adet/" /root/gen64.sh > /root/gene64.sh

chmod +x gene64.sh

sed -i 's/\r//' gene64.sh

sed -e "s/network=2001:19f0:5401:11d7/network=$ipv6/" /root/gene64.sh > /root/random2.sh

chmod +x random2.sh

sed -i 's/\r//' random2.sh

bash random2.sh > /etc/3proxy/ip.list

bash ip.list2.sh

version=0.8.13

apt-get update && apt-get -y upgrade

apt-get install gcc make git -y

wget --no-check-certificate -O 3proxy-${version}.tar.gz https://github.com/z3APA3A/3proxy/archive/${version}.tar.gz

tar xzf 3proxy-${version}.tar.gz

cd 3proxy-${version}

make -f Makefile.Linux

cd src

mkdir /etc/3proxy/

mv 3proxy /etc/3proxy/

cd /etc/3proxy/

cat > 3proxy.sh << END
#!/bin/bash
echo daemon
echo maxconn 20000
echo nserver 77.88.8.8
echo nserver 77.88.8.1
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
echo setgid 65535
echo setuid 65535
echo stacksize 6000
echo flush
echo users $userr:CL:$pasrs
echo auth strong
echo allow $userr
port=30000
count=1
for i in `cat ip.list`; do
    echo "proxy -6 -n -a -ocUSE_TCP_FASTOPEN -p$port -i$ipv4 -e$i"
    ((port+=1))
    ((count+=1))
    if [ $count -eq 10001 ]; then
        exit
    fi
done
END

chmod +x 3proxy.sh

chmod -R 777 3proxy.sh

./3proxy.sh > 3proxy.cfg

mkdir /var/log/3proxy/

wget --no-check-certificate https://github.com/Suryta6/sorpty/raw/main/authuser.sh

chmod 600 /etc/3proxy/authuser.sh


chmod +x authuser.sh

sed -i 's/\r//' authuser.sh

sed -e "s/username:CL:password/$userr:CL:$pasrs/" /root/authuser.sh > /root/.proxyauth

cd /etc/init.d/

wget --no-check-certificate  https://raw.githubusercontent.com/Suryta6/sorpty/main/3proxy

chmod  +x /etc/init.d/3proxy

update-rc.d 3proxy defaults

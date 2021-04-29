#!/bin/bash

apt-get update && apt-get install "gcc++" git make screen mc wget -y

apt install net-tools

ifconfig

ipv4=$(curl -4 -s ifconfig.co)

ipv6=$(curl -6 -s ifconfig.co | cut -f1-4 -d':')

echo -e "\033[33;4mportlar kactan baslasin\033[0m";read port1

echo -e "\033[33;4mKac adet istiyorsunuz\033[0m";read adet

echo -e "\033[33;4mUsername giriniz\033[0m";read userr

echo -e "\033[33;4mSifre giriniz\033[0m";read pasrs

ip -6 addr add $ipv6::2/64 dev lo

/sbin/ifconfig ens3 inet6 add $ipv6::2/64

ip -6 addr add $ipv6::2/64 dev ens3

/sbin/ip -6 addr add $ipv6::2/64 dev $i
/sbin/ip -6 route add default via $ipv6::1
/sbin/ip -6 route add local $ipv6::/64 dev lo

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

bash random2.sh > ip.list

bash ip.list2.sh

cd /root

apt install unzip

apt install build-essential -y

apt install git

cd ~
git clone https://github.com/DanielAdolfsson/ndppd.git
cd ~/ndppd
make all && make install

cat > ndppd.conf << END
route-ttl 30000
proxy ens3 {
   router no
   timeout 500
   ttl 30000
   rule $ipv6::/64 {
      static
   }
}
END

ndppd -d -c /root/ndppd/ndppd.conf

cd ~
git clone https://github.com/z3APA3A/3proxy.git
cd /root/3proxy/
rm -r man
rm -r src
cd /root/3proxy/
wget --no-check-certificate https://github.com/giGurylsPro/best-friends/raw/master/frirarman.zip
unzip frirarman.zip
chmod +x bin/
touch bin/define.txt
echo "#define ANONYMOUS 1" > bin/define.txt
sed -i "31r bin/define.txt" bin/proxy.h
make -f Makefile.Linux

cat > 3proxy.sh << END
#!/bin/bash

echo nserver 8.8.8.8
echo nserver 8.8.4.4
echo nserver 1.1.1.1
echo nserver 1.0.0.1
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
echo daemon
echo rotate 1
echo authcache user 60
echo auth strong cache

port=$port1
count=1
while IFS= read -r line3 <&3 || ((eof3=1))
      IFS= read -r line4 <&4 || ((eof4=1))
      !((eof3 & eof4))
do
                IP=$ipv4
                echo users $userr:CL:$pass
                echo auth strong
                echo allow $userr
                echo "proxy -6 -n1 -a -ocUSE_TCP_FASTOPEN -ocOPTIONS -p$port -i$ipv4 -e$line3"
                echo flush
                echo ""
                echo $ipv4:$port:$line4:$line4 >> /root/proxyler.txt
        ((port+=1))
        ((count+=1))
        if [ $count -eq 10001 ]; then
                exit
        fi
done 3</root/ip.list

END

chmod +x 3proxy.sh

chmod -R 777 3proxy.sh

bash 3proxy.sh > 3proxy.cfg

cat >> /etc/sysctl.conf << END
net.ipv6.route.max_size=409600
net.ipv4.tcp_max_syn_backlog=4096
net.ipv6.neigh.default.gc_thresh3=102400
net.ipv6.conf.eth0.proxy_ndp=1
net.ipv6.conf.all.proxy_ndp=1
net.ipv6.conf.default.forwarding=1
net.ipv6.conf.all.forwarding=1
net.ipv6.ip_nonlocal_bind = 1
END

sysctl -p

#!/bin/bash

cat > /etc/rc.local << END
#!/bin/bash
ulimit -n 600000
ulimit -u 600000
/sbin/ip -6 addr add $ipv6::2/64 dev ens3
/sbin/ip -6 route add default via $ipv6::1
/sbin/ip -6 route add local $ipv6::/64 dev lo
/sbin/ip -6 route add default via fe80::1
/root/ndppd/ndppd -d -c /root/ndppd/ndppd.conf
/root/3proxy/bin/3proxy /root/3proxy/3proxy.cfg
exit 0
END

chmod +x /etc/rc.local
systemctl enable rc-local.service
systemctl start rc-local.service
/usr/sbin/service rc.local restart

cd/root

URL=$(curl --upload-file ./proxyler.txt https://transfer.sh/proxyler.txt)

echo -e "\033[31;4mindirme linki: ${URL}\033[0m"

echo -e "\033[33;4mSuccessfully completed\033[0m"

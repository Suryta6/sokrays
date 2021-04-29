#!/usr/local/bin/bash
array=( 1 2 3 4 5 6 7 8 9 0 a b c d e f )
MAXCOUNT=500
count=1
network=2001:19f0:5401:11d7
rnd_ip_block ()
{
    a=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    b=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    c=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    d=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    echo $network:$a:$b:$c:$d
    echo /sbin/ip -6 addr add $network:$a:$b:$c:$d/64 dev ens3 >> /root/ip.list2.sh
}
while [ "$count" -le $MAXCOUNT ]
do
        rnd_ip_block
        let "count += 1"
        done

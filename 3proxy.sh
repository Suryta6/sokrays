#!/bin/bash
port=portbira12
echo ""
users=`wc -l ip.list | cut -d ' ' -f1`
for i in `seq 1 $users`; do
echo -n "users "
sad=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
asd=$sad
    echo -n "WsAdklSt$i:CL:${asd}"
    echo IP:$port:WsAdklSt$i:${asd} >> /etc/3proxy/list.txt
        ((port+=1))
echo -e
    if [ $(( $i % 100 )) -eq 0 ] ; then
        echo 
    fi
done

port=port34s
count=1
for i in `cat ip.list`; do
    echo "allow WsAdklSt$count"
    echo "proxy -6 -n -a -ocUSE_TCP_FASTOPEN -p$port -i149.248.57.94 -e$i"
    ((port+=1))
    ((count+=1))
    if [ $count -eq 10001 ]; then
        exit
    fi
done
echo ""
echo "admin -p3200"
echo ""
echo ""

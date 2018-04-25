#!/bin/bash
netstat -na | awk '/ESTABLISHED/{split($5,T,":");print T[1]}' | sort | grep -v -E '192.168|127.0' | uniq -c | awk '{if ($2!=null && $1>21) {print $2}}' > /var/log/limmitip

for i in $(cat /var/log/limmitip)
do
    if i not in $(cat /tmp/goodip);then
        rep=$(iptables-save | grep $i)
        if [[ -z $rep ]];then
            /sbin/iptables -A INPUT -s $i -m limit --limit 5/minute -j ACCEPT
            echo "$i limit at `date`" >>/var/log/ddos-ip
        fi
    fi
done

#!/bin/bash

iptables -F
iptables -X
iptables -Z

iptables -A INPUT -j DROP
iptables -A OUTPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT

modprobe ip_tables
modprobe ip_conntrack

iptables -A INPUT -p tcp --dport 80,443 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.42.1 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.42.0/24 --dport 5901 -j ACCEPT

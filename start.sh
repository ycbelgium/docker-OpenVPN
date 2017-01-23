#!/bin/bash

source /etc/openvpn/easy-rsa/vars

sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o eth0 -j MASQUERADE

/etc/init.d/openvpn restart

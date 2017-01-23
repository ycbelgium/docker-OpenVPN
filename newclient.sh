#!/bin/bash

cd /etc/openvpn/easy-rsa
source vars
./build-key $1

mkdir /etc/openvpn/clientconf/$1
cp /etc/openvpn/ca.crt /etc/openvpn/ta.key keys/$1.crt keys/$1.key /etc/openvpn/clientconf/$1

cp /etc/openvpn/client.conf /etc/openvpn/clientconf/$1/$1.conf

sed -i s/newclient/$1/g /etc/openvpn/clientconf/$1/$1.conf



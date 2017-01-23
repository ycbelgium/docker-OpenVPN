#!/bin/bash

cd /etc/openvpn/easy-rsa/
source vars
./clean-all
./build-dh
./pkitool --initca
./pkitool --server server
openvpn --genkey --secret keys/ta.key

cp keys/ca.crt keys/ta.key keys/server.crt keys/server.key keys/dh2048.pem /etc/openvpn/

mkdir /etc/openvpn/jail
mkdir /etc/openvpn/clientconf


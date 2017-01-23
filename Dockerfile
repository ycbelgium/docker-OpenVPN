FROM debian:8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install openvpn iptables

ADD setup.sh /

RUN chmod +x setup.sh

RUN mkdir /etc/openvpn/easy-rsa/ && cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa/

ADD vars /etc/openvpn/easy-rsa/

RUN /setup.sh

ADD server.conf /etc/openvpn/

ADD client.conf /etc/openvpn/

ADD start.sh /

RUN chmod +x start.sh

ADD newclient.sh /

RUN chmod +x newclient.sh


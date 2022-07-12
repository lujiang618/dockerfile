#!/bin/bash

PRIVATE_IP=$(ifconfig | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | tr -d "addr:") 

export EXTERNAL_IP="$PUBLIC_IP\/$PRIVATE_IP"

sed -i "s/external-ip=.*/external-ip=$EXTERNAL_IP/g" /coturn/etc/turnserver.conf

turnserver -c /coturn/etc/turnserver.conf
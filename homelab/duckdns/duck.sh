#!/bin/bash
DOMAIN=$1
token=$2
LOG_FILE=~/etc/homelab/duckdns/duck.log
ip=$(ip -6 addr show br0 | awk '/inet6.*global dynamic/{addr=$2; getline; print addr, $4}' | sort -k2 -n | tail -n 1 |  awk '{print substr($1, 1, length($1)-3)}')
duckdns_host=https://www.duckdns.org

last_ip=$(tail -n 2 $LOG_FILE | head -n 1 | awk '{print $NF}')
# echo "[$(date)] clear ip" >> $LOG_FILE
# echo url="$duckdns_host/update?domains=$DOMAIN&token=$token&verbose=true&clear=true" | curl -k  -K - >> $LOG_FILE

if [ "$ip" != "$last_ip" ]; then
	echo "" >> $LOG_FILE
	echo "[$(date)] update ip" >> $LOG_FILE
	echo url="$duckdns_host/update?domains=$DOMAIN&token=$token&verbose=true&ipv6=$ip" | curl -k -K - >> $LOG_FILE
else
	echo "[$(date)] No change in IP: $ip" >> /tmp/duck.log
fi

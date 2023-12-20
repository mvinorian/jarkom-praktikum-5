IP_SEIN="192.169.248.2"
IP_STARK="192.169.254.142"

iptables -t nat -A PREROUTING -p tcp -d $IP_SEIN --dport 80 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination $IP_STARK:80
iptables -t nat -A PREROUTING -p tcp -d $IP_SEIN --dport 80 -m statistic --mode nth --every 2 --packet 1 -j DNAT --to-destination $IP_SEIN:80

iptables -t nat -A PREROUTING -p tcp -d $IP_STARK --dport 443 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination $IP_SEIN:443
iptables -t nat -A PREROUTING -p tcp -d $IP_STARK --dport 443 -m statistic --mode nth --every 2 --packet 1 -j DNAT --to-destination $IP_STARK:443

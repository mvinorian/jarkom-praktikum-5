iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j LOG_AND_DROP

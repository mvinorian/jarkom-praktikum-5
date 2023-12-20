iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -j LOG_AND_DROP
iptables -A INPUT -p udp -j LOG_AND_DROP

iptables -A OUTPUT -p tcp --sport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp -j LOG_AND_DROP
iptables -A OUTPUT -p udp -j LOG_AND_DROP

iptables -A FORWARD -p tcp --sport 8080 -j ACCEPT
iptables -A FORWARD -p tcp -j LOG_AND_DROP
iptables -A FORWARD -p udp -j LOG_AND_DROP

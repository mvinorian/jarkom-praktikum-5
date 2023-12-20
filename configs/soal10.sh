iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A LOG_AND_DROP -j LOG --log-prefix "Dropped Packet: " --log-level 6
iptables -A LOG_AND_DROP -j DROP

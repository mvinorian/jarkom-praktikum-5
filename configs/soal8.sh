iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A INPUT -p tcp --dport 22 \
  -m time --datestart 2024-02-14T00:00:00 --datestop 2024-02-26T23:59:59 \
  -s 192.169.254.148/30 \
  -j LOG_AND_DROP

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A INPUT \
  -m state --state NEW \
  -m recent --name PORTSCAN --update --hitcount 20 --seconds 600 \
  -j LOG_AND_DROP

iptables -A INPUT \
  -m state --state NEW \
  -m recent --name PORTSCAN --set \
  -j ACCEPT

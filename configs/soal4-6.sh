iptables -X LOG_AND_DROP
iptables -N LOG_AND_DROP

iptables -A INPUT -p tcp --dport 22 \
  -m time --weekdays Mon,Tue,Wed,Thu --timestart 12:00 --timestop 13:00 \
  -j LOG_AND_DROP

iptables -A INPUT -p tcp --dport 22 \
  -m time --weekdays Fri --timestart 11:00 --timestop 13:00 \
  -j LOG_AND_DROP

iptables -A INPUT -p tcp --dport 22 \
  -m iprange --src-range 192.169.248.3-192.169.250.2 \
  -m time --weekdays Mon,Tue,Wed,Thu,Fri --timestart 08:00 --timestop 16:00 \
  -j ACCEPT
  
iptables -A INPUT -p tcp --dport 22 -j LOG_AND_DROP

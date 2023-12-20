iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

while true; do nc -l -p 80 -c "echo Ini $(hostname):80"; done &
while true; do nc -l -p 443 -c "echo Ini $(hostname):443"; done &

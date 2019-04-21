#!/bin/bash



#Allow inbound traffic to this specific ports
firewall-cmd --permanent --add-port=22/tcp
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=53/udp
firewall-cmd --permanent --add-port=83/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload

# First, allow outbound traffic for all allowed inbound traffic
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Block all other outbound traffic
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 2 -j DROP



# Allow outbound HTTP, HTTPS, DNS, SSH
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p icmp -m icmp --icmp-type=ping -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p tcp -m tcp --dport 53 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p udp --dport 53 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p tcp -m tcp --dport 80 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p tcp -m tcp --dport 443 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -p tcp -m tcp --dport 22 -j ACCEPT


# Block all other outbound traffic
#firewall-cmd --direct --add-rule ipv4 filter OUTPUT 2 -j DROP
############

#!/bin/bash 

### firwall_rich_ rule to accept traffic from specific address and port



firewall - cmd -- permanent -- zone=vnc --add - rich- rule= ' rule
family=ipv4 source address=192.168.1.11/32 port port=7900 - 7905 protocol=tcp accept 


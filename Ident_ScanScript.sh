#!/bin/bash
# Scan to enumerate ports through inetd
# This is a good way to see what service and account is behind the port. 
# the heart of the script relies on having ident-user-enum.pl.
# You can get the perl script from http://pentestmonkey.net/tools/ident-user-enum
##################################################################################
echo -n "Enter the IP to Scan:  "
read IP
for i in $(seq 1 65535); 
do 
	echo "Scanning $i"
	ident-user-enum.pl $IP $i | grep -v "unknown" | grep $i >> inetscanresults.txt; 
done

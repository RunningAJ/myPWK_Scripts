#!/bin/bash
#############################################################################################
# This script will scan websites robots.txt to determine what user agent can access the file
# The userAgentStrings.txt file must be in the same directory when you run this scan
# I got the original list from this site
# https://www.itoctopus.com/a-downloadable-list-of-the-top-500-user-agent-strings-on-a-high-traffic-joomla-website
#############################################################################################
echo -n "Enter the URL of the site: (ex http://google.com   >> )"
read site
# Now scanning the site using the custom agent string
IFS=$'\n' 
for i in $(cat ./userAgentStrings.txt);
do
	echo ##################################################
	echo trying $i
	curl -A "$i" -L $site/robots.txt
	echo ##################################################
done

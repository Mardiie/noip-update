#!/bin/bash
#update your no-ip domain

#variables (defined through docker):
#NOIP_USER=
#NOIP_PASSWORD=
#NOIP_HOST=
#NOIP_INTERVAL=5

#actions:

NOIP_INTERVAL=$[ $NOIP_INTERVAL * 60 ]

if [ -z $NOIP_USER ]
then
	echo "The NOIP_USER variable has not been set."
elif [ -z $NOIP_PASSWORD ]
then
	echo "The NOIP_PASSWORD variable has not been set."
elif [ -z $NOIP_HOST ]
then
	echo "The NOIP_HOST variable has not been set."
else
	echo "Starting updater for the domain: $NOIP_HOST, updated by user: $NOIP_USER, with an interval of $[ NOIP_INTERVAL / 60 ] minutes."
	while true
	do
		echo -ne "$(date +"%D %H:%M:%S")\t"
		curl -L -u $NOIP_USER:$NOIP_PASSWORD https://dynupdate.no-ip.com/nic/update?hostname=$NOIP_HOST
		sleep $NOIP_INTERVAL
	done
fi


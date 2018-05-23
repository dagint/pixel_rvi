#!/bin/bash

strTEXT="RVI COMPUTERS (203)234-8367"
RANDOMGIF=`ls /opt/pixel/*.gif |shuf -n 1`

bLOOP=true
#printf $RANDOMGIF

#FILES=/opt/pixel/*.png

arrColors=( red green blue cyan gray magenta orange pink yellow )

COUNTER=0

LOOPLEN=5

while $bLOOP ; do
	if [ $COUNTER -gt 8 ]; then
		COUNTER=0 
	fi

	#Play one of the random gifs in the directory for 5 times
	RANDOMGIF=`ls /opt/pixel/*.gif |shuf -n 1`
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --gif=$RANDOMGIF --loop=$LOOPLEN

	# Scrolling Text	
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --text="${strTEXT}" --color=${arrColors[$COUNTER]} --speed=30 --fontsize=36 --loop=$LOOPLEN
	
	# increment counter
	COUTER=$((COUNTER++))	
	echo "COUNTER:" $COUNTER

	#show weather gif	
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --zip=06473 --loop=$LOOPLEN
 
done



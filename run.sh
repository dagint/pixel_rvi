#!/bin/bash

strTEXT="RVI COMPUTERS (203)234-8367"
RANDOMGIF=`ls /opt/pixel/*.gif |shuf -n 1`

bLOOP=true
#printf $RANDOMGIF

#FILES=/opt/pixel/*.png

arrColors=( red green blue cyan gray magenta orange pink yellow )

COUNTER=0

#LOOPLEN=10

while $bLOOP ; do
	
	#Generate random number between 1-10 for loop length
	LOOPLEN=`shuf -i1-10 -n1` 

	if [ $COUNTER -gt 8 ]; then
		COUNTER=0 
	fi

	#Play one of the random gifs in the directory for 5 times
	RANDOMGIF=`ls /opt/pixel/*.gif |shuf -n 1`
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --gif=$RANDOMGIF --loop=$LOOPLEN

	# Scrolling Text	
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --text="${strTEXT}" --color=${arrColors[$COUNTER]} --speed=5 --fontsize=65 --loop=2 --offset=-18
	
	#show weather gif	
	/usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --zip=06473 --loop=$LOOPLEN

	# Scrolling Text
        /usr/bin/java -jar -Dioio.SerialPorts=ttyACM0 /opt/pixel/pixelc.jar --text="${strTEXT}" --color=${arrColors[$COUNTER]} --speed=5 --fontsize=65 --loop=2 --offset=-18

        # increment counter
        COUTER=$((COUNTER++))  
        echo "COUNTER:" $COUNTER

 
done



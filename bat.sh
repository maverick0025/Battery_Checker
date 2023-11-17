#! /bin/bash

echo "Hello, $(whoami)!"

BATTHL="83"
BATTHH="84"
BATTERYMODE="Battery"
ACMODE="AC"

while true
do 
BAT=$(pmset -g batt | awk -F'[\t;%]+' 'NR==2{print $2}')
#BAT=$(pmset -g batt | grep -o '[0-9]*%' | tr -d '%')
CHARGEMODE=$(pmset -g batt | awk -F'[\t \047]+' 'NR==1{print $4}')

echo "your current battery is $BAT%"

if [ "$BAT" -le "$BATTHL" ]
then
    if [[ "$CHARGEMODE" == "$BATTERYMODE" ]]
    then 
        osascript -e "display dialog \"Connect the charger 🥹 Your battery is at $BAT%\" with title \"Low Battery Alert\""
    fi 
    echo "low battery"
    
elif [ "$BAT" -ge "$BATTHH" ]
then
    if [[ "$CHARGEMODE" == "$ACMODE" ]]
    then
        osascript -e "display dialog \"Disconnect the charger 🤯 Your battery is at $BAT%\" with title \"High Battery Alert\""
    fi
    echo "High battery"
    
fi
    sleep 10
done
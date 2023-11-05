#! /bin/bash

echo "Hello, $(whoami)!"

BATTHL="23"
BATTHH="77"

while true
do 
BAT=$(pmset -g batt | awk -F'[\t;%]+' 'NR==2{print $2}')
#BAT=$(pmset -g batt | grep -o '[0-9]*%' | tr -d '%')

echo "your current battery is $BAT%"

#if (( BAT <= BATTHL ))
if [ "$BAT" -le "$BATTHL" ]
then
    #echo -en "\007"  
    echo "low battery"
    #osascript -e 'display notification "Low battery" with title "Battery Alert"'
    #osascript -e 'set volume 0'
    #osascript -e 'display dialog "Connect the charger 🥹" with title "Low Battery Alert"'
    osascript -e "display dialog \"Connect the charger 🥹 Your battery is at $BAT%\" with title \"Low Battery Alert\""
    
elif [ "$BAT" -ge "$BATTHH" ]
then
    echo "High battery"
    #osascript -e 'display dialog "Disconnect the charger 🤯" with title "High Battery Alert"'
    osascript -e "display dialog \"Disconnect the charger 🤯 Your battery is at $BAT%\" with title \"High Battery Alert\""
fi
    sleep 
done
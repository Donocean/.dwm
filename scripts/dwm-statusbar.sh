#!/bin/bash

print_mem()
{
	MEMFREE=$(free -m | awk 'NR==2 {print $7}')
	echo " ${MEMFREE}M"
}

printf_alsa()
{
	VOL=$(amixer get Master | tail -n 1 | sed "s/.*\[\(.*\)%\].*/\1/")
	
	if [ $VOL -eq 0 ]
	then
		echo "婢" 
	else
		printf "墳 %s%%" $VOL
	fi
}

printf_network_connection()
{
	NETWORK_DEV=$(ip link | grep "^2" | awk '{printf $2}')
	CONNECT=$(nmcli | grep 'wlan0: ' | awk 'NR==1 {print $2}')

	if [ $CONNECT = "connected" ]
	then
		echo 直
	else
		echo 睊
	fi
}

printf_battery()
{
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)
	
	if [ $STATUS = "Charging" ]
	then
		printf " %s%%" $CHARGE
	else
		printf " %s%%" $CHARGE
	fi
}

printf_date()
{
	# disp year mouth day time
	printf " %s" "$(date "+%m-%d  %H:%M")"
}

while true
do
	#display network  battery volume date
	xsetroot -name "$(print_mem) $(printf_battery) $(printf_alsa) $(printf_date) $(printf_network_connection) "

	sleep 2
done

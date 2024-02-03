#!/bin/bash

current_profile=$(/usr/bin/powerprofilesctl get)

if [[ "$current_profile" == "power-saver" ]]; then
	/usr/bin/powerprofilesctl set performance
fi 

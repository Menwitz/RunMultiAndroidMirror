#!/bin/bash

# Set the interval time in seconds (e.g., 30 seconds)
interval=30

# Log file path
logFile="$(pwd)/scrcpyLog.txt"

while true; do
    clear
    echo "[$(date)] Checking for new devices..."
    adb devices > temp.txt

    while IFS= read -r line; do
        deviceID=$(echo $line | awk '{print $1}')
        if [[ $deviceID != "List" && $deviceID != "of" && $deviceID != "devices" && $deviceID != "attached" && $deviceID != "" ]]; then
            grep -q "$deviceID" "$logFile"
            if [ $? -ne 0 ]; then
                echo "Found new device: $deviceID"
                echo "$deviceID" >> "$logFile"
                osascript -e "tell application \"Terminal\" to do script \"scrcpy -s $deviceID --always-on-top --disable-screensaver -w -S\""
            fi
        fi
    done < temp.txt

    sleep $interval
done

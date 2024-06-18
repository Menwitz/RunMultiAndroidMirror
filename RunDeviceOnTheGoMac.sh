#!/bin/bash

# Set the interval time in seconds (e.g., 30 seconds)
interval=30

# Log file path
logFile="$(pwd)/scrcpyLog.txt"

# Temporary current device list
currentLog="$(pwd)/currentLog.txt"

while true; do
    clear
    echo "[$(date)] Checking for devices..."
    adb devices > temp.txt

    # Clear current device log
    > "$currentLog"

    while IFS= read -r line; do
        deviceID=$(echo $line | awk '{print $1}')
        if [[ $deviceID != "List" && $deviceID != "of" && $deviceID != "devices" && $deviceID != "attached" && $deviceID != "" ]]; then
            echo "$deviceID" >> "$currentLog"
            if ! grep -q "$deviceID" "$logFile"; then
                echo "Found new device: $deviceID"
                echo "$deviceID" >> "$logFile"
                osascript -e "tell application \"Terminal\" to do script \"scrcpy -s $deviceID --always-on-top --disable-screensaver -w -S\""
            fi
        fi
    done < temp.txt

    # Remove disconnected devices from the log
    grep -Fvxf "$currentLog" "$logFile" > tempLog.txt && mv tempLog.txt "$logFile"

    sleep $interval
done

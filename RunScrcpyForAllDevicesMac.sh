#!/bin/bash

# Log file path
logFile="scrcpyLog.txt"

# Clear previous log content
echo "[$(date)] Starting new session" > "$logFile"

# Listing connected devices
echo "Listing connected devices..."
adb devices > temp.txt
while read line; do
    deviceID=$(echo $line | awk '{print $1}')
    if [[ $deviceID != "List" && $deviceID != "of" && $deviceID != "devices" && $deviceID != "attached" && $deviceID != "" ]]; then
        echo "Found device: $deviceID" >> "$logFile"
        # Open a new terminal for each device ID and run scrcpy with specified parameters
        osascript -e "tell application \"Terminal\" to do script \"scrcpy -s $deviceID --always-on-top --disable-screensaver -w -S\""
    fi
done < temp.txt

# Delete the temporary file
rm temp.txt

# Keep the terminal window open
echo "See '$logFile' for details."
read -p "Press any key to continue..."

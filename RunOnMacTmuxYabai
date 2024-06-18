#!/bin/bash

# Log file path
logFile="scrcpyLog.txt"

# Clear previous log content
echo "[$(date)] Starting new session" > "$logFile"

# Listing connected devices
echo "Listing connected devices..."
adb devices > temp.txt

# Start tmux session
session_name="scrcpy_session"
tmux new-session -d -s $session_name

pane_index=0

while read line; do
    deviceID=$(echo $line | awk '{print $1}')
    if [[ $deviceID != "List" && $deviceID != "of" && $deviceID != "devices" && $deviceID != "attached" && $deviceID != "" ]]; then
        echo "Found device: $deviceID" >> "$logFile"

        if [ $pane_index -eq 0 ]; then
            # Use the first pane in the initial window
            tmux send-keys -t $session_name "scrcpy -s $deviceID --always-on-top --disable-screensaver -w -S" C-m
        else
            # Split the current window and run scrcpy in the new pane
            tmux split-window -h -t $session_name
            tmux send-keys -t $session_name "scrcpy -s $deviceID --always-on-top --disable-screensaver -w -S" C-m
        fi
        
        # Adjust layout to be even-horizontal
        tmux select-layout -t $session_name even-horizontal
        
        # Create a new pane for adb logcat
        tmux split-window -v -t $session_name
        tmux send-keys -t $session_name "adb -s $deviceID logcat -v color" C-m
        
        # Adjust layout to be even-vertical
        tmux select-layout -t $session_name even-vertical
        
        pane_index=$((pane_index + 1))
    fi
done < temp.txt

# Attach to the tmux session
tmux attach-session -t $session_name

# Delete the temporary file
rm temp.txt

# Ensure proper window management with yabai
# Assuming yabai is already installed and properly configured
yabai -m space --layout bsp

echo "See '$logFile' for details."
read -p "Press any key to continue..."

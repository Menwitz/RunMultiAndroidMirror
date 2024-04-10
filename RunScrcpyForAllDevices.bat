@echo off
setlocal enabledelayedexpansion

:: Log file path
set logFile=%~dp0scrcpyLog.txt

:: Clear previous log content
echo [%date% %time%] Starting new session > "!logFile!"

:: Listing connected devices
echo Listing connected devices...
adb devices > temp.txt
for /f "tokens=1 skip=1" %%a in (temp.txt) do (
    set deviceID=%%a
    :: Check if the string is a device ID
    if not "!deviceID!"=="List" if not "!deviceID!"=="" (
        echo Found device: !deviceID! >> "!logFile!"
        :: Open a new terminal for each device ID and run scrcpy with specified parameters
        start "scrcpy_!deviceID!" cmd /k "scrcpy -s !deviceID! --always-on-top --disable-screensaver -w -S && echo Success: !deviceID! || echo Error: Failed to start scrcpy for !deviceID!"
    )
)

:: Delete the temporary file
del temp.txt

:: Keep the window open
echo.
echo See "!logFile!" for details.
pause

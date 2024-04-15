@echo off
setlocal enabledelayedexpansion

:: Set the interval time in seconds (e.g., 30 seconds)
set interval=30

:: Log file path
set logFile=%~dp0scrcpyLog.txt

:loop
cls
echo [%date% %time%] Checking for new devices...
adb devices > temp.txt

for /f "tokens=1 skip=1" %%a in (temp.txt) do (
    set deviceID=%%a
    if not "!deviceID!"=="List" if not "!deviceID!"=="" (
        findstr /C:"!deviceID!" "!logFile!" > nul
        if errorlevel 1 (
            echo Found new device: !deviceID!
            echo !deviceID! >> "!logFile!"
            start "scrcpy_!deviceID!" cmd /c scrcpy -s !deviceID! --always-on-top --disable-screensaver -w -S
        )
    )
)

timeout /t %interval%
goto loop

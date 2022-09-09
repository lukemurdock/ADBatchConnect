@echo off
title ADB connector thingy
echo Welcome! 
echo This batch file will connect or disconnect you to the desired device so you can deploy code to it!
echo BUT FIRST, FOLLOW THESE STEPS!!!!!
echo.
echo 1) Make sure you are connected to the same WiFi Network that your device is connected to. If not, do that right now.
echo 2) Make sure ADB is installed. If you dont know what that is or you don't have it installed, watch this youtube video:
echo https://www.youtube.com/watch?v=26GI3z6tI3E
echo.
echo Using c to connect will just connect you to 198.168.43.1, so if you want to connect to a custom address, then press i.
echo.
echo Got it?
pause
cls
echo ADBatchConnector
echo.
echo.
echo C to connect 
echo D to disconnect  
echo i to connect to a custom IP Address
set /p letter=(C, D, or i):
set address=NoAddressSet
if %letter%==C (
:connect
cls 
echo Are you sure you want to connect? This will connect you to 192.168.43.1.
pause
cls
echo Connecting... this might take some time, just be patient.
adb connect 192.168.43.1
echo Connection Done! To disconnect, type any character, or you can just close this window if you don't want to do anything else.
pause
goto executeDisconnect
)

if %letter%==D (
:disconnect
cls
echo Are you sure you want to disconnect?
pause
:executeDisconnect
adb disconnect
echo Disconnected! Type anything or close this window to exit
pause
exit
)

if %letter%==i (
:ipconnect
goto executeIP66
)

if %letter%==I (
goto ipconnect
)

if %letter%==d (
goto disconnect
)

if %letter%==c (
goto connect
)

:executeIP66
cls
adb devices
echo Type in the IP Address, then hit enter to connect.
set /p address=
cls
echo Are you sure you want to connect to: %address%
pause
cls
echo Connecting to %address%... this might take some time, just be patient.
adb connect %address%
echo Connection Attempt Done! To disconnect, type any character, or you can just close this window if you don't want to do anything else.
pause
cls
goto executeDisconnect
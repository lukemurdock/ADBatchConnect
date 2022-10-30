@echo off
title ADB connector thingy
color 0a
:mainmenu
cls
echo ADBatchConnector
echo -Main Menu-
echo.
echo C)		Connect (192.168.43.1)
echo D)		Disconnect everything
echo i)		Connect to custom IP
echo A)		About (Make sure to do this if this is your first time here)
echo X)		Close
echo.
set /p letter=(C, D, i, A, or X):
set address=NoAddressSet
if %letter%==C (
goto connect
)

if %letter%==D (
goto disconnect
)

if %letter%==A (
goto about
)

if %letter%==X (
exit
)

if %letter%==x (
exit
)

if %letter%==cdiax (
cls
echo what? why?
pause
goto mainmenu
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

if %letter%==a (
goto about
)

rem 						CUSTOM IP FUNCTION
:executeIP66
cls
adb devices
echo Type in the IP Address, then hit enter to connect.
set /p address=
cls
echo Are you sure you want to connect to: %address%
echo.
echo Y)		Yes
echo N)		No
echo.
set /p yayornay3=(y or n):
if %yayornay3%==y (
goto executeIPsearch
)

if %yayornay3%==n (
goto mainmenu
)

if %yayornay3%==Y (
goto executeIPsearch
)

if %yayornay3%==N (
goto mainmenu
)

rem 								EXECUTE IP SEARCH (ACTUALLY THE FUNCTION THAT CONNECTS TO A CUSTOM IP
:executeIPsearch
cls
echo Connecting to %address%... this might take some time, just be patient.
adb connect %address%
echo.
echo D)		Disconnect
echo M)		Back to Main Menu
echo X)		Close
set /p choicei=(D, M, or X):
if %choicei%==D (
goto disconnect
)

if %choicei%==M (
goto mainmenu
)

if %choicei%==X (
exit
)

if %choicei%==d (
goto disconnect
)

if %choicei%==m (
goto mainmenu
)

if %choicei%==x (
exit
)

rem 						CONNECT FUNCTION
:connect
cls 
echo Are you sure you want to connect? This will connect you to 192.168.43.1.
echo.
echo Y)		Yes
echo N)		No
echo.
set /p yayornay1=(y or n):
if %yayornay1%==y (
goto executeConnect
)

if %yayornay1%==n (
goto mainmenu
)

if %yayornay1%==Y (
goto executeConnect
)

if %yayornay1%==N (
goto mainmenu
)

rem 							DISCONNECT FUNCTION
:disconnect
cls
echo Are you sure you want to disconnect?
echo.
echo Y)		Yes
echo N)		No
echo.
set /p yayornay2=(y or n):
if %yayornay2%==y (
goto executeDisconnect
)

if %yayornay2%==n (
goto mainmenu
)

if %yayornay2%==Y (
goto executeConnect
)

if %yayornay2%==N (
goto mainmenu
)

rem 										EXECUTE DICONNECT FUNCTION
:executeDisconnect
adb disconnect
echo.
echo C)		Connect (192.168.43.1)
echo M)		Back to Main Menu
echo i)		Connect to Custom IP
echo X)		Close
echo.
set /p choiceD=(C, M, i, or X):
if %choiceD%==C (
goto connect
)

if %choiceD%==M (
goto mainmenu
)

if %choiceD%==I (
goto executeIP66
)

if %choiceD%==X (
exit
)

if %choiceD%==c (
goto connect
)

if %choiceD%==m (
goto mainmenu
)

if %choiceD%==i (
goto executeIP66
)

if %choiceD%==x (
exit
)

rem 				ABOUT FUNCTION
:about
cls
echo -About-
echo.
echo This batch file will connect or disconnect you to the desired device via adb so you can deploy code to it!
echo BUT FIRST, FOLLOW THESE STEPS!!!!!
echo.
echo 1) Make sure you are connected to the same WiFi Network that your device is connected to. If not, do that right now.
echo 2) Make sure ADB is installed. If you dont know what that is or you don't have it installed, watch this youtube video:
echo https://www.youtube.com/watch?v=26GI3z6tI3E
echo.
echo Using c to connect will just connect you to 198.168.43.1, so if you want to connect to a custom address, then press i at the main menu.
echo.
pause
goto mainmenu

rem 								EXECUTE CONNECT FUNCTION
:executeConnect
cls
echo Attempting to connect to 192.168.43.1...
adb connect 192.168.43.1
echo D)		Disconnect
echo M)		Back to Main Menu
echo X)		Close
set /p choicec=(D, M, or X):
if %choicec%==D (
goto executeDisconnect
)

if %choicec%==M (
goto mainmenu
)

if %choicec%==X (
exit
)

if %choicec%==d (
goto executeDisconnect
)

if %choicec%==m (
goto mainmenu
)

if %choicec%==x (
exit
)
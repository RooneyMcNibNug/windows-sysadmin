@ECHO OFF
REM ~ Here is a quick batch script to remotely/quietly uninstall an application from another 
REM ~ Windows machine on your domain. Please use responsibly.

:NAME
cls
echo Enter machine's computer name (from domain) - press Q to quit:
echo.
set PC=Z
Set /P PC=
if /I %PC% EQU Q goto EOF
if /I %PC% EQU Z goto NAME
goto APPLIST

:APPLIST
cls
echo Listing applications currently installed - please wait:
wmic /node:"%PC%" product get name
echo.

:MENU2
echo Enter Application to Uninstall - press B for to put in a different machine name, R to rescan applications for this machine, or Q to quit:
echo.
set SOFTWARE=R
Set /P SOFTWARE=
if /I "%SOFTWARE%" EQU "Q" goto EOF
if /I "%SOFTWARE%" EQU "B" goto APPLIST
if /I "%SOFTWARE%" EQU "R" goto NAME
cls
echo Uninstalling "%SOFTWARE%" from %PC%:
wmic /node:"%PC%" product where name="%SOFTWARE%" call uninstall /nointeractive
pause
goto APPLIST

:EOF
EXIT

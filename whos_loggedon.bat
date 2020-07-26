REM Sweep local network for Windows users currently logged on
for /L %i in (1,1,254) do psloggedon \\192.168.l.%i >> C:\users_loggdeon.txt

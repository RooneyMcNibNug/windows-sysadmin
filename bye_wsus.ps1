# Quick Script to remove all WSUS client settings
# Be warned: this ps1 also kills any BITS job

Stop-Service -Name BITS
Stop-Service -Name wuauserv

Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Network\Downloader\qmgr*.dat" -ErrorAction SilentlyContinue
Remove-Item 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Recurse SilentlyContinue

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /f

Get-BitsTransfer | Remove-BitsTransfer

Start-Service -Name BITS
Start-Service -Name wuauserv

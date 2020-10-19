### A quick script for updating existing WSL instances to WSL Version 2
### NOTICE: This script will _not_ restart your machine, but you may need to do so manually before the final three steps (based on a couple of factors)

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart # Enable the Windows Subsystem for Linux
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart # Enable Virtual Machine feature for WSL2

Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -Outfile "$PSScriptRoot\wsl_update_x64.msi" # Download the Linux kernel update package
Start-Process "$PSScriptRoot\wsl_update_x64.msi" -Wait # Install the Linux kernel update package

wsl --set-default-version 2 # Set WSL Version to as default version for all newly created distros
wsl --set-version Debian 2 #Set WSL Version of current distro(s) to ver 2 - INCLUDE ANY OTHER INSTALLED WSL DISTROS YOU WANT TO UPGRADE HERE
wsl --list --verbose # Print distros and versions to verify success

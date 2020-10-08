# quick script for updating existing WSL instances to WSL Version 2

$nixes = wsl -l #list of the system's currently installed WSL distributions
$msi = New-Object System.Diagnostics.ProcessStartInfo("$PSScriptRoot\wsl_update_x64.msi","")

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart # Enable the Windows Subsystem for Linux
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart # Enable Virtual Machine feature for WSL2

Start-BitsTransfer -Source https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -Destination $PSScriptRoot\wsl_update_x64.msi # Download Linux kernel update package

$msi.Start(); # Install Linux Kernel update package
$msi.WaitForExit();

wsl --set-default-version 2 # Set WSL Version to as default version for all newly created distros

Write-host "-------------------------------------" -ForegroundColor Green
Write-host "Applications installed for all users:" -ForegroundColor Green
Write-host "-------------------------------------" -ForegroundColor Green
$InstalledSoftware = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
foreach($obj in $InstalledSoftware){write-host $obj.GetValue('DisplayName') -NoNewline; write-host " - " -NoNewline; write-host $obj.GetValue('DisplayVersion')}

Write-host "--------------------------------------------" -ForegroundColor Green
Write-host "Applications installed for the current user:" -ForegroundColor Green
Write-host "--------------------------------------------" -ForegroundColor Green
$UserInstalled = Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
foreach($obj in $UserInstalled){write-host $obj.GetValue('DisplayName') -NoNewline; write-host " - " -NoNewline; write-host $obj.GetValue('DisplayVersion')}

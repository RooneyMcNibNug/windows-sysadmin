## quickly get users with "Blocked Sign-In" status after "> Connect-MsolService -Credential $msolCred" and export to a .CSV in main user dir.

Get-MsolUser -All | Where {$_.BlockCredential -eq $True} | Select DisplayName,UserPrincipalName,LastLogonDate,IsLicensed | Export-CSV -Path .\blocked_o365_users.csv

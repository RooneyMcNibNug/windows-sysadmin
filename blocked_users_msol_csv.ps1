## quickly get users with "Blocked Sign-In" status after > Connect-MsolService -Credential $msolCred

Get-MsolUser -All | Where {$_.BlockCredential -eq $True} | Select DisplayName,UserPrincipalName, IsLicensed | Export-CSV -Path .\blocked_o365_users.csv

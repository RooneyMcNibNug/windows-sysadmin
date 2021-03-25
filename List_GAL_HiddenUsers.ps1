## Super quick one-liner to grab all users currently hidden from the Global Address List from Connect-ExchangeOnline and generate a .CSV with timestamp

Get-Mailbox -ResultSize Unlimited | Where {$_.HiddenFromAddressListsEnabled -eq $True} | Select Name,PrimarySmtpAddress,ExchangeObjectId,RecipientTypeDetails,WhenCreated,WhenChanged,HiddenFromAddressListsEnabled | Export-CSV -Path .\UsersHiddenFromGAL_$((Get-Date).ToString('MM-dd-yyyy_hh-mm-ss')).csv

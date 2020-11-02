$SiteURL = "https://contoso.sharepoint.com/library"
$CSVFilePath = "C:\Temp\Folders.csv"
  
Try {
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
    #Get CSV
    $CSVFile = Import-Csv $CSVFilePath
   
    #Read CSV and create Document Library
    ForEach($Row in $CSVFile)
    { 
        #Create Directories
        Resolve-PnPFolder -SiteRelativePath $Row.FolderSiteRelativeURL | Out-Null
        Write-host "Ensured Folder:"$Row.FolderSiteRelativeURL -f Green
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}

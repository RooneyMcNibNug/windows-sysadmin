# onleiner to refresh the root certificates on a Windows machine

certutil.exe -f -generateSSTFromWU "%TEMP%\r.sst"; Get-ChildItem -Path "%TEMP%\r.sst" ^| Import-Certificate -CertStoreLocation Cert:\LocalMachine\Root

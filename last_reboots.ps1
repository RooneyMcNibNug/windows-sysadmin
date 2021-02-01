# Quick one-liner for checking last observed reboots from Windows Events Log
# Displaying Host, User, and Timestamp

Get-EventLog -log System -newest 1000 | Where-Object {$_.EventID -eq '1074'} | FT machinename, username, timegenerated -autosize

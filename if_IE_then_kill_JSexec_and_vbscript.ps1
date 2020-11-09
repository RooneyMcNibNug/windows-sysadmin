## Running into a use case where someone needs to use IE (scripting not required) for some recent internal software? Hate this?
## Here is a script to disable some dangerous legacy scripting (see links in comments) responsible for the lsat 5 zero-day vulns 
## in IE at the time of writing this.

## MAKE SURE TO REVIEW THIS AND ENSURE THESE ARE NOT REQUIRED FOR TASKS AT HAND BEFORE DISABLING.
## This is set to be applied to your Internet Zone, not your Restricted Sites Zone (see links again for options to change this)

# https://support.microsoft.com/en-gb/help/4586060/option-to-disable-jscript-execution
# Disable JScript execution in Internet Explorer for Internet Zone
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\140D" -Name “140D” -Value “3”

# https://support.microsoft.com/en-us/help/4012494/option-to-disable-vbscript-execution-in-internet-explorer-for-internet
# Disable VBScript execution in Internet Explorer for Internet Zone
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\140C" -Name “140C” -Value “3”

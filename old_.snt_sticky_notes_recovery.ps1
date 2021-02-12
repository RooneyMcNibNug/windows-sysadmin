## I have been surprised how many times I have had to restore user notes from old-school .snt Sticky Notes file.
## This lame script will automate the steps to load the notes into a fresh Stick Notes app.
## You can then deliver them to the user in question however you feel necessary.

### WARNING: THIS SCRIPT WILL COMPLETELY DELETE ANY CURRENT NOTES IN YOUR STICKY NOTES APPLICATION
### AND REPLACE THEM WITH THE NOTES YOU ARE RECOVERING. BACK UP YOUR STICKY NOTES OR DO THIS IN AN 
### ENVIRONMENT WITH A FRESH STICKY NOTES APPLICATION INSTALL PLEASE.

## I try and tell them to use OneNote or Evernote, but to each their own.

# # # BEGIN SCRIPT # # #

# Save the file you want to recover notes from as a variable here
# Example input -> C:\Users\Rooney\Downloads\StickyNotesToRecover.snt
$stickyfile = Read-Host -Prompt 'Please provide the full filename (including full path) of your .snt you wish to retrive data from'

# Reset the Sticky Notes application
### WARNING: THIS WILL DELETE CURRENT DATA RETAINED WITHIN YOUR NOTES, SO BACK THEM UP FIRST
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Reset-AppxPackage

# Make Legacy directory for .snt
mkdir %LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy

# Copy file you are looking to recover to Legacy directory
Copy-Item -Path $stickyfile -Destination %LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy

# Rename required to bring Legacy notes up in the application
Rename-Item "%LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy\*.snt" -NewName "ThresholdNotes.snt"

# Now launch Sticky Notes application to see the old notes

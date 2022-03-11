# Script:                       Ops Challenge 09 (PowerShell Log Retrieval)
# Author:                       Jeremy Burks
# Date of latest revision:      03/06/22
# Purpose:                      Pulls Event logs with specific parameters 

# Line 17-18 Outputs all events from the System event log that occurred in the last 24 hours to a file on the desktop named last_24.txt
# Line 22-23 Outputs all error type events from the System event log to a file on the desktop named errors.txt
# Line 27-28 Prints to the screen all events with ID of 16 from the System event log.
# Line 32-33 Prints to the screen the most recent 20 entries from the System event log.
# Line 37-38 Prints to the screen all sources of the 500 most recent entries in the System event log.

# Created a variable to store file driectory path Desktop
$DesktopPath = [Environment]::GetFolderPath("Desktop")

"`n"
echo "Creating file at $DesktopPath with all events within the last 24 hours"
$event = Get-EventLog -LogName System -After (Get-Date).AddDays(-1)
$event | Out-File -FilePath $DesktopPath\last_24.txt

"`n"
echo "Creating file at $DesktopPath with 100 most recent errors"  
$eventnewest100 = Get-EventLog -LogName System -EntryType Error -Newest 100 
$eventnewest100 | Out-File -FilePath $DesktopPath\errors.txt

"`n"
echo "All recent events with Event ID 16: "
Get-EventLog -LogName System -InstanceId 16 

"`n"
echo "20 Most recent entries in system event log: "
Get-EventLog -LogName System -Newest 20

"`n"
echo "Sources of most recent 500 events: "
$sourceEvent = Get-EventLog -LogName System -Newest 500
$sourceEvent | Group-Object -Property Source -NoElement | Sort-Object -Property Count -Descending | Format-Wide

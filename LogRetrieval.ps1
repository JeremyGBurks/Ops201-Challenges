# 
$DesktopPath = [Environment]::GetFolderPath("Desktop")


"`n"
echo "Creating file at $DesktopPath with all events within the last 24 hours"
$event = Get-EventLog -LogName System -After (Get-Date).AddDays(-1)
$event | Out-File -FilePath $DesktopPath\last_24.txt

"`n"
echo "Creating file with 100 most recent errors"  
$eventnewest100 = Get-EventLog -LogName System -EntryType Error -Newest 100 
$eventnewest100 | Out-File -FilePath $DesktopPath\errors2.txt

"`n"
echo "100 Most recent events with Event ID 16: "
$eventlog16 = Get-EventLog -LogName System -InstanceId 16 -Newest 100
$eventlog16

"`n"
echo "20 Most recent entries in system event log: "
$eventnew20 = Get-EventLog -LogName System -Newest 20
$eventnew20

"`n"
echo "Sources of most recent 500 events: "
$sourceEvent = Get-EventLog -LogName System -Newest 500
$sourceEvent | Group-Object -Property Source -NoElement | Sort-Object -Property Count -Descending | Format-Wide

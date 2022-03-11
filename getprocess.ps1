# Script:                       Ops Challenge 10 (PowerShell Get-Process)
# Author:                       Jeremy Burks
# Date of latest revision:      03/09/22
# Purpose:                      Sorts and displays specified processes. Starts iexplore as well as uses a <for> loop to open 10 instances. Cmdlt to shut down iexplore, and an interactive menu to prompt user for PID to close program

#Line 15 Sets Get-Process to the variable $G
#Line 17 Sorts CPU process in descending order from highest to lowest
#Line 20 Sorts PIDs in descending order
#Line 23 Sorts working sets in descending order but specifies only the top 5
#Line 25 Opens iexplore to a particular web page
#Line 27 through 29 is a <for> loop that uses logic to open 10 instances of iexplorer
#Line 31 Kills iexplore
#Line 33 through 35 Prints out processes in descending order by their PID then prompts the user to enter a PID to terminate a prcess

$G = Get-Process
echo "Active CPU Processes" 
$G | Sort-Object -Property CPU -Descending 
"`n"
echo "Active Processes sorted by PID in descending order"
$G | Sort-Object -Property ID -Descending
"`n"
echo "Top 5 active working sets in descending order"
$G | Sort-Object -Property WS -Descending | Select -First 5
"`n"
[System.Diagnostics.Process]::Start("iexplore","https://owasp.org/www-project-top-ten/")

for ($Startproc=1; $Startproc -le 10; $Startproc++){
    [System.Diagnostics.Process]::Start("iexplore","https://owasp.org/www-project-top-ten/")
}

Stop-Process -Name "iexplore"

$G | Sort-Object -Property ID -Descending
$response = Read-Host -Prompt "Enter PID to terminate"
Stop-Process -ID $response

# Script Name: IP Analysis 
# Author: Jeremy Burks
# Date of last revision: 03/17/2022
# Purpse: Fetches network info, saves it to a file on the desktop. Uses Select-String to display only the IPv4 info, then deletes the file when the script is complete. 


#Declaring the variable and using it in a function
"`n"
$response = "Writing up your network report!"
Function superfluous {
    echo "$response"
}
superfluous

Start-Sleep -Seconds 2
"`n"
Write-Host "....Saving it to your Desktop"
#saves ipconfig info to a .txt on Desktop
ipconfig /all > C:\Users\jerem\Desktop\Network_report.txt
Start-Sleep -Seconds 3
"`n"
Write-Host "Displaying your IPv4 below"

Start-Sleep -Seconds 2
#Uses Select-String to only pull IPv4 from network info 
Select-String -Path C:\Users\jerem\Desktop\Network_report.txt -Pattern 'IPv4'
#Removes file 
rm C:\Users\jerem\Desktop\Network_report.txt

"`n"
Start-Sleep -Seconds 2
Write-Host ".......AND now it's gone! POOOF"
Start-Sleep -Seconds 2

#done

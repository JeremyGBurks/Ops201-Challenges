# Script:                       Ops Challenge 11 (PowerShell automated endpoint)
# Author:                       Jeremy Burks
# Date of latest revision:      03/14/22
# Purpose:                      User Menu that automates Windows 10 system configurations for deployment

#Function that enables File and Printer Sharing
function Enable_PSSharing {
       Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enable True
}
#Function that allows ICMP traffic
function Allow_PSTraffic {
       netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4 
}
#Function that Enables Remote Management 
function Enable_PSRemote {
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
}
#Function that enables the Bloatware removing script/menu
function Remove_PSBloat {
        iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
}
#Function that Enables Hyper-V
function Enable_PSHyperV {
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}
#Function that disables SMBv1
function Disable_SMB {
        Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
}
#Function that restarts system
function Restart_System {
        Restart-Computer
}
#This function is the timer that is displayed when the user selects to restart their system
function Enable_PSCounter{
$delay = 10
$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Hope you all your files are saved!"
$Counter_Form.Width = 400
$Counter_Form.Height = 100
$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.AutoSize = $true
$Counter_Form.Controls.Add($Counter_Label)
while ($delay -ge 0)
{
  $Counter_Form.Show()
  $Counter_Label.Text = "Seconds to System Restart: $($delay)"
  start-sleep 1
  $delay -= 1
 }
}

#This is the main menu 
do {
Write-Host "=============Automated Endpoint Config Menu==============="
Write-Host "`t1. 'E' to Enable File and Printer Sharing "
Write-Host "`t2. 'A' to Allow ICMP Traffic"
Write-Host "`t3. 'M' to Enable Remote Management"
Write-Host "`t4. 'B' to Open menu to Remove Bloatware"
Write-Host "`t5. 'H' to Enable Hyper-V"
Write-Host "`t6. 'D' to Disable SMBv1"
Write-Host "`t7. 'R' to Restart System"
Write-Host "`t8. 'X' to Quit"
Write-Host "=========================================================="
$choice = Read-Host "`nEnter Choice"
} until (($choice -eq 'E') -or ($choice -eq 'A') -or ($choice -eq 'M') -or ($choice -eq 'B') -or ($choice -eq 'H') -or ($choice -eq 'D') -or ($choice -eq 'R') -or ($choice -eq 'X'))

switch ($choice) {
    'E' {
        Write-Host "`nYou have selected Enable File and Printer Sharing"
        Enable_PSSharing
    }
    'A' {
        Write-Host "`nYou have selected Allow ICMP Traffic"
        Allow_PSTraffic
    }
    'M' {
        Write-Host "`nYou have selected Enable Remote Management"
        Enable_PSRemote
    }
    'B' {
        Write-Host "`nOpening Windows10 Debloater Menu"
        Remove_PSBloat
    }
    'H' {
        Write-Host "`nYou have selected Enable Hyper-V"
        Enable_PSHyperV
    }
    'D' {
        Write-Host "`nYou have selected Disable SMBv1"
        Disable_SMB
    }
    'R' {
        Write-Host "`nRestarting your computer"
        Enable_PSCounter
        Restart_System
    }
    'X' {
        Return
    }
    
 }  
 
 #end

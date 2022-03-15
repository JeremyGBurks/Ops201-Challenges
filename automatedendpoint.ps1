# Script:                       Ops Challenge 11 (PowerShell automated endpoint)
# Author:                       Jeremy Burks
# Date of latest revision:      03/14/22
# Purpose:                      Automates Windows 10 system configurations for deployment

#Enables file and printer sharing
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enable True
#Allows ICMP traffic
netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4
#Enables remote management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
#Removes bloatware
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
#Enables Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
#Disables SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
#End
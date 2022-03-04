# Script:                       Ops Challenge 08 (robocopy)
# Author:                       Jeremy Burks
# Date of latest revision:      03/05/22
# Purpose:                      Automates the copy function of files on the target computer. Windows Task Scheduler was used to set this to occur every night at 21:00hrs.


@echo off

ROBOCOPY C:\users\j.thompson\Desktop\MyProjectFiles E:\Desktop /LOG:backuplog.txt

pause
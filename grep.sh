# !/bin/bash

# Script:                       Ops Challenge 07 (grep lshw)
# Author:                       Jeremy Burks
# Date of latest revision:      02/28/22
# Purpose:                      uses grep with the lshw command to pick out specific system info, and exclude others

# declaration of variables
echo ""
echo -e "\e[31m*~*~*Execute script as root/run as sudo*~*~*\e[0m"
computername="-e \e[31mComputer name: \e[0m" 
cpuinfo="-e \e[31mCPU info: \e[0m" 
raminfo="-e \e[31mRAM info: \e[0m"
displayadapterinfo="-e \e[31mDisplay Adapter info: \e[0m"
networkadapterinfo="-e \e[31mNetwork Adapter info: \e[0m"

# -E is extended-regexp I found info on the use @ the link below
# https://linuxize.com/post/regular-expressions-in-grep/

echo ""
echo -e "\e[31m*~*~*System Info Lookup*~*~*\e[0m"
echo ""
    echo $computername $(lshw | grep -i -m1 "")
    echo ""
    echo $cpuinfo
    sudo lshw -class cpu | grep -E 'product:|vendor:|physical id:|bus info:|width'
    echo $raminfo
    sudo lshw -class memory | grep -E 'description:|physical id:|size' | tail -n3
    echo $displayadapterinfo
    sudo lshw -class display | grep -E -wv 'version|-display'
    echo $networkadapterinfo
    sudo lshw -class network | grep -E -wv 'network'

    # -e "\e[31m(enter text)\e[0m" turns the text in the parentheses red
    # -class parameter defines the specific header to grep from
    # used the | tail -n3 to get the last 3 matches of description, physical id, and size. without tail -n3 it listed out the same categories but from the firmware class
    # used the -wv to exclude "version and -display" from results
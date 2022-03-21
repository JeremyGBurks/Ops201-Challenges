# !/bin/bash

# Script: Domain Analyzer
# Author: Jeremy Burks
# Date of latest revision: 03/21/2022
# Purpose: A script that asks a user to type a domain, then displays information regarding the domain as well as saves it into a .txt file

#Variables
who_info="whois output"
dig_info="Dig output"
host_info="Host output"
ns_info="nslookup output"

#function
siteanalytics(){
    echo $who_info
    whois $answer
    echo $dig_info
    dig $answer
    echo host_info
    host $answer
    echo $ns_info
    nslookup $answer
}

#Main user menu
echo "*~*~*~*~Domain Information~*~*~*~*"
read -p "Enter domain (including .com): " answer

#stores the data into a file
siteanalytics > siteanalytics.txt
echo "This information has been added to file: siteanalytics.txt"
user_menu(){
    echo "Would you like to view contents of siteanalytics.txt in the terminal?"
    read -p "Enter Y for yes N for no: " input
    if [[ $input == [yY] ]]; then
      echo "printing contents to terminal"
      cat siteanalytics.txt  
    else
      echo "clearing out terminal" 
      sleep 3
      clear
    fi
}
user_menu

#!/bin/bash

# Script:                       Ops Challenge 05
# Author:                       Jeremy Burks
# Date of latest revision:      02/21/22
# Purpose:                      Displays the running processes, accepts PID input from user and kills the process in a <while> loop. 

processes=$(ps aux) 
echo "$processes" 
echo ""
echo "WARNING! DO NOT KILL ROOT/KERNEL PROCESSES!"
echo ""
# Creates the variable processes and assigns it to the ps -a command that prints all running processes

while [ true ]
do
 
  read -p 'enter PID: ' usevar
  echo killing the process with PID $usevar 
  kill $usevar 
  echo "CTRL+C to exit"

done 

# A while loop that after printing all running processes, prompts the user for PID input. It kills the specified process and the loop is fulfilled.
# Line 19 is an echo command that provides an exit if the loop cannot be completed. Loop will continue if user enters in unknown PID

# Declaration of variables: 
# processes
# usevar
#!/bin/bash

# Script:                       Op Challenge Day 03
# Author:                       Jeremy Burks
# Date of latest revision:      02/12/22
# Purpose:                      Pulls the history of the last 3 logins 
# descriptive comments:         Simple script that uses the varible login_history with the function to call the history of the previous three logins
# Declaration of variables:     login_history

echo "Login history"
login_history(){

    echo $(last -3)

}

login_history

# End
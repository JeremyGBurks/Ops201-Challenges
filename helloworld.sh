# shebang /bin/bash

# Script Name: networkfetch
# Description of purpose: fetches network adaptor info and saves it as a variable
# Example usage: to capture network activity for analyzing
# Expected output: results of the ping
# Declaration of variables (if any): ping output is varible that contains response from IP address
# Declaration of functions (if any):

# Main

#!/bin/bash

ping_output=$(ping -c 4 8.8.8.8)

echo $ping_output > output.txt
echo "I am working perfectly"
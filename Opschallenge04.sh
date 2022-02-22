#! bin/bash

# Script:                       Op Challenge Day 04
# Author:                       Jeremy Burks
# Date of latest revision:      02/14/22
# Purpose:                      Creates 4 directories and stores them in an array
# descriptive comments:        
# Declaration of variables:     array_test

mkdir dir1
mkdir dir2
mkdir dir3
mkdir dir4

array_test=(dir1 dir2 dir3 dir4)

touch ${array_test[0]}/file.txt
touch ${array_test[1]}/file.txt
touch ${array_test[2]}/file.txt
touch ${array_test[3]}/file.txt
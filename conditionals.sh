# !/bin/bash

# Script:                       Op Challenge Day 06 (array, loop, conditional)
# Author:                       Jeremy Burks
# Date of latest revision:      02/24/22
# Purpose:                      checks if a directory/file exists. If it does not, it creates it.
       
# function to check if a file in an array exists. If it does not, it creates it.
filecreate(){
    listfile=(file1.txt file2.txt file3.txt)
    for index in "${listfile[@]}"
    do  
        if [[ -f $index ]]; then 
            echo "$index already exists"
        else
            echo "Creating $index"
            touch $index
        fi
    done
}

# function to check if a directory in an array exists. If it does not, it creates it.
dircreate(){
listdir=(dir1 dir2 dir3)
    for index in "${listdir[@]}"
    do  
        if [[ -d $index ]]; then 
            echo "$index already exists"
        else
            echo "Creating $index"
            touch $index
        fi
    done
}

# while loop that prompts the user to enter 1 (file) 2 (directory) 3 (to exit). Depending on user input, it employs logic to call a particular function or return to the top of the loop.
while [ true ]
do 
    echo "Press 1 to check if a file exists/create a new file." 
    echo "Press 2 to check if a directory exists/create a new directory"
    echo "Press 3 to exit"
    read userinput
    echo "You have selected: $userinput"
    if [[ $userinput == 1 ]]; then
         echo "Hold tight...I'm filing..."
         sleep .5
         filecreate
    elif [[ $userinput == 2 ]]; then
         echo "Hold tight...I'm directing..."
         sleep .5
         dircreate
    elif [[ $userinput == 3 ]]; then
         sleep .5
         echo "Goodbye!"
         break   
    else
        echo "Enter a valid number or Press Ctrl+C to exit"
    fi
done
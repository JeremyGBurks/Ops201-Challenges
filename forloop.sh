#!bin/bash
netoworkinfo=$(ifconfig)

network(){

echo $netoworkinfo
touch networkinfo.txt


}
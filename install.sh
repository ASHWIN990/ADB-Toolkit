#!/bin/bash

if [ $(id -u) -ne 0 ]; then
        echo -e "\e[1;91mTHE INSTALLATION SCRIPT MUST BE RAN AS ROOT\e[0m"
        exit 1
fi
sudo apt-get update
sudo apt-get install adb -y
sudo apt-get install fastboot -y
chmod +x ADB-Toolkit.sh
echo "alias adb-tookite='.$PWD/ADB-Toolkit.sh'" >> ~/.bash_aliases
clear
echo
echo -e "\e[1;92mINSTALLATION COMPLETED"
echo
echo -e "\e[1;92mUSAGE = \e[1;91m'sudo ./ADB-Toolkit.sh' or you can do 'sudo adb-tookit' from anywhere in shell\e[0m"
echo
echo

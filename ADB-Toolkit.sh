#!/bin/bash
#Author = ASHWINI SAHU
#Date = 14/03/2019
#Written in Bash
#"ONLY FOR EDUCATIONAL PURPOSE"


echo "ADB-Toolkit"
echo
echo
echo

if [ $(id -u) -ne 0 ]; then
        echo "THIS SCRIPT MUST BE RAN AS ROOT"
        exit 1
fi

 adb kill-server
 adb start-server

dep1="adb"
dep2="fastboot"

if apt-get -qq install $dep1; then
    echo "ADB IS INSTALLED"
else
    echo "ERROR INSTALLING ADB, INSTALL IT MANUALLY"
fi

echo

if apt-get -qq install $dep2; then
    echo "FASTBOOT IS INSTALLED"
else
    echo "ERROR INSTALLING FASTBOOT, INSTALL IT MANUALLY"
fi

clear

echo -e "\e[1;93m

 █████╗ ██████╗ ██████╗               ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗
██╔══██╗██╔══██╗██╔══██╗              ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝
███████║██║  ██║██████╔╝    █████╗       ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║
██╔══██║██║  ██║██╔══██╗    ╚════╝       ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║
██║  ██║██████╔╝██████╔╝                 ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║
╚═╝  ╚═╝╚═════╝ ╚═════╝                  ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝

\e[0m"

bash modules/funtion.sh

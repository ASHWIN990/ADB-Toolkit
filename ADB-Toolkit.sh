#!/bin/bash
#Tool = ADB-Toolkit V2
#Author = ASHWINI SAHU
#Date = 07/07/2019
#Written in Bash
#"ONLY FOR EDUCATIONAL PURPOSE"


echo "ADB-Toolkit"
echo
echo

if [ $(id -u) -ne 0 ]; then
        echo "THIS SCRIPT MUST BE RAN AS ROOT"
        exit
fi


dep1="adb"
dep2="fastboot"

if apt-get -qq install $dep1; then
    echo "ADB IS INSTALLED"
else
    echo -e "\nERROR INSTALLING ADB, INSTALL IT MANUALLY"
fi

echo

if apt-get -qq install $dep2; then
    echo "FASTBOOT IS INSTALLED"
else
    echo -e "\nERROR INSTALLING FASTBOOT, INSTALL IT MANUALLY"
fi

 adb kill-server >/dev/null 2>&1 | echo -e "\n\nKilling previous running ADB Server."
 adb start-server >/dev/null 2>&1 | echo -e "\n\nStarting New ADB Server."


clear


banner () {

echo -e "\e[1;93m

 █████╗ ██████╗ ██████╗               ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗
██╔══██╗██╔══██╗██╔══██╗              ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝
███████║██║  ██║██████╔╝    █████╗       ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║
██╔══██║██║  ██║██╔══██╗    ╚════╝       ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║
██║  ██║██████╔╝██████╔╝                 ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║
╚═╝  ╚═╝╚═════╝ ╚═════╝                  ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝

\e[0m"
echo
echo -e "\e[93mMade with LOVE by \e[1;91mASHWINI SAHU\e[0m"
}
bash modules/funtion.sh

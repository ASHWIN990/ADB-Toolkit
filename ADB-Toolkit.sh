#!/bin/bash
#Tool = ADB-Toolkit V2.1
#Author = ASHWINI SAHU
#Date = 07/02/2020
#Written in Bash
#"ONLY FOR EDUCATIONAL PURPOSE"


echo -e "ADB-Toolkit by ASHWINI SAHU"
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
    echo -e "FASTBOOT IS INSTALLED\n"
else
    echo -e "\nERROR INSTALLING FASTBOOT, INSTALL IT MANUALLY"
fi

while true; do
  read -p $'\e[93;1mDo you want to kill and restart the Server. \e[1;97m (Y/N) \e[93;1m? : \e[1;91m' yn
  case $yn in
  [Yy]* ) adb kill-server >/dev/null 2>&1 | echo -e "\n\nKilling previous running ADB Server." ;adb start-server >/dev/null 2>&1 | echo -e "\n\nStarting New ADB Server." ;break;;
  [Nn]* )  echo -e "NOT RESTARTING THE SERVER" ;break;;
  * ) echo -e "\e[1;93mPlease answer it with\e[1;97m ( Y/N )\e[0m";;
  esac
  done

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

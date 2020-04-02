#!/bin/bash
#Tool = ADB-Toolkit V2.1
#Author = ASHWINI SAHU
#Date = 07/02/2020
#Written in Bash
#"ONLY FOR EDUCATIONAL PURPOSE"


echo -e "ADB-Toolkit by ASHWINI SAHU\n\n"

if [ $(id -u) -ne 0 ]; then
        echo "THIS SCRIPT MUST BE RAN AS ROOT"
        exit 1
fi

if [ -d $PWD/.temp/ ]
    then
        echo -e "YOU HAVE THE .temp DIRECTORY" && clear
    else
        echo -e "PLEASE INSTALL THE TOOL IF NOT INSTALLED OR IF INSTALLED MAKE A '.temp' DIRECTORY FIRST" && exit
fi



adb_check=$(which adb) 

if [ "$?" == 0 ]; then
    echo -e "ADB IS INSTALLED\n"
    echo -e "INITALIZING ADB\n"
else
    echo -e "\nADB IS NOT INSTALLED, RUN THE INSTALLATION SCRIPT OR TRY INSTALLING 'ADB' MANUALLY"
    exit 1
fi


adb_check=$(which fastboot)

if [ "$?" == 0 ]; then
    echo -e "FASTBOOT IS INSTALLED\n"
    echo -e "INITALIZING FASTBOOT\n"
else
    echo -e "\nFASTBOOT IS NOT INSTALLED, RUN THE INSTALLATION SCRIPT OR TRY INSTALLING 'FASTBOOT' MANUALLY"
    exit 1
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
echo -e "\e[93mMade with ❤️ by \e[1;91mASHWINI SAHU\e[0m"
}
bash modules/funtion.sh

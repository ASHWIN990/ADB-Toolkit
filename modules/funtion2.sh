#!/bin/bash

banner2 () {
echo -e "\e[1;91m

███╗   ███╗███████╗████████╗ █████╗                █████╗ ██████╗ ██████╗
████╗ ████║██╔════╝╚══██╔══╝██╔══██╗              ██╔══██╗██╔══██╗██╔══██╗
██╔████╔██║█████╗     ██║   ███████║    █████╗    ███████║██║  ██║██████╔╝
██║╚██╔╝██║██╔══╝     ██║   ██╔══██║    ╚════╝    ██╔══██║██║  ██║██╔══██╗
██║ ╚═╝ ██║███████╗   ██║   ██║  ██║              ██║  ██║██████╔╝██████╔╝
╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝              ╚═╝  ╚═╝╚═════╝ ╚═════╝

"
}

banner2
echo -e "\e[93mMade with LOVE by \e[1;91mASHWINI SAHU\e[0m\n\n"

echo -e "\e[1;4;93mCHOOSE THE OPTIONS GIVEN BELOW\e[0m"
echo -e
echo -e
echo -e "\e[1;93m1.   \e[1;92mSHOW CONNECTED DEVICES"
echo -e "\e[1;93m2.   \e[1;92mCREATE AND INSTALL METAPLOIT PAYLOAD \e[1;93m( .apk )"
echo -e "\e[1;93m3.   \e[1;92mCREATE A METAPLOIT PAYLOAD \e[1;93m( .pdf )"
echo -e "\e[1;93m4.   \e[1;92mLAUNCH THE METASPLOIT PACKAGE \e[1;93m( .apk )"
echo -e "\n\e[1;93m5.   \e[1;91mLAUNCH THE METASPLOIT LISTNER \e[1;93m( .apk )"
echo -e "\e[1;93m6.   \e[1;91mLAUNCH THE METASPLOIT LISTNER \e[1;93m( .pdf )"
echo -e "\n\e[1;93m7.   \e[1;92mGO BACK TO ADB-Toolkit"
echo -e "\e[1;93mE.   \e[1;92mEXIT or press Ctrl+c"

read -p $'\n\n\e[1;4;91mSELECT ONE OF THE OPTIONS WITH THE RESPECTED NUMBER\e[0m\e[24;1;97m : ' options2

if [ "$options2" = "1" ]

  then


    echo -e
    bash modules/2opt1


fi

if [ "$options2" = "2" ]

  then


    echo -e
    bash modules/2opt2


fi

if [ "$options2" = "3" ]

  then


    echo -e
    bash modules/2opt3


fi

if [ "$options2" = "4" ]

  then


    echo -e
    bash modules/2opt4


fi

if [ "$options2" = "5" ]

  then


    echo -e
    bash modules/2opt5


fi

if [ "$options2" = "6" ]

  then


    echo -e
    bash modules/2opt6


fi

if [ "$options2" = "7" ]

  then


    echo -e
    clear && bash modules/funtion.sh


fi

if [[ ($options2 = "E" || $options2 = "e") ]];

 then


  clear && echo -e "Exiting the ADB-Toolkit, Thanks for using."
  adb kill-server >/dev/null 2>&1 | echo -e "\nKilling previous running ADB Server."
  echo -e "\nDONE"
  exit


fi

#clear && banner2 && bash modules/funtion2.sh

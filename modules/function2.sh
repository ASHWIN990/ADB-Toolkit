#!/bin/bash

clean_exit () {

  rm -rf $PWD/.temp/* &> /dev/null
  rm -rf $PWD/1 &> /dev/null
  rm -rf $PWD/2 &> /dev/null
  clear && echo -e "\nCtrl-C caught...Performing Clean Up Thanks for Using.\n"
  echo -e "Exiting the ADB-Toolkit, Thanks for using."
  echo -e "\nDONE"
  exit 0

}

trap_ctrlc () {
    clean_exit
}

trap "trap_ctrlc" 2

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
option2_list () {
        banner2
        echo -e "\e[93mMade with LOVE by \e[1;91mASHWINI SAHU\e[0m\n\n"
        echo -e "\e[1;4;93mCHOOSE THE OPTIONS GIVEN BELOW\e[0m\n\n"
        echo -e "\e[1;93m1.   \e[1;92mSHOW CONNECTED DEVICES"
        echo -e "\e[1;93m2.   \e[1;92mCREATE AND INSTALL METAPLOIT PAYLOAD \e[1;93m( .apk )"
        echo -e "\e[1;93m3.   \e[1;92mLAUNCH THE METASPLOIT PACKAGE \e[1;93m( .apk )"
        echo -e "\n\e[1;93m4.   \e[1;92mLAUNCH THE METASPLOIT LISTNER \e[1;93m( .apk )"
        echo -e "\n\e[1;93m5.   \e[1;92mGO BACK TO ADB-Toolkit"
        echo -e "\e[1;93mE.   \e[1;92mEXIT or press Ctrl+c\n"
        echo $revised
        read -p $'\n\e[1;4;91mSELECT ONE OF THE OPTIONS WITH THE RESPECTED NUMBER\e[0m\e[24;1;97m : ' options2

}

## CALLING THE option list function once

clear
revised=""
option2_list

## THE LOOP STARTS FROM HERE

while [ 1 ]
do

        case $options2 in

        "1") echo -e; bash modules/2opt1;;
        "2") echo -e; bash modules/2opt2;;
        "3") echo -e; bash modules/2opt3;;
        "4") echo -e; bash modules/2opt4;;
        "5") echo -e; bash modules/funtion.sh;;
        "E") clean_exit;;
        "e") clean_exit;;

        *) clear; revised="\e[1;4;91mENTER THE RIGHT OPTION BRO :-)\n"; option2_list;;

        esac

done

#!/bin/bash

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

banner
echo -e
echo -e
echo -e "\e[1;4;91mCHOOSE THE OPTIONS GIVEN BELOW\e[0m"
echo -e
echo -e
echo -e "\e[1;93m1.   \e[1;92mSHOW CONNECTED DEVICES                           \e[1;93m24.  \e[1;92mPUT A FILE IN VICTIMS DEVICE "
echo -e "\e[1;93m2.   \e[1;92mRESTART ADB SERVICE "
echo -e "\e[1;93m3.   \e[1;92mREBOOT SYSTEM"
echo -e "\e[1;93m4.   \e[1;92mREBOOT TO RECOVERY MODE                          \e[1;93m25.  \e[1;91mGO TO METASPLOIT SECTION "
echo -e "\e[1;93m5.   \e[1;92mREBOOT TO FASTBOOT/BOOTLOADER MODE "
echo
echo -e "\e[1;93m6.   \e[1;92mSTART A INTERACTIVE SHELL                        \e[1;93m26.  \e[1;92mLAUNCH AN APPLICATION "
echo -e "\e[1;93m7.   \e[1;92mGET SYSTEM INFORMATION                           \e[1;93m27.  \e[1;92mCHECK IS PHONE ROOTED OR NOT"
echo -e "\e[1;93m8.   \e[1;92mGET CPU INFO                                     \e[1;93m28.  \e[1;92mHANG THE PHONE ( Rooted Phone ) "
echo -e "\e[1;93m10.  \e[1;92mGET PHONE DETAILS                                \e[1;93m29.  \e[1;92mSEND SMS FROM THE PHONE "
echo -e "\e[1;93m11.  \e[1;92mCAPTURE BUG REPORT"
echo -e "\e[1;93m12.  \e[1;92mINSTALL AN PACAKAGE 'apk'"
echo -e "\e[1;93m13.  \e[1;92mUNINSTALL AN PACKAGE"
echo -e "\e[1;93m14.  \e[1;92mLIST ALL INSTALLED PACKAGE"
echo -e "\e[1;93m15.  \e[1;92mSEE LIVE LOG OF DEVICE"
echo -e "\e[1;93m16.  \e[1;92mESTABLISH A REMOTE CONNECTION WITH THE DEVICE"
echo -e
echo -e "\e[1;93m17.  \e[1;92mCAPTURE A SCREENSHOT ANONYMOUSLY"
echo -e "\e[1;93m18.  \e[1;92mRECORD THE SCREEN ANONYMOUSLY"
echo -e "\e[1;93m19.  \e[1;92mCOPY ALL THE CAMERA PHOTOS"
echo -e "\e[1;93m20.  \e[1;92mCOPY ALL THE DOWNLOADS"
echo -e "\e[1;93m21.  \e[1;92mCOPY ALL WHATSAPP DATA"
echo -e "\e[1;93m22.  \e[1;92mCOPY ALL DEVICE STORAGE                          \e[1;93mA.  \e[1;92mABOUT AUTHOUR "
echo -e "\e[1;93m23.  \e[1;92mCOPY A SPECIFIED FILE OR FOLDER                  \e[1;93mE.  \e[1;92mEXIT or press Ctrl+c"
echo -e
echo -e
read -p $'\e[1;4;91mSELECT ONE OF THE OPTIONS WITH THE RESPECTED NUMBER\e[0m\e[24;1;97m : ' options


if [ "$options" = "1" ]

  then


    echo -e
    bash modules/opt1


fi



if [ "$options" = "2" ]

  then


    echo -e
    bash modules/opt2

fi



if [ "$options" = "3" ]

  then


    echo -e
    bash modules/opt3

fi


if [ "$options" = "4" ]

  then


    echo -e
    bash modules/opt4


fi


if [ "$options" = "5" ]

  then


    echo -e
    bash modules/opt5


fi


if [ "$options" = "6" ]

  then


    echo -e
    bash modules/opt6


fi


if [ "$options" = "7" ]

  then


    echo -e
    bash modules/opt7


fi


if [ "$options" = "8" ]

  then


    echo -e
    bash modules/opt8


fi

if [ "$options" = "9" ]

  then


    echo -e
    bash modules/opt9


fi


if [ "$options" = "10" ]

  then


    echo -e
    bash modules/opt10


fi


if [ "$options" = "11" ]

  then


    echo -e
    bash modules/opt11


fi


if [ "$options" = "12" ]

  then


    echo -e
    bash modules/opt12


fi


if [ "$options" = "13" ]

  then


    echo -e
    bash modules/opt13


fi

if [ "$options" = "14" ]

  then


    echo -e
    bash modules/opt14


fi


if [ "$options" = "15" ]

  then


    echo -e
    bash modules/opt15


fi


if [ "$options" = "16" ]

  then


    echo -e
    bash modules/opt16


fi


if [ "$options" = "17" ]

  then


    echo -e
    bash modules/opt17


fi


if [ "$options" = "18" ]

  then


    echo -e
    bash modules/opt18


fi


if [ "$options" = "19" ]

  then


    echo -e
    bash modules/opt19


fi


if [ "$options" = "20" ]

  then


    echo -e
    bash modules/opt20


fi

if [ "$options" = "21" ]

  then


    echo -e
    bash modules/opt21


fi

if [ "$options" = "22" ]

  then


    echo -e
    bash modules/opt22


fi

if [ "$options" = "23" ]

  then


    echo -e
    bash modules/opt23


fi

if [ "$options" = "24" ]

  then


    echo -e
    bash modules/opt24


fi

if [ "$options" = "25" ]

  then


    echo -e
    clear && bash modules/funtion2.sh


fi

if [ "$options" = "26" ]

  then


    echo -e
    bash modules/opt26


fi

if [ "$options" = "27" ]

  then


    echo -e
    bash modules/opt27


fi

if [ "$options" = "28" ]

  then


    echo -e
    bash modules/opt28


fi

if [ "$options" = "29" ]

  then


    echo -e
    bash modules/opt29


fi

if [[ ($options = "A" || $options = "a") ]];
  then


    echo -e
    bash modules/about


fi

if [[ ($options = "E" || $options = "e") ]];

 then


  clear && echo -e "Exiting the ADB-Toolkit, Thanks for using."
  adb kill-server >/dev/null 2>&1 | echo -e "\nKilling previous running ADB Server."
  echo -e "\nDONE"
  exit


fi

#clear && bash modules/funtion.sh


#bug fix

#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

function takeScreenshot(){
    echo -e "\e[1;93mTaking screenshot '${FILENAME}'...\n\e[91m"
    adb -s $devv shell screencap -p /sdcard/${FILENAME}
	echo -e "\e[1;92mProcess complete.\n"
}

function pullScreenshot(){
    echo -e "\e[1;93mPulling screenshot '${FILENAME}' from device...\n\e[91m"    
    adb -s $devv  pull /sdcard/${FILENAME} screenshot/${FILENAME}
    echo -e "\n\e[1;92mProcess complete.\n"
}

function deleteScreenshotFromDevice(){
    echo -e "\e[1;93mDeleting screenshot '${FILENAME}' from device...\n\e[91m"
    adb -s $devv shell rm /sdcard/${FILENAME}
    echo -e "\e[1;92mProcess complete."
    exit 0
}

[[ $# -eq 1 ]] || { echo; }

for _ARGUMENT in "$@"
do
    case ${_ARGUMENT} in
        -h|--help)
        usage
        ;;
        *)
        if [[ ! ${_ARGUMENT} =~ ^.*png$ ]]; then
            FILENAME="${_ARGUMENT}.png"
        else
            FILENAME="${_ARGUMENT}"
        fi
        ;;
    esac
done

takeScreenshot
pullScreenshot
deleteScreenshotFromDevice 

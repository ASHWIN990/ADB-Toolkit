#!/bin/bash


set -euo pipefail
IFS=$'\n\t'

function usage(){
echo "test"
}

function checkIfFileExists(){
    if [ -f ${FILENAME} ]; then
        echo "\e[1;91m[ERROR] \e[1;93mThe recording you are trying to create already exists!"
        read -r -p $'\e[1;93mDo you want to overwrite this file? [y/N] ' RESPONSE
        RESPONSE=`echo ${RESPONSE}| awk '{print tolower($0)}'`
        if [[ (${RESPONSE} == "" || ${RESPONSE} == "n" || ${RESPONSE} == "no") ]];then
            exit 1
        fi
    fi
}

function takeScreenshot(){
	echo -e "\e[1;93mTaking screenshot '${FILENAME}'..."
    adb shell screencap -p /sdcard/${FILENAME}

	echo -e "\e[1;93mProcess complete."
}

function pullScreenshot(){
    echo -e "\e[1;93mDownloading screenshot '${FILENAME}'..."
    adb pull /sdcard/${FILENAME} screenshot/${FILENAME}

    echo -e "\e[1;93mProcess complete."
}

function deleteScreenshotFromDevice(){
    echo -e "\e[1;93mDeleting screenshot '${FILENAME}'..."
    adb shell rm /sdcard/${FILENAME}

    echo -e "\e[1;93mProcess complete."
    exit 0
}

[[ $# -eq 1 ]] || { usage; }

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

checkIfFileExists
takeScreenshot
pullScreenshot
deleteScreenshotFromDevice

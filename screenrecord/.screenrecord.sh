#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

function usage(){
    echo -e " "
    exit 1
}

function checkIfFileExists(){
    if [ -f ${FILENAME} ]; then
        echo -e "\e[1;91m[ERROR] \e[1;93mThe recording you are trying to create already exists!"
        read -r -p $'\e[1;93mDo you want to overwrite this file? [y/N] ' RESPONSE
        RESPONSE=`echo ${RESPONSE}| awk '{print tolower($0)}'`
        if [[ (${RESPONSE} == "" || ${RESPONSE} == "n" || ${RESPONSE} == "no") ]];then
            exit 1
        fi
    fi
}

function recordScreen(){
	echo -e "\e[1;92mRecording '${FILENAME}'..."
	adb shell screenrecord /sdcard/${FILENAME} &
	_PID=$!

	read -r -p $'\e[1;93mPress \e[1;91m[Enter] \e[1;93mto stop recording...'
	kill ${_PID}

	echo -e "\e[1;92mStopping recording..."
	while kill -0 "${_PID}"; do
        sleep 0.5
    done

	echo -e "\e[1;92mDownloading recording..."
	adb pull /sdcard/${FILENAME} screenrecord/${FILENAME}
	adb shell rm /sdcard/${FILENAME}

	echo -e "\e[1;92mProcess complete."
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
        if [[ ! ${_ARGUMENT} =~ ^.*mp4$ ]]; then
            FILENAME="${_ARGUMENT}.mp4"
        else
            FILENAME="${_ARGUMENT}"
        fi
        ;;
    esac
done

checkIfFileExists
recordScreen

#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

function recordScreen(){
	echo -e "\e[1;92mRecordingthe screen to '${FILENAME}'...\n\e[91m"
	adb shell screenrecord /sdcard/${FILENAME} &
	_PID=$!

	read -r -p $'\e[1;91mPress \e[1;91m[Enter] \e[1;93mto stop recording...'
	kill ${_PID} > /dev/null 2&>1

	echo -e "\n\e[1;92mStopping recording...\n"
    sleep 0.5

	echo -e "\e[1;92mPulling recording from device...\n\e[91m"
	adb pull /sdcard/${FILENAME} screenrecord/${FILENAME}
    echo -e "\n\e[1;92mProcess complete.\n"
	
    echo -e "\e[1;93mDeleting screenrecord '${FILENAME}' from device...\n\e[91m"
	adb shell rm /sdcard/${FILENAME}
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
        if [[ ! ${_ARGUMENT} =~ ^.*mp4$ ]]; then
            FILENAME="${_ARGUMENT}.mp4"
        else
            FILENAME="${_ARGUMENT}"
        fi
        ;;
    esac
done

recordScreen

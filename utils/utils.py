import adbutils
import os
from colorama import Fore, Back, Style
from datetime import datetime


def get_devices():
    try:
        adb = adbutils.adb
        devices = adb.device_list()
        if len(devices) == 0:
            raise Exception("No devices connected")
        else:
            return devices
    except Exception as e:
        print("Error: ", e)
        return []


def get_timestamp_filename(path, ext, no_abs=False):

    try:
        if not os.path.exists(path):
            raise Exception("Path not found")

        curr_datetime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')

        if no_abs:
            return curr_datetime+ext
        else:
            abspath = os.path.join(path, curr_datetime+ext)
            return abspath
    except Exception as e:
        printError(e)
        return ""


def get_process_pid(device, process_name):
    try:
        if device == None:
            raise Exception("No devices connected")
        if process_name == "":
            raise Exception("Process name is empty")

        device = adbutils.adb.device(device)
        pid = list(map(str, device.shell(f'pidof "{process_name}"').split()))
        return pid
    except Exception as e:
        printError(e)
        return ""

######## Print ########


def printError(e, end="\n"):
    print(f"{Style.BRIGHT} {Fore.RED} [Error] :{Style.RESET_ALL} {e}", end=end)


def printInfo(i, end="\n"):
    print(f"{Style.BRIGHT} {Fore.BLUE} [Info] :{Style.RESET_ALL} {i}", end=end)


def printWarning(w, end="\n"):
    print(
        f"{Style.BRIGHT} {Fore.YELLOW} [Warning] :{Style.RESET_ALL} {w}", end=end)


def printSuccess(s, end="\n"):
    print(
        f"{Style.BRIGHT} {Fore.GREEN} [Success] :{Style.RESET_ALL} : {s}", end=end)

######## Print ########

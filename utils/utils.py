import adbutils
from colorama import Fore, Back, Style


def get_devices():
    try:
        adb = adbutils.adb
        devices = []

        for device in adb.device_list():
            devices.append(device.serial)

        if len(devices) == 0:
            raise Exception("No devices connected")
        else:
            return devices
    except Exception as e:
        print("Error: ", e)
        return []


def printError(e, **kwargs):
    print(
        f"{Style.BRIGHT} {Fore.RED} [Error] :{Style.RESET_ALL} {e}", **kwargs)


def printInfo(i, **kwargs):
    print(
        f"{Style.BRIGHT} {Fore.BLUE} [Info] :{Style.RESET_ALL} {i}", **kwargs)


def printWarning(w, **kwargs):
    print(
        f"{Style.BRIGHT} {Fore.YELLOW} [Warning] :{Style.RESET_ALL} {w}", **kwargs)


def printSuccess(s, **kwargs):
    print(
        f"{Style.BRIGHT} {Fore.GREEN} [Success] :{Style.RESET_ALL} : {s}", **kwargs)

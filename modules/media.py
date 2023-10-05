#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from utils.utils import *
import adbutils
import os
from datetime import datetime
import time


def get_screenshot(device, path):

    try:
        if device == None:
            raise Exception("No devices connected")
        if not os.path.exists(path):
            raise Exception("Path not found")

        curr_datetime = datetime.now().strftime('%Y-%m-%d %H-%M-%S')
        abspath = os.path.join(path, curr_datetime+".png")

        device = adbutils.adb.device(device)

        if os.path.exists(abspath):
            os.remove(abspath)

        image = device.screenshot()
        image.save(abspath, format="PNG")

        return True, abspath

    except Exception as e:
        printError(e)
        return False, ""


def get_screenrecord(device, path, sec=0):

    try:
        if device == None:
            raise Exception("No devices connected")
        if not os.path.exists(path):
            raise Exception("Path not found")

        curr_datetime = datetime.now().strftime('%Y-%m-%d %H-%M-%S')
        abspath = os.path.join(path, curr_datetime+".mp4")

        device = adbutils.adb.device(device)

        if os.path.exists(abspath):
            os.remove(abspath)

        device.start_recording(abspath)

        if sec != 0:
            time.sleep(sec)
        if sec == 0:
            printInfo("Press Enter to stop recording...", end="")
            input()

        device.stop_recording()

        return True, abspath

    except Exception as e:
        printError(e)
        return False, ""

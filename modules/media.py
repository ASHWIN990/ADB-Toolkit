#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import adbutils
import os
import datetime

def get_screenshot(device, path):

    try:
        if device == None:
            raise Exception("No devices connected")
        if not os.path.exists(path):
            raise Exception("Path not found")

        curr_datetime = datetime.now().strftime('%Y-%m-%d %H-%M-%S')
        abspath = os.path.join(path, "ss"+curr_datetime+".png")

        device = adbutils.adb.device(device)

        if os.path.exists(abspath):
            os.remove(abspath)

        image = device.screenshot()
        image.save(abspath, format="PNG")

        return True, abspath

    except Exception as e:
        print("Error: ", e)
        return False, ""

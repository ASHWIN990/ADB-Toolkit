#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import threading
from utils.utils import *
import adbutils
import os
import time
import subprocess


class Media:

    SCREENRECORD_TIME = 180
    SCREENRECORD_TIME_LEFT = SCREENRECORD_TIME
    IS_RECORDING = False

    def __init__(self, device):
        self.device = adbutils.adb.device(device)

    def show(self):
        print(self.device)

    def screenshot(self, path):

        try:
            if self.device == None:
                raise Exception("No devices connected")
            if not os.path.exists(path):
                raise Exception("Path not found")

            abspath = get_timestamp_filename(path, ".png")

            if os.path.exists(abspath):
                os.remove(abspath)

            image = self.device.screenshot()
            image.save(abspath, format="PNG")

            return True, abspath

        except Exception as e:
            printError(e)
            return False, ""

    def __get_user_input__(self, user_input_ref):
        printInfo("Press Enter to stop recording...")
        user_input_ref[0] = input()

    def screenrecord(self, path, show_progress=True):

        # Declare a mutable object so that it can be pass via reference
        user_input = [None]

        try:
            if self.device == None:
                raise Exception("No devices connected")
            if not os.path.exists(path):
                raise Exception("Path not found")

            abspath = get_timestamp_filename(path, ".mp4")
            abspath_dev = (f"/sdcard/{os.path.basename(abspath)}")

            if os.path.exists(abspath):
                os.remove(abspath)

            _ = self.device.shell(
                f"screenrecord --time-limit {self.SCREENRECORD_TIME} {abspath_dev}", stream=True)
            self.IS_RECORDING = True

            pid = get_process_pid(self.device.serial, f"screenrecord")

            if pid == "":
                raise Exception("Screenrecord PID not found")

            user_input_thread = threading.Thread(
                target=self.__get_user_input__, args=(user_input,))
            user_input_thread.daemon = True
            user_input_thread.start()

            for increment in range(180):
                self.SCREENRECORD_TIME_LEFT = 180-increment

                if show_progress:
                    printInfo(
                        f"Recording left {self.SCREENRECORD_TIME_LEFT} seconds", end=" \r")

                time.sleep(1)
                if user_input[0] is not None:
                    self.device.shell(f"kill -2 {' '.join(pid)}")
                    if not self.device.sync.exists(abspath_dev):
                        raise Exception("Screenrecord file not found")
                    break

            self.IS_RECORDING = False

            subprocess.run(
                f"ffplay -framerate 60 -framedrop -bufsize 16M {abspath} -autoexit -hide_banner -loglevel panic", capture_output=True, shell=True, check=True)

            self.device.sync.pull(abspath_dev, abspath)
            self.device.remove(abspath_dev)
            return True, abspath

        except KeyboardInterrupt:
            if self.IS_RECORDING:
                printInfo("Stopping screenrecord...")
                printInfo(pid)
                self.device.shell(f"kill -2 {' '.join(pid)}")
                if not self.device.sync.exists(abspath_dev):
                    raise Exception("Screenrecord file not found")
                self.device.remove(abspath_dev)

        except Exception as e:
            printError(e)
            return False, ""

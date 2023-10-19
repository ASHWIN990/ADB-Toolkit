#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from utils.utils import *

class system:

    def __init__(self, device):
        self.device = adbutils.adb.device(device)
        
    def reboot(self):
        try:
            if self.device == None:
                raise Exception("No devices connected")
            self.device.shell("reboot")
            return True
        except Exception as e:
            printError(e)
            return False
    
    def reboot_bootloader(self):
        try:
            if self.device == None:
                raise Exception("No devices connected")
            self.device.shell("reboot bootloader")
            return True
        except Exception as e:
            printError(e)
            return False
        
    def reboot_recovery(self):
        try:
            if self.device == None:
                raise Exception("No devices connected")
            self.device.shell("reboot recovery")
            return True
        except Exception as e:
            printError(e)
            return False

    def get_shell(self, cmd):
        try:
            if self.device == None:
                raise Exception("No devices connected")
            os.system(f"adb -s {self.device.serial} shell")
        except Exception as e:
            printError(e)

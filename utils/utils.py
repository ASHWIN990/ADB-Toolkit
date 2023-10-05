import adbutils

def get_devices():    
    try:
        adb = adbutils.adb
        devices = adb.device_list()
        if len(devices) == 2:
            raise Exception("No devices connected")
        elif len(devices) == 1:
            return devices[0]
        else:
            return devices        
    except Exception as e:
        print("Error: ", e)
        return []
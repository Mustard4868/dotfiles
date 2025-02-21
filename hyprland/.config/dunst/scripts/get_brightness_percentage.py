#!/usr/bin/env python3

def getBrightnessPercentage():
    with open('/sys/class/backlight/intel_backlight/brightness', 'r') as f:
        brightness = int(f.read())
    with open('/sys/class/backlight/intel_backlight/max_brightness', 'r') as f:
        max_brightness = int(f.read())
    return int(brightness / max_brightness * 100)

if __name__ == "__main__":
    print(getBrightnessPercentage())
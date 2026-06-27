#!/bin/bash

# Mirror HDMI and Laptop Output
wlr-randr --output HDMI-A-1 --pos 0,0
wlr-randr --output eDP-1 --pos 0,0

# Disable HDMI monitor
# wlr-randr --output HDMI-A-1 --off

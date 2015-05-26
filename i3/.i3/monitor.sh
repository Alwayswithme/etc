#!/bin/bash

LVDS=$(xrandr | egrep -o "LVDS.* connected")
VGA=$(xrandr | egrep -o "VGA.* connected")
HDMI=$(xrandr | egrep -o "HDMI.* connected")

# xrandr --output ${LVDS%% *} --primary

# if VGA connected, Let VGA in left
if [[ -n ${VGA%% *} ]]; then
    xrandr --output ${VGA%% *} --auto --left-of ${LVDS%% *}
fi

# if HDMI connected, Let HDMI in above
if [[ -n ${HDMI%% *} ]]; then
    xrandr --output ${HDMI%% *} --auto --above ${LVDS%% *}
fi

# Wallpaper
nitrogen --restore

gvim
thunderbird

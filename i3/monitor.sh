#!/bin/bash

LVDS=$(xrandr | egrep -o "LVDS.* connected")
VGA=$(xrandr | egrep -o "VGA.* connected")

# xrandr --output ${LVDS%% *} --primary

# if VGA connected, Let VGA in left
if [[ -n ${VGA%% *} ]]; then
    xrandr --output ${VGA%% *} --auto --left-of ${LVDS%% *}
fi

# Wallpaper
nitrogen --restore

gvim
thunderbird

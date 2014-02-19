#! /bin/bash

# install command
in='yum --downloaddir=/tmp install'

# downloader
${in} ktorrent kdeartwork-kxs transmission-qt
${in} ktouch typespeed

${in} net-tools bsdtar

# Eclipse IDE
${in} eclipse eclipse-color-theme eclipse-nls-zh eclipse-vrapper

# Video Acceleration
${in} libva-intel-driver
gstreamer1-vaapi libvdpau-va-gl

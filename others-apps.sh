#! /bin/bash

# install command
in='yum --downloaddir=/tmp install'

# downloader
${in} ktorrent kdeartwork-kxs transmission-qt wget
${in} ktouch typespeed

${in} net-tools bsdtar

# Eclipse IDE
${in} eclipse eclipse-color-theme eclipse-nls-zh eclipse-vrapper

# Video Acceleration
${in} libva-intel-driver gstreamer1-vaapi libvdpau-va-gl

# Ruby
${in} ruby ruby-devel

# VM
${in} VirtuaBox kmod-VirtualBox

# tilling wm
${in} rxvt-unicode-256color-ml feh i3status i3

# theme
${in} elementary-icon-theme grebird-gtk{2,3}-theme

# gimp
${in} gimp gimp-help-zh_CN

# office
${in} libreoffice-{kde,calc,writer}

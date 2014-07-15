#! /bin/bash
#
# fedora kde setup script
#


# 添加rpmfusion源
`echo free | awk '{printf("yum --downloaddir=/tmp localinstall --nogpgcheck \
		http://download1.rpmfusion.org/%1$s/fedora/rpmfusion-%1$s-release-20.noarch.rpm"), $1}'`
`echo nonfree | awk '{printf("yum --downloaddir=/tmp localinstall --nogpgcheck \
		http://download1.rpmfusion.org/%1$s/fedora/rpmfusion-%1$s-release-20.noarch.rpm"), $1}'`
# 避免下载的包写入硬盘
#
# 顺便把下面这行注释的命令写入/etc/bashrc
echo "alias yum='yum --downloaddir=/tmp'" >> /etc/bashrc


# install command
in='yum --downloaddir=/tmp install'


# Xorg and dirvers
${in} xorg-x11-drv-evdev xorg-x11-drv-keyboard xorg-x11-drv-synaptics \
    xorg-x11-drv-mouse xorg-x11-drv-intel xorg-x11-drv-vesa \
    llvm xorg-x11-glamor


# KDE
${in} kde-runtime kde-workspace kcolorchooser kdm kscreen kcm-gtk kcm_touchpad \
    kdeplasma-addons k3b


# pulseaudio
${in} pulseaudio pulseaudio-module-x11 kde-settings-pulseaudio kmix


# radio devices
${in} kde-plasma-networkmanagement bluedevil bluez-cups iwl2030-firmware mesa-dri-drivers


# applications
${in} gwenview ark vlc firefox okular yakuake kamoso ksnapshot \
    ksysguard kcharselect kcalc


# themes, fonts etc.
${in} wqy-microhei-fonts cjkuni-uming-fonts dejavu-s*fonts heisenbug-kde-theme \
    kde-l10n-Chinese kde-i18n-Chinese oxygen-gtk plymouth-theme-charge \
    aajohan-comfortaa-fonts


# admin
${in} sudo efibootmgr setuptool smartmontools symlinks pm-utils \
    deltarpm net-tools


# editor and toolchain
${in} vim-X11 git kwrite


# 输入法
${in} fcitx-qt4 fcitx-configtool kcm-fcitx fcitx-cloudpinyin plasma-applet-kimpanel


# 各种工具
${in} tar unrar p7zip openssh-server bash-completion usbutils lm_sensors powertop \
    deltarpm yum-utils


# codec
${in} gstreamer-plugins-{good,ugly} gstreamer-ffmpeg gstreamer-plugins-bad-{free,nonfree} \
    ffmpeg


# 字体渲染
yum --downloaddir=/tmp localinstall  http://www.infinality.net/fedora/linux/infinality-repo-1.0-1.noarch.rpm
${in}  freetype-infinality fontconfig-infinality


# 电源管理
${in} tuned hdparm kernel-tools
systemctl enable tuned.service && systemctl start tuned.service
tuned-adm profile powersave
powertop --auto-tune


#cpupower frequency-set -u 1.2G


# 显卡驱动
${in} gcc kernel-devel kernel-headers

# download site:http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx
# aticonfig --initial && aticonfig --px-igpu


# java
${in} java-1.7.0-openjdk-src


# 编辑可改变渲染风格
#    /etc/profile.d/infinality-settings.sh
#    /etc/fonts/infinality/infinality.conf
# . /etc/profile.d/infinality-settings.sh


# 改变运行级别
# ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target



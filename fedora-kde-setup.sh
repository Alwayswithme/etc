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
# 顺便把下面这行注释的命令写入/etc/bashrc
echo "alias yum='yum --downloaddir=/tmp'" >> /etc/bashrc

# 安装命令
in='yum --downloaddir=/tmp install'

# 装X
${in} xorg-x11-drv-evdev xorg-x11-drv-keyboard xorg-x11-drv-synaptics \
    xorg-x11-drv-mouse xorg-x11-drv-intel xorg-x11-drv-ati \
    xorg-x11-drv-vesa xorg-x11-drv-fbdev xorg-x11-drv-modesetting xorg-x11-xinit-session


# 装KDE
${in} kde-runtime konsole kde-workspace kcolorchooser kdm \
    kscreen dolphin ksysguard kcm-gtk kcm_touchpad

# 声音
${in} pulseaudio pulseaudio-module-x11 kde-settings-pulseaudio kmix
      

# 蓝牙无线
${in} kde-plasma-networkmanagement yakuake bluedevil bluez-cups \
	iwl2030-firmware mesa-dri-drivers

# 日常应用
${in} gwenview ark k3b vlc firefox okular kamoso kruler \
    ktorrent kcalc ksnapshot kolourpaint \
    kmail clementine kate kcharselect

# 装主题图标字体语言
${in} freetype-freeworld wqy-microhei-fonts dejavu-s*fonts \
    kde-l10n-Chinese kde-i18n-Chinese oxygen-gtk plymouth-theme-charge \
    heisenbug-kde-theme

# 管理
${in} sudo efibootmgr setuptool smartmontools symlinks pm-utils


# 开发工具
${in} vim git


# 输入法
${in} fcitx-sunpinyin fcitx-qt4 sunpinyin-data fcitx-configtool \
    kcm-fcitx fcitx-cloudpinyin plasma-applet-kimpanel


# 各种工具
${in} p7zip openssh-server bash-completion usbutils lm_sensors kernel-tools


# 解码器
${in} gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer-plugins-good \
    gstreamer-plugins-bad*
    

# change run level
ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target

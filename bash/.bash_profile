# .bash_profile
# ================================================
# Bash Login File
# ================================================
enLocale=en_US.UTF-8
if [ -z "$DISPLAY" ]; then
    export LANG=$enLocale
    export LC_TIME=$enLocale
    export LANGUAGE=en
fi
export LC_COLLATE=C

if [ -e /usr/share/terminfo/x/xterm-256color ];then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# 2, Shell prompt - Bash
# export PS1='\[\033[01;32m\]`basename ${SHELL}` \h@\u: \[\033[01;34m\] \w [\!]\$\[\033[00m\] '

# 3, File creation mask

# 4, Terminal settings (for remote host only)

# 5, Display welcome message
echo "Welcom $(whoami)"
echo "Today is `date`"
echo

# 6, System information
echo "Current users: `users`"
echo "System Uptime:"
uptime

# 7, Environment file - Bash
if [ -f  ${HOME}/.bashrc ]
then source ${HOME}/.bashrc
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


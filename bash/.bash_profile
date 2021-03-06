# .bash_profile
# ================================================
# Bash Login File
# ================================================
enLocale=en_US.UTF-8
zhLocale=zh_CN.UTF-8
if [ -z "$DISPLAY" ]; then
    export LANG=$enLocale
    export LC_TIME=$enLocale
    export LANGUAGE=en
else
    export LANG=$enLocale
    export LC_TIME="$enLocale"
fi
export LC_COLLATE=C

# if [ -e /usr/share/terminfo/x/xterm-256color ];then
#     export TERM='xterm-256color'
# else
#     export TERM='xterm-color'
# fi

# 2, Shell prompt - Bash
export PS1='\[\033[01;32m\]`basename ${SHELL}` \h@\u: \[\033[01;34m\] \w [\!]\$\[\033[00m\] '

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
HISTSIZE=10000
HISTFILESIZE=20000
# Turn on parallel history
shopt -s histappend
history -a
# Turn on checkwinsize
shopt -s checkwinsize

# User specific environment and startup programs
PATH=$PATH:$HOME/bin

export PATH

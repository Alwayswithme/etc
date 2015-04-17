# .bashrc
# =======================================
# Bash environment file
# =======================================

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# TERM=xterm-256color
set_prompt () {
    local Last_Command=$? # Must come first!

    local Yellow='\e[0;33m'       # Yellow
    local Purple='\e[0;35m'       # Purple
    local Cyan='\[\e[01;36m\]'         # Cyan
    local Blue='\[\e[01;34m\]'
    local White='\[\e[01;37m\]'
    local Red='\[\e[01;31m\]'
    local Green='\[\e[01;32m\]'
    local Reset='\[\e[00m\]'
    local FancyX='\342\234\227'
    local Checkmark='\342\234\223'

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi

    # Add command number
    PS1="${Cyan}No.\! "
    # Working directory
    PS1+="${White}${PWD/#$HOME/~} "
    # Git promt
    PS1+='$(__git_ps1 "(%s)" )'
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\u "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\$ $Reset"
}
PROMPT_COMMAND='set_prompt'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# tomcat path
CATALINA_HOME=/usr/share/tomcat7
CATALINA_BASE=/var/lib/tomcat7
export CATALINA_HOME
export CATALINA_BASE

# java and maven
# JAVA_HOME=/home/phoenix/jdk1.6.0_29
# export JAVA_HOME
# export PATH=$JAVA_HOME/bin:$PATH
# M2_HOME=/home/phoenix/apache-maven-3.2.2 export M2_HOME
# M2=$M2_HOME/bin
# 
# Android
ANDROID_HOME=/home/phoenix/dev/android/android-sdk-linux
export PATH=$M2:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# shell editor
export EDITOR=/usr/bin/vim
export FCEDIT=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PAGER=less

# 1, Shell options
shopt -s extglob hostcomplete gnu_errfmt

set -o vi
set -o noclobber
set -o notify
# set -o xtrace
# set -o verbose

for file in /etc/bash_completion.d/* ; do
    source "$file"
done

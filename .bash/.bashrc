# .bashrc
# =======================================
# Bash environment file
# =======================================
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\!]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1='\[\033[01;35m\]No.\!\[\033[01;32m\] \u\[\e[02;38m\] \w \[\033[01;34m\]\$\[\e[00m\] '
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
export EDITOR=vim

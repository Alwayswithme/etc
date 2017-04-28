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
if [ "$COLORTERM" == "xfce4-terminal" ] ; then
    export TERM=xterm-256color
fi
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
# PROMPT_COMMAND='set_prompt'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# java and maven
# JAVA_HOME=/home/phoenix/jdk1.6.0_29
# export JAVA_HOME
# export PATH=$JAVA_HOME/bin:$PATH
# M2_HOME=/home/phoenix/apache-maven-3.2.2 export M2_HOME
# M2=$M2_HOME/bin
# 
# Android
# ANDROID_HOME=$HOME/dev/android/android-sdk-linux
# export PATH=$M2:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# shell editor
export EDITOR=/usr/bin/vim
export FCEDIT=/usr/bin/vim
export VISUAL=/usr/bin/gvim
export PAGER=less

# 1, Shell options
shopt -s extglob hostcomplete gnu_errfmt

set -o vi
set -o noclobber
set -o notify
# set -o xtrace
# set -o verbose

# auto completion
completion_dir=/usr/share/bash-completion
for file in ${completion_dir}/completions/git \
    ${completion_dir}/bash_completion \
    /usr/share/git/completion/git-prompt.sh
do
    source "$file"
done

alias a=alias
alias c=clear
alias d=date
alias f='free -h'
alias r='fc -s'
alias h=history
# some more ls aliases
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -a'
alias del='fc -s ls=rm'
alias td='tidy -indent -quiet -wrap 72'
alias vi='gvim -v'
alias pt='sudo powertop --auto-tune'

###############################
# pkg management
###############################

# Arch
     alias pl="sudo pacman -Sy"                           #update sourcelist
     alias pu="sudo pacman -Su"                           #upgrade package
     alias pi="sudo pacman -S"                            #install
     alias pr="sudo pacman -R"                            #remove
#     alias yar="sudo yum autoremove"                     #remove package no longer need
     alias ps='pacman -Ss'
#     alias yum='sudo yum --downloaddir=/tmp'

# Fedora
#     alias yd="sudo yum check-update"                    #update sourcelist
#     alias yg="sudo yum --downloaddir=/tmp update"       #upgrade package
#     alias yi="sudo yum --downloaddir=/tmp install"      #install
#     alias yr="sudo yum remove"                          #remove
#     alias yar="sudo yum autoremove"                     #remove package no longer need
#     alias ys='yum search'
#     alias yum='sudo yum --downloaddir=/tmp'

# turn off screen
alias scoff="sleep 3 && xset dpms force off"
# clean package and configfile
# alias cleanrc='dpkg -l |grep ^rc|awk "{print \$2}"|sudo xargs dpkg -P'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

###############################
# git
###############################
alias gp="git push origin master"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -a"

source ~/.shell_promt.sh

# .bashrc
# =======================================
# Bash environment file
# =======================================
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# 1, Environment variables
# User specific environment and startup programs
PATH=$PATH:$HOME/bin

export PATH
# tomcat path
CATALINA_HOME=/usr/share/tomcat7
CATALINA_BASE=/var/lib/tomcat7
export CATALINA_HOME
export CATALINA_BASE
# java path
export CLASSPATH=.:${HOME}/Java:$CATALINA_HOME/lib/servlet-api.jar:./classes:./bin:./lib
# vim java complete 
VJAVA=${HOME}/.vim:${HOME}/.vim/autoload/
# add dom4j & mysql
MYSQL_CONNECT=${JAVA_HOME}/lib/mysql-connector.jar
DOM4J=/usr/share/java/dom4j.jar
export CLASSPATH=${CLASSPATH}:${MYSQL_CONNECT}:${DOM4J}:$VJAVA

# input method
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# fcitx -d

export EDITOR=vim
export PAGER=less

# 1, Shell options
shopt -s extglob hostcomplete gnu_errfmt

set -o vi
set -o noclobber
set -o notify
# set -o xtrace
# set -o verbose

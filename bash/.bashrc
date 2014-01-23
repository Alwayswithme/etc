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

if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\!]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1='\[\e[0;36m\]No.\!\[\e[02;38m\] \w \[\033[01;34m\]\$\[\e[00m\] '
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


export EDITOR=vim
export PAGER=less

# 1, Shell options
shopt -s extglob hostcomplete gnu_errfmt

set -o vi
set -o noclobber
set -o notify
# set -o xtrace
# set -o verbose

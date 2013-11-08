# .bash_profile
# ================================================
# Bash Login File
# ================================================

# 1, Environment variables
#tomcat path
CATALINA_HOME=/usr/share/tomcat7
CATALINA_BASE=/var/lib/tomcat7
export CATALINA_HOME
export CATALINA_BASE
#java path
export CLASSPATH=.:${HOME}/Java:$CATALINA_HOME/lib/servlet-api.jar:./classes:./bin:./lib
#vim java complete 
VJAVA=${HOME}/.vim:${HOME}/.vim/autoload/
#add dom4j & mysql
MYSQL_CONNECT=${JAVA_HOME}/lib/mysql-connector.jar
DOM4J=/usr/share/java/dom4j.jar
export CLASSPATH=${CLASSPATH}:${MYSQL_CONNECT}:${DOM4J}:$VJAVA

#input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx -d
#build path
export spec=${HOME}/rpmbuild/SPECS
export install=${HOME}/rpmbuild/RPMS/x86_64

export PAGER=less

if [ -z "$DISPLAY" ]; then
    export LANG=en_US.UTF-8
fi
export LC_COLLATE=C

if [ -e /usr/share/terminfo/x/xterm-256color ];then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# 2, Shell prompt - Bash
#export PS1='\[\033[01;32m\]`basename ${SHELL}` \h@\u: \[\033[01;34m\] \w [\!]\$\[\033[00m\] '

# 3, File creation mask

# 4, Terminal settings (for remote host only)

# 5, Display welcome message
echo "Welcom Phoenix"
echo "Today is `date`"
echo

# 6, System information
echo "Current users: `users`"
echo "System Uptime:";uptime

# 7, Environment file - Bash
if [ -f  ${HOME}/.bashrc ]
then source ${HOME}/.bashrc
fi

# 1, Shell options
set -o noclobber
set -o notify

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


alias a=alias
alias c=clear
alias d=date
alias f='free -h'
alias r='fc -s'
alias l='ls -CF'
alias h=history
# some more ls aliases
alias ll='ls -l'
alias la='ls -a'


alias del='fc -s ls=rm'
alias aud="echo "q"|sudo -S apt-get  update"        #update sourcelist
alias aug="sudo apt-get upgrade"       #upgrade package
alias ain="sudo apt-get install"       #install
alias arm="echo "q"|sudo -S apt-get  remove"        #remove
alias aar="echo "q"|sudo -S apt-get autoremove"    #remove package no longer need
alias aac="echo "q"|sudo -S apt-get -y autoclean"     #clean package useless
alias acs='apt-cache search'
alias ug='sudo update-grub'
alias td='tidy -indent -quiet -wrap 72'

#turn off screen
alias scoff="sleep 3 && xset dpms force off"
#clean package and configfile
alias cleanrc='dpkg -l |grep ^rc|awk "{print \$2}"|sudo xargs dpkg -P'

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

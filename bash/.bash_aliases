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
# fedora pkg management
###############################

    alias yd="sudo yum check-update"                    #update sourcelist
    alias yg="sudo yum --downloaddir=/tmp update"       #upgrade package
    alias yi="sudo yum --downloaddir=/tmp install"      #install
    alias yr="sudo yum remove"                          #remove
    alias yar="sudo yum autoremove"                     #remove package no longer need
    alias ys='yum search'
    alias yum='sudo yum --downloaddir=/tmp'

###############################
# ubuntu/debian pkg management
###############################

    alias agud="echo "q"|sudo -S apt-get update"        #update sourcelist
    alias agug="sudo apt-get upgrade"       #upgrade package
    alias ai="sudo apt-get install"       #install
    alias ar="echo "q"|sudo -S apt-get  remove"        #remove
    alias ar="echo "q"|sudo -S apt-get autoremove"    #remove package no longer need
    alias as='apt-cache search'

# turn off screen
alias scoff="sleep 3 && xset dpms force off"
# clean package and configfile
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

###############################
# git
###############################
alias gp="git push origin master; git push china master"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -a"

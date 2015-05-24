#! /bin/bash
cd `dirname $0`
cd ${HOME}

# these file is symlink, recreate them
# [ -h .bashrc ] && rm .bashrc && ln -ns ${OLDPWD}/.bashrc
# [ -h .bash_profile ] && rm .bash_profile && ln -ns ${OLDPWD}/.bash_profile
# [ -h .bash_aliases ] && rm .bash_aliases && ln -ns ${OLDPWD}/.bash_aliases
# not a symlink, tell user to backup or dosomething
function error() {
  echo "$@" 1>&2
}
function trylink() {
  if test -h $1
  then
    rm $1 && ln -ns $2/$1
  elif test ! -e $1
  then
    ln -ns $2/$1
  else
    error "file exist, not a symlink"
  fi
}
trylink .bashrc ${OLDPWD}
trylink .bash_profile ${OLDPWD}

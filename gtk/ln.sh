#! /bin/bash
cd `dirname $0`
cd ${HOME}
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
GTKDIR=${OLDPWD}
trylink .gtkrc-2.0 ${GTKDIR}

cd .config/gtk-3.0
trylink settings.ini ${GTKDIR}

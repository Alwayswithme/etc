#! /bin/bash
cd `dirname $0`
cd ${HOME}/.config
function error() {
  echo "$@" 1>&2
}
function trylink() {
  if test -h ${1##*/}
  then
    rm ${1##*/} && ln -ns $1
  elif test ! -e ${1##*/}
  then
    ln -ns $1
  else
    error "file exist, not a symlink"
  fi
}
trylink ${OLDPWD}

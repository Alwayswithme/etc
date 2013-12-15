#! /bin/bash
cd ${HOME}
rm .vimrc
rm -r .vim
ln -ns ${OLDPWD}/.vimrc
ln -ns ${OLDPWD}/.vim

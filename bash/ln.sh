#! /bin/bash
cd ${HOME}
rm .bashrc 
rm .bash_profile 
rm .bash_aliases
ln -ns ${OLDPWD}/.bashrc
ln -ns ${OLDPWD}/.bash_profile 
ln -ns ${OLDPWD}/.bash_aliases

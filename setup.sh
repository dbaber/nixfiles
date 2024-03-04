#!/bin/sh

set -x

# Synlink conf files if they don't exist
NIXFILES=${HOME}/src/nixfiles
CONFS="inputrc psqlrc vimrc dot_vim profile bashrc bash_aliases bash_cadillac"

for CONF in $CONFS; do
  LINK=$(echo $CONF | sed 's/^dot_/./g' | sed '/^\./! s/^/./g')

  if [ ! -e "$(readlink "$HOME/${LINK}")" ]; then
    ln -s $NIXFILES/${CONF} "$HOME/${LINK}"
  fi
done

# Setup scripts
# TODO

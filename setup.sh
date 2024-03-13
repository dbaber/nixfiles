#!/bin/sh

set -euo pipefail

# Synlink conf files if they don't exist
NIXFILES="${HOME}/src/nixfiles"
CONFS=" \
	bash_aliases \
	bash_cadillac \
	bashrc \
	inputrc \
	profile \
	psqlrc \
	vim \
	vimrc \
"
for CONF in $CONFS; do
  #LINK=$(echo $CONF | sed 's/^dot_/./g' | sed '/^\./! s/^/./g')
  LINK=$(echo $CONF | sed '/^\./! s/^/./g')

  #if [ ! -e "$(readlink "$HOME/${LINK}")" ]; then
  ln -sfvh $NIXFILES/${CONF} "$HOME/${LINK}"
  #fi
done

# Setup scripts
# TODO: Add scripts, then copy them into place

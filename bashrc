# ~/.bashrc: executed by bash(1) for non-login shells.  # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#case $- in
#    *i*) ;;
#      *) return;;
#esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable colors globally (Macos only?)
export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
export LSCOLORS=ExFxBxDxCxegedabagacad

# Tell grep to highlight matches
#export GREP_OPTIONS='--color=auto'
alias ggrep='ggrep --color=auto'
alias grep='ggrep --color=auto'

# Use GNU Sed
alias sed='gsed'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Perlbrew alias helper that relinks the proper 'dev' lib
# TODO: Make this a bit more automatic based on Perl version?
#       Make a whole set of perlbrew helper funcions that we can source in and use in ~/.bashrc?
pb_dev() {
	#set -x
	dev_env=$1

	if [ "$dev_env" = "dev" ]; then
		ln -sfn $HOME/.perlbrew/libs/perl-5.12.4@dev $HOME/src/dev
    elif [ "$dev_env" = "dev2" ]; then
		ln -sfn $HOME/.perlbrew/libs/perl-5.24.0@dev $HOME/src/dev
    elif [ "$dev_env" = "latest" ]; then
		ln -sfn $HOME/.perlbrew/libs/perl-5.36.1@dev $HOME/src/dev
	else
		echo "Perlbrew dev env '${dev_env}' invalid." >&2
		return 1
	fi
	#set +x
}

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###### START HERE ######

set -o vi

export PATH="$HOME/bin:$HOME/.docker/bin:$PATH"

# Enable shell alises even for non-interactive shells
shopt -s expand_aliases

# Cadillac command bash completion
if [ -f ~/.bash_cadillac ]; then
    . ~/.bash_cadillac
fi

# Git bash completion form Homebrew
[ -r "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Local bash completion
#for bcfile in ~/.bash_completion.d/* ; do
#  [ -f "$bcfile" ] && . $bcfile
#done

# Homebrew bash completion files
#for bcfile in /usr/local/etc/bash_completion.d/* ; do
#  [ -f "$bcfile" ] && . $bcfile
#done

## Docker completion
#if [ -f /etc/bash_completion.d/docker ]; then
#    . /etc/bash_completion.d/docker
#fi

## Docker compose completion
#if [ -f /etc/bash_completion.d/docker-compose ]; then
#    . /etc/bash_completion.d/docker-compose
#fi

# Perlbrew ENV variables
#if [ -f /opt/perlbrew/etc/bashrc ]; then
#	. /opt/perlbrew/etc/bashrc
#fi

# Perlbrew ENV variables
if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
	. $HOME/perl5/perlbrew/etc/bashrc
fi

export EDITOR=vim
export BASH_ENV=~/.bashrc

#export PATH=$HOME/src/cadillac/bin:$PATH
#export PATH="$HOME/.local/bin:$PATH:$HOME/src/scripts:$HOME/src/dev/bin"; # linux only
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$HOME/src/scripts:$PATH"

# Graham's Git Stuff
#if [ -f ~/.bashrc-git ]; then
#	. ~/.bashrc-git
#fi

# Aaron Stave's Git Stuff
#if [ -f ~/.bashrc-astaves-git ]; then
#	. ~/.bashrc-astaves-git
#fi

# Bash Git Prompt: https://github.com/magicmonty/bash-git-prompt
if [ -f ~/src/.bash-git-prompt/gitprompt.sh ]; then
	# Set config variables first
	GIT_PROMPT_ONLY_IN_REPO=1

	# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

	# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch

	# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

	# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
	GIT_PROMPT_START=$PS1    # uncomment for custom prompt start sequence
	# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

	# as last entry source the gitprompt script
	# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
	# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
	.  ~/src/.bash-git-prompt/gitprompt.sh
fi

#if [ -f ~/.Xmodmap ]; then
#    xmodmap ~/.Xmodmap
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#if [ -f $HOME/src/scripts/wproxy_env.sh ]; then
#	. $HOME/src/scripts/wproxy_env.sh
#fi

#function pg { srv=$1; shift; PGSERVICE=$srv psql "$@"; }
pg() { srv=$1; shift; PAGER='less -S' psql service=$srv "$@"; }

complete -C /usr/local/bin/terraform terraform

if [ -f ~/.vim/pack/plugins/start/vim-swagger-preview/.zshenv ]; then
	. ~/.vim/pack/plugins/start/vim-swagger-preview/.zshenv
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
#export FZF_DEFAULT_OPTS='-m --no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_DEFAULT_CRTL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_CRTL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_DEFAULT_ALT_C_COMMAND="fd --type d . --color=never --hidden"
export FZF_DEFAULT_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# >>>> Vagrant command completion (start)
#. /opt/vagrant/embedded/gems/gems/vagrant-2.3.6/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)

# Shove ssh keys into MacOS Keychain for now
#eval $(ssh-agent -s)
#ssh-add -K ~/.ssh/id_rsa &>/dev/null
#ssh-add -K ~/.ssh/id_rsa_lenderx &>/dev/null
ssh-add -K ~/.ssh/id_ed25519 &>/dev/null

# chruby - Homebrew on MacOS
source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

#RUBIES+=(
#/usr/local/Cellar/ruby/3.2.2
#)

# Terraspace command completion
#source /Users/dbaber/.gem/ruby/3.2.2/gems/terraspace-2.2.4/lib/terraspace/cli/completer/script.sh

# Ruby irb - Turn off autocomplete
export IRB_USE_AUTOCOMPLETE=false

# XXX: Got my MacBook keyboard repaired but in case I ever want to remember how to remap keys:
# Remap capslock to 'n' key
#hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000011}]}' >/dev/null 2>&1

# Created by `pipx` on 2024-02-10 15:34:43
export PATH="$PATH:$HOME/.local/bin"
eval "$(register-python-argcomplete pipx)"

# Dracula
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

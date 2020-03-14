# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u@\h\[\033[00m\]:\[\033[01;30m\]\w\[\033[00m\]\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Randomized wallpaper in each new terminal opening
feh --random --bg-max /home/kyam/Pictures/Wallpapers/*

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


#########################################
###   Personal aliases and functions  ###
#########################################

alias ..='cd ..'
alias vi='vim'
alias c='if [ $(($RANDOM % 10)) == 8 ]; then timeout 3 cmatrix; clear
            elif [ $(($RANDOM % 10)) == 2 ]; then timeout 5 cbeams -o; clear
            else clear
         fi'

#########################################
###   Defining software initiation    ###
#########################################

alias gmx514='source $HOME/Programs/gromacs-5.1.4/install/bin/GMXRC'
alias gmx2018='source $HOME/Programs/gromacs-2018.8/install/bin/GMXRC'
alias gmx2019='source $HOME/Programs/gromacs-2019.4/install/bin/GMXRC'
alias pypolybuilder='python $HOME/Documents/Labmmol/pyPolyBuilder/pypolybuilder/pypolybuilder/__main__.py'
alias dendridocker='python3 $HOME/Documents/Labmmol/Dendrimer/dendriDocker/__main__.py'

mopac(){
    export MOPAC_LICENSE='$HOME/Programs/MOPAC2016/'
    export LD_LIBRARY_PATH='$HOME/Programs/MOPAC2016'
    alias mopac='$HOME/Programs/MOPAC2016/MOPAC2016.exe'
}

orcarc(){
    export ORCADIR=/home/kyam/Programs/orca-4.2.1
    PATH=$PATH:$ORCADIR
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORCADIR
}

openMolcas(){
    export PATH='$PATH:/home/kyam/Programs/build'
}

gaussian(){
	PATH=$PATH:/home/kyam/Programs/g09
	export g09root=/home/kyam/Programs
	source $g09root/g09/bsd/g09.profile
}

sharc(){
    export SHARC=/home/kyam/Programs/sharc/bin
    declare -x HOSTNAME="Mayk"
    export MOLCAS=/home/kyam/Programs/OpenMolcas/build
}

############################################
#----------   Cluster access  -------------#
############################################

alias watch="watch "
alias loboc='ssh -p 2022 maykcaldas@loboc.nacad.ufrj.br'
alias labmmol='ssh -p 3020 mayk@gw.labmmol.iq.ufrj.br'
alias vpncSdumont='echo SqN5FhFR | sudo vpnc /etc/vpnc/sdumont.conf'
alias callSdumont='sshpass -p SqN5FhFR ssh mayk.ramos@login.sdumont.lncc.br'

function Sdumont() {
    vpncSdumont
    callSdumont
}


#while [ True ]; do sleep 5; if [ $(($RANDOM%10)) -eq 8 ]; then echo; apt moo; sleep 60; fi; done &


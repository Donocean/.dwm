# ~/.bashrc: executed by bash(1) for non-login shells.

# set default editor = vim
export EDITOR='nvim'

# vi-mode
set -o vi

# User alias 如果等号后面有空格 则需要用""扩起来
alias ra=ranger
alias vf=vifm
alias ne=neofetch
alias ..="cd .."
alias vol=alsamixer


# configure FZF
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# need the_silver_seracher so that fzf can find hidden file, and dont find .git directory
export FZF_DEFAULT_COMMAND='fd'
# use '\' to trigger FZF
export FZF_COMPLETION_TRIGGER='\'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1="\[\033[1;32m\][\u] >_\[\033[0m\] \[\033[1;34m\]\w \[\033[0m\]"

else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1="\[\033[1;32m\][\u] >_\[\033[0m\] \[\033[1;34m\]\w \[\033[0m\]"
fi
unset color_prompt force_color_prompt

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

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


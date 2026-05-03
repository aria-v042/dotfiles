# ---------------------------------------------
# ZSH OPTIONS
# ---------------------------------------------


setopt extended_glob		# extend glob syntax
setopt interactivecomments	# enable comments within the interactive shell
setopt autocd				# if command is not a normal command and is a directory cd into it


# ---------------------------------------------
# ENVIRONMENT VARIABLES
# ---------------------------------------------

# home config directory
export XDG_CONFIG_HOME="$HOME/.config"

# nvim workflow
export VISUAL=nvim
export EDITOR=nvim

# browser
export BROWSER="firefox"

# less
export LESS="-R"		# render ANSI color codes

# directories
export REPOS="$HOME/repos"
export CLOUD="$HOME/MEGA"
export SCRIPTS="$HOME/scripts"
export ZSH="$HOME/.zsh"

# current project
export PROJECT="$REPOS/Libft"


# ---------------------------------------------
# PATH
# ---------------------------------------------


path=(
	$path			    # keep existing PATH entries
	$HOME/bin
	$HOME/.local/bin
	$SCRIPTS
)

typeset -U path			# remove and ignore duplicates
path=($^path(N-/))		# remove non-existing

export PATH


# ---------------------------------------------
# HISTORY
# ---------------------------------------------


HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE	# don't save when prefixed with space
setopt HIST_IGNORE_DUPS		# don't save duplicate lines
setopt SHARE_HISTORY		# share hist between sessions
setopt HIST_VERIFY          # when '!' history expansion,
                                # show command before executing

# ---------------------------------------------
# COMPLETION
# ---------------------------------------------


autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colored completions


# ---------------------------------------------
# PROMPT
# ---------------------------------------------


# pure prompt - clone if needed

if [[ ! -d "$HOME/.zsh/pure" ]]; then
    git clone --depth=1 https://github.com/sindresorhus/pure.git "$ZSH/pure"
fi

fpath+=($HOME/.zsh/pure)				# add path to the cloned repo to $fpath
autoload -Uz promptinit; promptinit		# initialize prompt system
prompt pure								# choose pure as the prompt


# ---------------------------------------------
# KEY BINDINGS
# ---------------------------------------------


set -o vi			# set vi-style key bindings


# ---------------------------------------------
# FUNCTIONS
# ---------------------------------------------


# get backlight module interface's brightness (default), max_brightness or actual_brightness value
function get_brightness(){
	if [[ "$1" == "max" ]]; then
		command cat /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/max_brightness
	elif [[ "$1" == "actual" ]]; then
		command cat /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/actual_brightness
	else
		command cat /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/brightness
	fi
}

# set backlight module interface's brightness to given value or max_brightness otherwise
function set_brightness(){
	if [[ $# -gt 0 ]]; then
		echo "$1" | sudo tee /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/brightness
	else
		command cat /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/max_brightness | sudo tee /sys/class/backlight/$(command ls /sys/class/backlight/ | head -1)/brightness
	fi
}

# text-to-speech
function say(){
    echo "$@" | festival --tts
}

# meow
function meow(){
	cat "$@" && say meow meow
}


# ---------------------------------------------
# ALIASES
# ---------------------------------------------


# common use
alias c='clear -x'
alias e='exit'
alias vim='nvim'
alias v='vim'
alias v.='vim .'
alias ogvim='command vim'
alias open='xdg-open'
alias hist='history'
alias please='eval "sudo $(fc -ln -1)"'

# edit configs
alias zshrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias nvimrc='$EDITOR $XDG_CONFIG_HOME/nvim'
alias kittyrc='$EDITOR $XDG_CONFIG_HOME/kitty'
alias tmuxrc='$EDITOR $HOME/.tmux.conf'

# change some commands' default behaviors
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=always'
alias wget='wget --continue'		# continue getting partially downloaded files

# cd / navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../.. && echo "(no way u rly think thats the best way u couldve done that)"'
alias repos='cd $REPOS'
alias project='cd $PROJECT'
alias pro='project'

# ls / eza
alias ls='ls --color --group-directories-first'
alias la='ls -A'                            # all files
alias ll='ls -Al -h'                        # long list
alias l.="ls -A | grep -e '^\.'"            # show only dotfiles
alias ltime='ls -lAh -t'                    # sort by time, newest first
alias lsize='ls -lAh -S'                    # sort by size, smallest first

if type -p eza &>/dev/null; then
    # if eza is installed
    alias eza='eza --group-directories-first'
    alias ea='eza -A'								# all files
    alias el='eza -AlgH --git'						# long list
    alias tree='eza --tree'							# tree view
    alias ltree='el --tree --git --git-ignore'      # tree view long list 
fi

# find files recursively and sort by last modified; ignore hidden files
alias lmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# arch btw
alias apt='man pacman'
alias apt-get='man pacman'

# timestamp
alias ts='date +%y%m%d'             # YYMMDD
alias tslong='date +%y%m%d_%H%M%S'  # YYMMDD_hhmmss
alias tsepoch='date +%s'            # seconds since Unix epoch

# recently installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# c compiler / gcc
alias ccw='cc -Wall -Werror -Wextra'


# /><>/ 42 /><>/
alias mini='~/mini-moulinette/mini-moul.sh'
alias examshell='git clone https://github.com/Seraph919/Grademe-edu && cd Grademe-edu && make && make'


# ---------------------------------------------
# TOOLS
# ---------------------------------------------


# fzf - clone repo if needed
if [[ ! -d "$ZSH/fzf" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $ZSH/fzf
	$ZSH/fzf/install --bin		# install to $ZSH/fzf/bin
fi
path+=($ZSH/fzf/bin)
if command -v fzf &>/dev/null; then
	source <(fzf --zsh)         # source fzf configuration for zsh
fi

## zsh autosuggestions - clone repo if needed
#if [[ ! -d "$ZSH/zsh-autosuggestions" ]]; then
#    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH/zsh-autosuggestions"
#fi
#source "$ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh"

## zsh syntax highlighting - clone repo if needed
#if [[ ! -d "$ZSH/zsh-syntax-highlighting" ]]; then
#    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/zsh-syntax-highlighting"
#fi
#source "$ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---------------------------------------------
# END
# ---------------------------------------------

#if command -v fastfetch &>/dev/null; then
#    fastfetch
#fi

echo "Welcome back, $(whoami)"
echo ":: did you git pull today?"

# local override
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
export PATH="$HOME/.local/bin:$PATH"

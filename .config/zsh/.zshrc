export ZSH="$HOME/.local/src/oh-my-zsh"
ZSH_THEME="bluesheep"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode git laravel zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Settings
setopt appendhistory autocd nomatch notify
unsetopt beep extendedglob
bindkey -v
bindkey '^R' history-incremental-search-backward
CASE_SENSITIVE="false"

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new promp

# Auto-completion
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
setopt completealiases
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# Set favorite programs
export BROWSER="brave"
export EDITOR="nvim"

###### Fix programs to use XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Set color of regular files to light purple
# and remove green shit
export LS_COLORS="fi=95:tw=00;33:ow=01;33:"

##############################
#           Aliases          #
##############################

##### Basic programs
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
alias vim="nvim"
alias mutt="neomutt"
alias startx="sx"
alias l="ls -A"

##### Config shortcuts
alias cvim="vim ~/.config/nvim/init.vim"
alias cz="vim ~/.config/zsh/.zshrc"
alias ci3="vim ~/.config/i3/config"
alias hsc="vim ~/Homestead/Homestead.yaml"
alias alc="vim ~/.config/alacritty/alacritty.yml"
alias cdu="vim ~/.config/dunst/dunstrc"
alias cdwm="vim ~/Programs/dwm/config.h && cd ~/Programs/dwm && doas make clean install"
alias csx="vim ~/.config/sxhkd/sxhkdrc"
alias vihosts='sudo nvim /etc/hosts'

##### Project tools
alias hs="cd ~/Homestead && vagrant up && vagrant ssh"
alias phpunit="./vendor/bin/phpunit tests --colors=auto"
alias phinx="./vendor/bin/phinx"
alias pmf="phinx rollback -t 0 && phinx migrate && phinx seed:run"

##### Miscellaneous utility
alias yeet="rm -rf"
alias pkl="pacman -Qe | less"
alias catkey="cat $HOME/.ssh/id_rsa.pub"

##### Git
alias gcam="git add . && git commit -m"
alias gst="git status"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias gc="git commit"
alias gcv="git commit --verbose"
alias gsp="git stash pop"
alias gcb="git checkout -b"
alias gcd="git checkout development"
alias grp="git remote prune origin"

# Dotfiles
alias df="/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"
alias dfs="df status"
alias dfd="df diff"
alias dfa="df add"
alias dfc="df commit -v"
alias dfp="df push"

##### Bluetooth
alias bt-scan='bluetoothctl devices'
alias bt-connect='bluetoothctl connect'
alias bt-disconnect='bluetoothctl disconnect'
alias bt-headphones='bluetoothctl connect 00:0A:45:0B:1C:4A'
alias bt-on='bluetoothctl power on'
alias bt-off='bluetoothctl power off'

# Load project shortcuts
if [[ ! -f "$ZDOTDIR/shortcuts" ]]; then
    touch $ZDOTDIR/shortcuts
fi

source "$ZDOTDIR/shortcuts"

##############################
#           Exports          #
##############################

###### Add things to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/npm/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

mkdir -p $XDG_DATA_HOME/zsh $XDG_DATA_HOME/wget $XDG_DATA_HOME/npm $XDG_DATA_HOME/gnupg

###### History
HISTFILE="$XDG_DATA_HOME/.histfile"
HISTSIZE=100000
SAVEHIST=10000

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export MYSQLHISTFILE="$XDG_DATA_HOME/mysql_history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/mbsyncrc"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


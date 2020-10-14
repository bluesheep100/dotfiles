export ZSH="/home/bluesheep/.local/src/oh-my-zsh"
ZSH_THEME="bluesheep"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000

# Settings
setopt appendhistory autocd nomatch notify
unsetopt beep extendedglob
bindkey -e # Keybindings: -v for VI, -e for EMACS
bindkey '^R' history-incremental-search-backward
CASE_SENSITIVE="false"

# Auto-completion
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# Add things to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/npm/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Set favorite programs
export BROWSER="google-chrome"
export EDITOR="nvim"

# User specific aliases and functions
alias dmz-web03="ssh administrator@dmz-web03"
alias dmz-proxy="ssh proxymeister@dmz-web_proxy"
alias web04="ssh web04@web04"
alias catkey="cat ~/.ssh/id_rsa.pub"
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
alias vim='nvim'
alias mutt='neomutt'
alias hs='cd ~/Homestead && vagrant up && vagrant ssh'
alias vpn="sudo openconnect vpn.pcvdata.dk --user aasc.skp"
alias vihosts='sudo nvim /etc/hosts'
alias phpunit="./vendor/bin/phpunit tests --colors=auto"
alias catkey="cat $HOME/.ssh/id_rsa.pub"

setlayout() {
    i3-msg "workspace $1; append_layout $HOME/.config/i3/workspace-$1.json" > /dev/null
}

bwun() {
    key=$(bw unlock --raw)
    export BW_SESSION="$key"
}
limp() {
    mysql -uroot --host 127.0.0.1 $1 < $2
}
ldump() {
    mysqldump -uroot --host 127.0.0.1 --column-statistics=0 -dn $1 > $1.sql
}

# Bluetooth commands
alias bt-scan='bluetoothctl devices'
alias bt-connect='bluetoothctl connect'
alias bt-disconnect='bluetoothctl disconnect'
alias bt-headphones='bluetoothctl connect 00:0A:45:0B:1C:4A'
alias bt-on='bluetoothctl power on'
alias bt-off='bluetoothctl power off'

# Shortcuts

# Laravel
alias art="php artisan"
alias tink="php artisan tinker"

# Config shortcuts
alias cz="vim ~/.config/zsh/.zshrc"
alias hsc="vim ~/Homestead/Homestead.yaml"
alias ci3="vim ~/.config/i3/config"

# LAMP aliases
alias a2r="sudo systemctl reload apache2"

# Git aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"
<<<<<<< Updated upstream
alias gcam="git add . && git commit -m"
alias gst="git status"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias gc="git commit"
alias gsp="git stash pop"
alias gcb="git checkout -b"
alias gcd="git checkout development"
alias grp="git remote prune origin"

# Fix some programs to use XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export MYSQLHISTFILE="$XDG_DATA_HOME/mysql/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

alias winnode="/mnt/c/Program\ Files/nodejs/node.exe"
alias newticket="winnode C:/Users/aasc.skp/Desktop/maketicket/maketicket.js -c C:/Users/aasc.skp/Desktop/maketicket/config.json"

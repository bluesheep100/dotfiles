# Path to your oh-my-zsh installation.
export ZSH="/home/bluesheep/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"
source $ZSH/oh-my-zsh.sh
plugins=(git)


# Add to $PATH
export PATH=~/.composer/vendor/bin:$PATH
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# XDG config
export XDG_CONFIG_HOME="$HOME/.config"

# Config folders
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Set zsh completiion dump directory
compinit -d $HOME/.local/zsh/dump/

# Tool aliases
alias wget="wget --hsts-file=\"$XDG_CONFIG_HOME/wget-hsts\""
alias ngrok="~/ngrok"
alias vim="nvim"

# Config alises
alias cz="vim ~/.zshrc"
alias ci3="vim ~/.config/i3/config"

# Project aliases
alias cpca="cd /var/www/html/calc.test"
alias cphg="cd ~/projects/h3gui"
alias cppf="cd /var/www/html/portfolio.test"

# Laravel
alias art="php artisan"
alias tink="php artisan tinker"

# LAMP aliases
alias a2r="sudo systemctl reload apache2"

# Git aliases
alias dotfile="/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"

# Project creation functions
a2vhost () {
    hostDir="/var/www/html/$1"
    sudo mkdir -p $hostDir
    echo "Creating virtual host directory.."
    sudo chown -R $USER:$USER $hostDir
    sudo chmod 775 $hostDir

    echo "Creating configuration file.."
    confPath="/etc/apache2/sites-available/$1.conf"
    sudo touch $confPath
    sudo chmod 755 $confPath

    echo "Writing configuration.."
    sudo tee $confPath <<-EOF > /dev/null
    <VirtualHost *:80>
        ServerAdmin webmaster@$1
        ServerName $1
        DocumentRoot /var/www/html/$1/public
        <Directory /var/www/html/$1/public>
            Options -Indexes +FollowSymLinks
            AllowOverride All
        </Directory>
    </VirtualHost>
EOF

    echo "Enabling site.."
    sudo a2ensite "$1.conf"
    sudo systemctl reload apache2

    echo "Writing to hosts file.."
    sudo sed -i "127.0.0.1  $1" /etc/hosts

    echo "Done!"
}

# Memes
range=1000
number=$RANDOM
let "number %= $range"
sed "$number!d" ~/misc/hacker_stuff.txt | parrotsay

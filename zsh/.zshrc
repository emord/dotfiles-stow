# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR="nvim"
export BROWSER="google-chrome"
export TERM="xterm-256color"

function pull-latest-master() {
    git checkout master; git pull origin master
    git submodule update --init
    git submodule foreach --recursive 'git checkout master; git pull origin master &'
    until [ -z "$(ps aux | grep '[g]it pull')" ]; do sleep 1; done
}

function delete-pyc () {
        find . -type f -name "*.py[co]" -delete
        find . -type d -name "__pycache__" -delete
}

function fix-wifi-after-restart() {
    sudo iwlist wlan0 scanning
}

function fix-work-monitor() {
    xrandr --newmode "1920x1200_60.00" 193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
    xrandr --addmode DP-2 1920x1200_60.00
}

alias dimagi-gpg="gpg --keyring dimagi.gpg --no-default-keyring"

export NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /var/lib/gems/2.1.0/gems/tmuxinator-0.6.11/completion/tmuxinator.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source ~/.local/bin/virtualenvwrapper.sh

export REUSE_DB=1
export PYTHONDONTWRITEBYTECODE=1

export PYTHONPATH="${PYTHONPATH}"

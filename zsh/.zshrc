ZSH_DISABLE_COMPFIX="true"
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
plugins=(gitfast aws fzf)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

export EDITOR="nvim"
export BROWSER="google-chrome"
#export TERM="xterm-256color"

alias vi="nvim"
alias vim="nvim"

function delete-pyc () {
        find . -type f -name "*.py[co]" -delete
        find . -type d -name "__pycache__" -delete
}

#alias dimagi-gpg="gpg --keyring dimagi.gpg --no-default-keyring"

#export NPM_PACKAGES="${HOME}/.npm-packages"
#NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"


# export PYTHONDONTWRITEBYTECODE=1

# export PYTHONPATH="${PYTHONPATH}"

export FZF_DEFAULT_COMMAND="fd ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

autoload -U bashcompinit
bashcompinit
cd

#export GTK_IM_MODULE=xim
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=xim

# source virtualenvwrapper.sh
export PEREGRINE_HOME=/Users/jemord/code/peregrine
export PEREGRINE_FE=/Users/jemord/code/peregrine_frontend

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export AIRFLOW_HOME=/Users/jemord/code/peregrine/pipes/
# Set the PYTHONPATH so it correctly finds the `dags` module.
export PYTHONPATH=/Users/jemord/code/peregrine/pipes/

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"

# export PATH="/usr/local/opt/bzip2/bin:$PATH"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
#
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
#
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
#
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible-password

. $HOME/.asdf/asdf.sh


. /usr/local/opt/asdf/libexec/asdf.sh
export AWS_PROFILE=peregrine-us-gov-main

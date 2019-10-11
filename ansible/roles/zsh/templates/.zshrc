autoload -Uz compinit && compinit -i

export EDITOR=vim

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt hist_ignore_all_dups
setopt histignorespace
bindkey '^R' history-incremental-search-backward

setopt autocd

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -2'

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# # cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export LANG=en_US.UTF-8

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle virtualenvwrapper
antigen bundle yarn

antigen theme robbyrussell
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PROJECT_HOME=$HOME/Dev

bindkey -v
export KEYTIMEOUT=25

fpath=(~/.zsh/completion $fpath)

if command -v workon_cwd > /dev/null ; then
    workon_cwd
fi

bindkey ,, vi-cmd-mode

{% if ansible_facts['os_family'] == 'Darwin' %}
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
{% endif %}

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

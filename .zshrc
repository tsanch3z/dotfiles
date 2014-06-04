autoload -U compinit
compinit

export EDITOR=vim

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward

setopt autocd

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# # cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Install plugins via antigen
#curl https://raw.github.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
##source antigen.zsh

##antigen bundle nojhan/liquidprompt

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
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -2'
alias s='jq .scripts package.json'

git:clean() {
    git fetch -p 2>&1 > /dev/null;
    BRANCHES=$(git branch -vv | grep '\[.*: gone\]' | awk '{print $1}');
    if [ -z $BRANCHES ]; then
        echo "nothing to clean";
        return 0;
    fi;
    echo $BRANCHES
    if read -q "choice?Press Y/y delete all the above branches: "; then
        for branch in ${(f)BRANCHES}; do
            git branch -D $branch;
        done
    else
        echo "no branch deleted"
    fi;
}

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# # cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export LANG=en_US.UTF-8

export NVM_LAZY=1

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle yarn
antigen bundle nvm

antigen theme robbyrussell
antigen apply

bindkey -v
export KEYTIMEOUT=25

fpath=(~/.zsh/completion $fpath)

if command -v workon_cwd > /dev/null ; then
    workon_cwd
fi

bindkey ,, vi-cmd-mode

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$(brew --prefix openvpn)/sbin:$PATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

eval "$(rbenv init -)"

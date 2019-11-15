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

# Install plugins via antigen
# git clone https://github.com/zsh-users/antigen.git ~
source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-flow
antigen bundle virtualenvwrapper
antigen bundle yarn

antigen theme robbyrussell
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PROJECT_HOME=$HOME/Dev
source virtualenvwrapper.sh

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
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/tony/.nvm/versions/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/tony/.nvm/versions/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/tony/.nvm/versions/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/tony/.nvm/versions/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

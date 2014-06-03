autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt elite

#avoid duplicates history lines
setopt HIST_IGNORE_DUPS

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## Install liquidprompt then uncomment
#source liquidprompt

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# # cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

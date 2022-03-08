dotfiles
========

## Brew

Follow [install instructions](https://brew.sh/)

Then ```shell
$ brew bundle check
```

## VIM

[Vundle](https://github.com/VundleVim/Vundle.vim) should be installed:

```shell
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then to install the dependencies:

```shell
$ vim +PluginInstall +qall
```

## ZSH

First install [antigen](https://github.com/zsh-users/antigen):

```shell
$ mkdir ~/.antigen && curl -L git.io/antigen > ~/.antigen/antigen.zsh
```

Then zsh is ready, use chsh to change the active shell

## TMUX

Install [tpm](https://github.com/tmux-plugins/tpm):

```shell
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## VSCODE

Copy settings and keybings to Code directory (/Users/tony/Library/Application\ Support/Code/User) 

Install extensions:

```shell
$ cat extension-list | xargs -L 1 code --install-extension
```

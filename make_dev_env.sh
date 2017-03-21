sudo apt update &&\
    sudo apt upgrade -y &&\
    sudo apt install -y vim build-essential tmux zsh git curl python-pip cmake\
    python-dev python3-dev

sudo pip install virtualenvwrapper

cp .vimrc ~
cp .zshrc ~
cp .tmux.conf ~

mkdir -p ~/antigen
mkdir -p ~/.tmux/themes
mkdir -p ~/.tmux/plugins
mkdir -p ~/Dev

cd ~

touch ~/.tmux/themes/vim-airline

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/zsh-users/antigen.git ~/antigen

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py

tmux new-session "vim -c \":TmuxlineSnapshot ~/vim-airline-snapshot\" +qall && tmux detach-client"

mv ~/vim-airline-snapshot ~/.tmux/themes/vim-airline

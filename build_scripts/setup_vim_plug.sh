#! /bin/bash



sudo apt-get update 

sudo apt-get install -y \
    git 


# install vim-plug per https://github.com/junegunn/vim-plug

#for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

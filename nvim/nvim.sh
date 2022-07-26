#!/bin/sh
rm -rf ~/.config/nvim/lua
cp -r ./lua ~/.config/nvim/lua
cp ./init.lua ~/.config/nvim/init.lua

# INSTALL NEOVIM:
# ================
# //https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
# //https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source
# sudo apt update -y
# sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
# cd; mkdir clones; cd clones; git clone https://github.com/neovim/neovim.git; cd neovim
# git tag
# git checkout tags/desired_version_number -b tagName-branch
# (or just use master for latest)
# rm -rf build
# make CMAKE_BUILD_TYPE=Release
# sudo make install
# git branch -D tagName-branch

# UNINSTALL NEOVIM:
# ===================
# sudo rm /usr/local/bin/nvim
# sudo rm -r /usr/local/share/nvim/

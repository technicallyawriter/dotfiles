#!/bin/bash

# set dotfile location
dotfiles=~/git/dotfiles

# Copy dotfile directories
cp $dotfiles/* ~/.config/

# Make symbolic links for .config files
ln -sf $dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf $dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
ln -sf $dotfiles/awesome/theme.lua ~/.config/awesome/theme.lua
ln -sf $dotfiles/bash/.bashrc ~/.bashrc
ln -sf $dotfiles/bash/.bash_aliases ~/.config/bash/.bash_aliases
ln -sf $dotfiles/micro/settings.json ~/.config/micro/settings.json
ln -sf $dotfiles/micro/bindings.json ~/.config/micro/bindings.json
ln -sf $dotfiles/newsboat/config ~/.config/newsboat/config
ln -sf $dotfiles/newsboat/urls ~/.config/newsboat/urls
ln -sf $dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf $dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf $dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

# Install apt packages
sudo apt install git alacritty awesome zsh tmux micro lynx neovim ranger flatpak newsboat thunderbird libreoffice picom yt-dlp vlc texlive flatpak flameshot gimp scribus inkscape xbacklight

# Install dependencies for i3lock-color app
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev

# Install i3lock-color app
cd ~/.config
git clone https://github.com/Raymo111/i3lock-color.git
cd ~/.config/i3lock-color/
./install-i3lock-color.sh

# Clone awesome-wm volume-control widget
cd ~/.config/awesome
git clone https://github.com/deficient/volume-control.git

# Clone awesome-wm battery-widget
cd ~/.config/awesome
git clone https://github.com/deficient/battery-widget.git

# Clone ranger color themes
cd ~/.config/ranger
git clone https://github.com/ranger/colorschemes.git

# Install flathub repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install torbrowser-launcher flatpak
flatpak install flathub com.github.micahflee.torbrowser-launcher

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Run :PlugInstall
vim -E -c PlugInstall -c q

# Set DPI value (for 1080p screen)
echo "Xft.dpi: 144" > ~/.Xsession
echo "xrdb -merge ~/.Xresources" > ~/.xinitrc


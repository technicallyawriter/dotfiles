#!/bin/bash

# Function to log errors
log_error() {
  echo "Error: $1" >&2
}

# Set dotfile and config dir locations
dotfiles_dir="$HOME/git/dotfiles/.config"
config_dir="$HOME/.config"

# List of dotfiles
dotfiles=(
    "alacritty/alacritty.yml"
    "awesome/rc.lua"
    "awesome/theme.lua"
    "bash/.bashrc"
    "bash/.bash_aliases"
    "micro/settings.json"
    "micro/bindings.json"
    "newsboat/config"
    "newsboat/urls"
    "ranger/rifle.conf"
    "ranger/rc.conf"
    "nvim/init.vim"
    "tmux/tmux.conf"
)

# Iterate through dotfiles and create symbolic links
for dotfile in "${dotfiles[@]}"; do
    source_path="$dotfiles_dir/$dotfile"
    target_path="$config_dir/$(dirname "$dotfile")"
    mkdir -p "$target_path"
    ln -sf "$source_path" "$target_path"
    echo "Created symbolic link: $target_path/$(basename "$dotfile")"
done

echo "Symbolic links created successfully."

# Apt package array
apt_packages=(
  alacritty
  awesome
  flatpak
  flameshot
  git
  gimp
  inkscape
  libreoffice
  lynx
  micro
  neovim
  newsboat
  picom
  ranger
  scribus
  texlive
  thunderbird
  tmux
  vlc
  xbacklight
  yt-dlp
  zsh
)

echo "Installing Apt packages..."
install_apt_packages() {
  for package in "${apt_packages[@]}"; do
    echo "Installing $package..."
    if ! sudo apt-get install -y "$package"; then
      log_error "Failed to install $package."
      exit 1
    else
      echo "$package installed successfully."
    fi
  done
}

# Check if sudo privileges are available
if [ "$EUID" -ne 0 ]; then
  log_error "Please run with sudo or as root."
  exit 1
fi

# Update Apt package lists
echo "Updating Apt package lists..."
if ! sudo apt-get update; then
  log_error "Failed to update Apt package lists."
  exit 1
fi

# Install Apt packages
install_apt_packages

echo "Apt package installation complete."

# Install i3lock-color app
echo "Installing i3lock-color app..."
source ./scripts/install_i3lock-color.sh
echo "Done."

# Clone awesome-wm widgets
echo "Cloning awesome-wm widgets..."
source ./scripts/install_awesome-widgets.sh
echo "Done."

# Install flathub repo
echo "Installing flathub repo and listed flatpaks..."
source ./install_flatpaks.sh
echo "Done."

# Install latest Vale release from GitHub
echo "Installing latest Vale release from GitHub..."
source ./scripts/install_vale.sh
echo "Done."

# Install vim-plug
echo "Installing vim-plug..."
source ./scripts/install_vim-plug.sh
echo "Done."

# Clone ranger color themes
echo "Cloning ranger color themes..."
source ./scripts/install_ranger.sh
echo "Done."

# Set DPI value (for 1080p screen)
echo "Setting DPI value for 1080p screen..."
echo "Xft.dpi: 144" > ~/.Xsession
echo "xrdb -merge ~/.Xresources" > ~/.xinitrc
echo "Done."

echo ******************************
echo ** Install script complete! **
echo ******************************
echo
echo "You may need to logout or refresh awesome-wm (MOD+CTRL+r) to all changes"


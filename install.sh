#!/bin/bash

# Function to log errors
log_error() {
  echo ""
  echo "Error: $1" >&2
  exit 1
}

# Function to log warnings
log_warning() {
  echo ""
  echo "/*/*/*/*/*/*/*/*/*/"
  echo ""
  echo "Warning: $1" >&2
  echo ""
  echo "/*/*/*/*/*/*/*/*/*/"
  echo ""
}

# Set dotfile and config dir locations
dotfiles_dir="$HOME/git/dotfiles/.config"
config_dir="$HOME/.config"

# List of dotfiles
dotfiles=(
    "alacritty/alacritty.yml"
    "awesome/rc.lua"
    "awesome/theme.lua"
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
    ln -sf "$source_path" "$target_path" || log_error "Failed to create symbolic link for $dotfile."
    echo "Created symbolic link: $target_path/$(basename "$dotfile")"
done

# Special symlink for ~/.bashrc
ln -sf "$dotfiles_dir/bash/.bashrc" "$HOME/.bashrc" || log_error "Failed to create symbolic link for .bashrc."

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
for package in "${apt_packages[@]}"; do
  echo "Installing $package..."
  sudo apt-get install -y "$package" || log_error "Failed to install $package."
  echo "$package installed successfully."
done

echo "Apt package installation complete."

# Install i3lock-color app
echo "Installing i3lock-color app..."
./scripts/install_i3lock-color.sh || log_error "Failed to install i3lock-color app."
echo "Done."

# Clone awesome-wm widgets
echo "Cloning awesome-wm widgets..."
./scripts/install_awesome-widgets.sh || log_error "Failed to clone awesome-wm widgets."
echo "Done."

# Install flathub repo
echo "Installing flathub repo and listed flatpaks..."
./scripts/install_flatpaks.sh || log_warning "Flathub installed but the repo isn't available until reboot. You may need to run 'scripts/install_flatpaks.sh' again after reboot to complete your flatpak installs."

# Install latest Vale release from GitHub
echo "Installing latest Vale release from GitHub..."
./scripts/install_vale.sh || log_error "Failed to install Vale from GitHub."
echo "Done."

# Install vim-plug
echo "Installing vim-plug..."
./scripts/install_vim-plug.sh || log_error "Failed to install vim-plug."
echo "Done."

# Clone ranger color themes
echo "Cloning ranger color themes..."
./scripts/install_ranger.sh || log_error "Failed to clone ranger color themes."
echo "Done."

# Set DPI value (for 1080p screen)
echo "Setting DPI value for 1080p screen..."
echo "Xft.dpi: 144" > "$HOME/.Xresources" || log_error "Failed to set DPI value."
echo "xrdb -merge $HOME/.Xresources" > "$HOME/.xinitrc" || log_error "Failed to set DPI value."
echo "Done."

# Set CapsLock as Esc key for Vim
echo "Setting XKBOPTIONS to use CapsLock as Esc key for Vim..."
echo "NOTE: CapsLock is now 'Shift + CapsLock'"
sudo sed -i 's/^XKBOPTIONS=.*/XKBOPTIONS="caps:escape_shifted_capslock"/' /etc/default/keyboard
echo "XKBOPTIONS updated successfully."

# source ~/.bashrc
source ~/.bashrc

echo ""
echo "******************************"
echo "******************************"
echo "** Install script complete! **"
echo "******************************"
echo "******************************"
echo ""
echo ""
echo "You may need refresh awesome-wm (MOD+CTRL+r) or logout/reboot to apply all changes"
echo ""
echo ""

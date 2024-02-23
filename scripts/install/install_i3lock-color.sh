#!/bin/bash

# list prereq packages 
apt_packages=(
  autoconf
  gcc
  make
  pkg-config
  libpam0g-dev
  libcairo2-dev
  libfontconfig1-dev
  libxcb-composite0-dev
  libev-dev
  libx11-xcb-dev
  libxcb-xkb-dev
  libxcb-xinerama0-dev
  libxcb-randr0-dev
  libxcb-image0-dev
  libxcb-util0-dev
  libxcb-xrm-dev
  libxkbcommon-dev
  libxkbcommon-x11-dev
  libjpeg-dev
)

# install prereqs
echo "Installing prereqs for i3lock-color app..."
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

install_apt_packages

echo "Prereq installation complete."

# clone repo
echo "Cloning i3lock-color git repo..."
cd ~/.config
if git clone https://github.com/Raymo111/i3lock-color.git; then
  echo "Git repo cloned successfully."
else
  log_error "Failed to clone Git repo. Check the repository URL and try again."
  exit 1
fi

# install
echo "Installing i3lock-color..."
cd ~/.config/i3lock-color/
if ./install-i3lock-color.sh; then
  echo "Install complete."
else
  log_error "Failed to install i3lock-color. See log for error details."
  exit 1
fi


#!/bin/bash

# Add flathub repo
echo "Adding Flatpak repo via Flathub..."
if flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; then
  echo "Flatpak repo added successfully."
else
  log_error "Failed to add Flatpak repo via Flathub. Check the repository URL and try again."
fi

# Install torbrowser-launcher flatpak
echo "Installing flatpaks..."
if flatpak install flathub com.github.micahflee.torbrowser-launcher; then
  echo "torbrowser-launcher flatpak installed."
else
  log_error "Failed to add torbrowser-launcher flatpak"
fi

echo "Flatpaks installed."

#!/bin/bash

# Change directories
cd ~/.config/ranger

# Clone repo
echo "Cloning ranger color schemes repo..."
if git clone https://github.com/ranger/colorschemes.git; then
  echo "Successfully cloned ranger color schemes repo."
else
  log_error "Failed to clone Git repository. Check the URL and try again."
fi


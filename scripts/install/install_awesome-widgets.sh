#!/bin/bash

# Change directory
cd ~/.config/awesome

# Clone awesome-wm volume-control
if git clone https://github.com/deficient/volume-control.git; then
  echo "Git repo cloned successfully."
else
  log_error "Failed to clone Git repo. Check the repository URL and try again."
  exit 1
fi

# Clone awesome-wm battery-widget
if git clone https://github.com/deficient/battery-widget.git; then
  echo "Git repo cloned successfully."
else
  log_error "Failed to clone Git repo. Check the repository URL and try again."
  exit 1
fi


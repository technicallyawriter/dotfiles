#!/bin/bash

# Get current user and assign it to a variable
current_user=$(whoami)

# Echo the current user
echo "Current User: $current_user"

# install vim-plug via script
echo "Installing vim-plug via script"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change directory owner from root to $USER
echo "Changing directory owner from root to current user"
sudo chown -R $current_user:$current_user "${XDG_DATA_HOME:-$HOME}/.local/share/nvim"

# Run :PlugInstall
echo "Running :PlugInstall..."
if nvim --headless +PlugInstall +qa; then
  echo ":PlugInstall executed successfully."
else
  log_error "Failed to run :PlugInstall successfully. Check your vim plugins and try again."
fi

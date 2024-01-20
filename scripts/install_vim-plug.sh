#!/bin/bash

# install vim-plug via script
echo "Installing vim-plug via script"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change directory owner from root to $USER
echo "Changing directory owner from root to current user"
if sudo chown -R $USER:$USER $HOME/.local/share/nvim; then
  echo "Success!"
else
  log_error "Failed to change directory owner"
fi

# Run :PlugInstall
echo "Running :PlugInstall..."
if nvim --headless +PlugInstall +qa; then
  echo ":PlugInstall executed successfully."
else
  log_error "Failed to run :PlugInstall successfully. Check your vim plugins and try again."
fi


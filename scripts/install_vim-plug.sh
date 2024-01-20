#!/bin/bash

# install vim-plug via script
echo "Installing vim-plug via script"
sudo sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Run :PlugInstall
echo "Running :PlugInstall..."
if nvim --headless +PlugInstall +qa; then
  echo ":PlugInstall executed successfully."
else
  log_error "Failed to run :PlugInstall successfully. Check your vim plugins and try again."
fi


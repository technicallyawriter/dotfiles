# README

Perform the following to setup a fresh environment.

## Clone dotfiles

```
mkdir ~/git && cd ~/git
git clone https://github.com/technicallyawriter/dotfiles.git && cd dotfiles/
```

## Run install.sh

```
sudo -E ./install.sh
```

**NOTE:** `sudo -E` option keeps the current user's environment. This makes handling sudo easier without changing the script's context to the root user.

# README

Perform the following to setup a fresh environment. Run as the user you want to setup (user must have sudo privileges).

## Clone dotfiles

```
mkdir ~/git
cd ~/git
git clone https://github.com/technicallyawriter/dotfiles.git
```

## Run `install.sh` 

```
cd ~/git/dotfiles
./install.sh
```

restart awesome-wm, if needed, with **CTRL+MOD4+r**

## Manual config

### Map CapsLock as Esc for Vim (CTRL+CapsLock = CapsLock)

`sudo vim /etc/default/keyboard` 

and update XKBOPTIONS to

`XKBOPTIONS="caps:escape_shifted_capslock"`


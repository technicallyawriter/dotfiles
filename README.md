# README.md

Perform the following to setup a fresh environment. Run as the user you want to setup (and user must have sudo privilege).

## Import keys

Locate and cp .ssh keys

```
sudo fdisk -l
sudo mkdir ~/mnt/usb
sudo mount /dev/DEVICE ~/mnt/usb
cp /mnt/usb/KEYS ~/.ssh
```

**NOTE:** Temporarily storing keys on a USB may open up permissions (depending on file type). Fix permissions on the .ssh folder and keys inside, if needed (.ssh dir = 700, .pub = 644, .private = 600). 

## Clone dotfiles

```
mkdir ~/git
cd ~/git
git clone https://github.com/technicallyawriter/dotfiles.git
```

## Run `install.sh` 

```
cd ~/git/dotfiles
bash ./install.sh
```

restart awesome-wm if needed with **CTRL+MOD4+r**

## Manual config

### Map CapsLock as Esc for Vim (CTRL+CapsLock = CapsLock)

`sudo vim /etc/default/keyboard` 

and update XKBOPTIONS to

`XKBOPTIONS="caps:escape_shifted_capslock"`


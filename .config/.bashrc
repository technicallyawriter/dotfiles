#### custom .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# color prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# set ls color for directories
export LS_COLORS="$LS_COLORS:di=1;35"

#################
##### CUSTOM PS1

# Set colors
USER_COLOR='\[\033[0;35m\]'
HOST_COLOR='\[\033[0;35m\]'
PATH_COLOR='\[\033[0;35m\]'
SYMBOL_COLOR='\[\033[0;35m\]'
GIT_BRANCH_COLOR='\[\033[0;31m\]'
RESET_COLOR='\[\033[0m\]'  # Reset color

# Function to get current git branch
get_git_branch() {
    branch=$(git branch 2>/dev/null | grep \* | awk '{print $2}')
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

# Check if color_prompt is set to yes
if [ "$color_prompt" = yes ]; then
    # PS1 prompt with colors
    PS1="${USER_COLOR}\u${RESET_COLOR}${SYMBOL_COLOR}@${RESET_COLOR}${HOST_COLOR}\h${RESET_COLOR} ${PATH_COLOR}\w${RESET_COLOR}${GIT_BRANCH_COLOR}\$(get_git_branch)${RESET_COLOR} "
else
    # Default PS1 prompt without colors
    PS1="\u@\h:\w\$ "
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# print last command to terminal title
trap 'printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"' DEBUG

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.cargo/env"

############
## ALIASES

# apt and flatpak upgrade
alias upgrade="sudo apt update && sudo apt upgrade && flatpak upgrade"

# shutdown
alias shutdown="sudo shutdown now"

# reboot
alias reboot="sudo reboot now"

# ls color
alias ls="ls --color"

# ls long list all
alias ll="ls -l"

# open newsboat
alias rss="newsboat"

# youtube-dl
alias youtube-dl="yt-dlp"

# open ranger
alias files="ranger"

# backlight percentages
alias blhigh="xbacklight -set 100"
alias bllow="xbacklight -set 5"

# antora build
alias build="npx antora --fetch playbook.yml"

# antora preview with no caching
alias preview="npx http-preview build/site -c-1"

# todo list
alias todo="vim ~/todo.md"

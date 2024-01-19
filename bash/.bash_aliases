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
alias ll="ls -lah"

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

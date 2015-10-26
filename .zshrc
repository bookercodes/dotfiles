export ZSH=/home/booker/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="agnoster"
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="true"

plugins=(git nvm colorize ssh-agent tmux history jump extract gitignore)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cat='colorize' 

alias npmg="npm i -g "
alias npmS="npm i -S "
alias npmD="npm i -D "

alias j="jump"

alias shutdown='sudo shutdown now'
alias restart='sudo restart now'

alias l='ls -lFh'
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -l'
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias i3config='vim ~/.i3/config'
alias tmuxconf='vim ~/.tmux.conf'

alias pls=please
alias please='sudo $(fc -ln -1)'

alias copy='xclip -sel clip'

BASE16_SHELL="$HOME/.config/base16-shell/base16-oceanicnext.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

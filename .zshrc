export ZSH=/home/booker/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOQUIT="true"

plugins=(tmux jump)


export PATH=~/bin:$PATH

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias vi='nvim'

alias l="ls -lFh"
alias la="ls -lAFh"
alias ll="ls -l"

alias j="jump"

alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias nviminit="nvim ~/.config/nvim/"
alias i3conf="nvim ~/.i3/config"
alias tmuxconf="nvim ~/.tmux.conf"

# Git aliases
alias gs="git status"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gc="git clone $1 $2"
alias gcm="git commit -m "$1""
alias gaa="git add -A ."
alias gpo="git push origin $1"
alias glo="git log --oneline"
alias grhh="git reset --hard HEAD"
alias gcp="git cherry-pick $1"

# npm aliases
alias ni="npm install";
alias nis="npm i -S "
alias nid="npm i -D "
alias nig="npm i -g "
alias nrs="npm run start";
alias nrb="npm run build";
alias nrt="npm run test";

alias xres="nvim ~./.Xresources && xrdb ~/.Xresources"

BASE16_SHELL="$HOME/.config/base16-shell/base16-gooey.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

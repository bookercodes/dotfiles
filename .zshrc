source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle jump
antigen bundle command-not-found

# antigen theme norm
# antigen theme suvash
# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen theme https://github.com/halfo/lambda-mod-zsh-theme lambda-mod


antigen apply

alias ya="yaourt --nameonly --pager --color $1"
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias v='nvim'
alias l="ls -lFh"
alias la="ls -lAFh"
alias ll="ls -l"
alias j="jump"
alias termiteconf="nvim ~/.config/termite/config"
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias vinit="cd ~/.config/nvim && v ~/.config/nvim/config"
alias i3conf="nvim ~/.i3/config"
alias tmuxconf="nvim ~/.tmux.conf"
alias xres="nvim ~/.Xresources && xrdb ~/.Xresources"
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
alias ni="npm install";
alias nis="npm i -S "
alias nid="npm i -D "
alias nig="npm i -g "
alias nrs="npm run start";
alias nrb="npm run build";
alias nrt="npm run test";
alias nrc="npm run commit";

BASE16_SHELL="$HOME/.config/base16-shell/base16-gooey.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim

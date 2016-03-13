source /usr/share/zsh/scripts/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle jump
antigen bundle command-not-found
antigen theme https://github.com/halfo/lambda-mod-zsh-theme lambda-mod
antigen apply

source ~/.aliases

BASE16_SHELL="$HOME/.config/base16-shell/base16-gooey.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

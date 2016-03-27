source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle jump
antigen apply

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

source ~/.aliases.sh

# BASE16_SHELL="$HOME/.config/base16-shell/base16-gooey.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

antigen theme https://github.com/halfo/lambda-mod-zsh-theme lambda-mod

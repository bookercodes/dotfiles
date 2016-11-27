source $(brew --prefix)/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle jump
antigen apply

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

source ~/.aliases.sh

export NVM_DIR="/home/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim


source ~/.aliases.sh
source $(brew --prefix)/share/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle jump
antigen apply

export EDITOR=nvim


export NVM_DIR="/Users/booker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

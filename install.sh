#!/usr/bin/env bash

set -e

# Source: https://gist.github.com/davejamesmiller/1965569
ask() {
  while true; do
    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi
    read -p "$1 [$prompt] " REPLY </dev/tty
    if [ -z "$REPLY" ]; then
      REPLY=$default
    fi
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac
  done
}

dir=`pwd`

if ask "Install symlink for .config/nvim?" Y; then
  ln -sfn ${dir}/.config/nvim ${HOME}/.config/nvim
fi

if ask "Install symlink for .config/base16-shell?" Y; then
  ln -sfn ${dir}/.config/base16-shell ${HOME}/.config/base16-shell
fi

if ask "Install symlink for .tmux.conf?" Y; then
  ln -sf ${dir}/.tmux.conf ${HOME}/.tmux.conf
fi

if ask "Install symlink for .zshrc?" Y; then
  ln -sf ${dir}/.zshrc ${HOME}/.zshrc
fi

if ask "Install symlink for .zprofile?" Y; then
  ln -sf ${dir}/.zprofile ${HOME}/.zprofile
fi

if ask "Install symlink for .yaourtrc?" Y; then
  ln -sf ${dir}/.yaourtrc ${HOME}/.yaourtrc
fi

if ask "Install symlink for .Xresources?" Y; then
  ln -sf ${dir}/.Xresources ${HOME}/.Xresources
fi

if ask "Install symlink for .xinitrc?" Y; then
  ln -sf ${dir}/.xinitrc ${HOME}/.xinitrc
fi

if ask "Install symlink for .i3blocks.conf?" Y; then
  ln -sf ${dir}/.i3blocks.conf ${HOME}/.i3blocks.conf
fi

if ask "Install symlink for .scripts?" Y; then
  ln -sfn ${dir}/.scripts ${HOME}/.scripts
fi

if ask "Install symlink for .i3?" Y; then
  ln -sfn ${dir}/.i3 ${HOME}/.i3
fi

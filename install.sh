#!/usr/bin/env bash
set -e

# General-purpose Yes/No prompt function. 
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

ask "Install symlink for .zshrc?" Y && ln -sf ${dir}/.zshrc ${HOME}/.zshrc
ask "Install symlink for .zprofile?" Y && ln -sf ${dir}/.zprofile ${HOME}/.zprofile
ask "Install symlink for .yaourtrc?" Y && ln -sf ${dir}/.yaourtrc ${HOME}/.yaourtrc
ask "Install symlink for .Xresources?" Y && ln -sf ${dir}/.Xresources ${HOME}/.Xresources
ask "Install symlink for .xinitrc?" Y && ln -sf ${dir}/.xinitrc ${HOME}/.xinitrc
ask "Install symlink for .gtkrc-2.0?" Y && ln -sf ${dir}/.gtkrc-2.0 ${HOME}/.gtkrc-2.0
ask "Install symlink for .i3blocks.conf?" Y && ln -sf ${dir}/.i3blocks.conf ${HOME}/.i3blocks.conf
ask "Install symlink for .scripts?" Y && ln -sfn ${dir}/.scripts ${HOME}/.scripts
ask "Install symlink for .i3?" Y && ln -sfn ${dir}/.i3 ${HOME}/.i3
ask "Install symlink for .config/nvim?" Y && ln -sfn ${dir}/.config/nvim ${HOME}/.config/nvim
ask "Install symlink for .config/base16-shell?" Y && ln -sfn ${dir}/.config/base16-shell ${HOME}/.config/base16-shell
ask "Install symlink for .config/dunst?" Y && ln -sfn ${dir}/.config/dunst ${HOME}/.config/dunst
ask "Install symlink for .config/gtk-2.0?" Y && ln -sfn ${dir}/.config/gtk-2.0 ${HOME}/.config/gtk-2.0
ask "Install symlink for .config/gtk-3.0?" Y && ln -sfn ${dir}/.config/gtk-3.0 ${HOME}/.config/gtk-3.0
ask "Install symlink for .config/pulse?" Y && ln -sfn ${dir}/.config/pulse ${HOME}/.config/pulse
ask "Install symlink for .config/imgur-screenshot?" Y && ln -sfn ${dir}/.config/imgur-screenshot ${HOME}/.config/imgur-screenshot
ask "Install symlink for .config/pulseaudio-ctl?" Y && ln -sfn ${dir}/.config/pulseaudio-ctl ${HOME}/.config/pulseaudio-ctl

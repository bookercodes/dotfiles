#!/bin/sh

.screenlayout/default.sh &
setxkbmap gb             &
xrdb -merge ~/.Xresources &
nitrogen --restore

exec i3



#!/bin/sh

# env >> /home/nikolay/udev.log
# XAUTHORITY=$HOME/.Xauthority
# DISPLAY=:0
# export DISPLAY XAUTHORITY
# 
# export XDG_RUNTIME_DIR=/run/user/1000
# export QT_ACCESSIBILITY=1
# cd $HOME
# export XDG_DATA_DIRS=/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
# 
# # make CapsLock behave like Ctrl:
# setxkbmap -option ctrl:nocaps 2>> /home/nikolay/udev.log
# 
# # allow changing between languages using super+space
# setxkbmap -layout "us,bg" -variant ",phonetic" -option "grp:win_space_toggle" 2>> /home/nikolay/udev.log
# 
# # make short-pressed Ctrl behave like Escape:
# # xcape -e 'Control_L=Escape' 2>> /home/nikolay/udev.log
# 
echo "$(whoami), $HOME, $XAUTHORITY, $DISPLAY" >> /home/nikolay/udev.log
# 
# unset DISPLAY XAUTHORITY
# unset XDG_RUNTIME_DIR
# unset QT_ACCESSIBILITY
# unset XDG_DATA_DIRS

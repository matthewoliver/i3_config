#!/bin/bash

sudo dnf install i3 i3status i3lock i3blocks dmenu thunar pactl playerctl feh arandr fontawesome-fonts fontconfig lxappearance eog scrot
cp -a .i3 ~/

# Grab hack font if it doesn't exist                                                                                  
if [[ ! "$(fc-list |grep -i hack)" ]]; then                                                                           
  ( mkdir -p "${HOME}/.fonts/"                                                                                        
  cd "${HOME}/.fonts/"                                                                                                
  echo "Downloading Hack font"                                                                                        
  wget -q https://github.com/chrissimpkins/Hack/releases/download/\                                                   
v2.019/Hack-v2_019-otf.zip -O hack.zip                                                                                
  unzip -qu hack.zip && rm -f hack.zip                                                                                
  cd - >/dev/null                                                                                                     
  # Update fonts                                                                                                      
  fc-cache -f "${HOME}/.fonts" )                                                                                      
fi

cat <<EOF
Commands/Shortcuts
=====================
This i3 configuration is configured to use the super key as your mod key.
The application menu is mapped to super+d but also to super+p for older wmii users.
Start a terminal* with super+enter
You can lock your screen with super+shift+enter
You can modify what is shown in the top bar by editing ~/.i3/i3blocks.conf and then press super+shift+r to appy the changes to the WM.
At startup some applications will launch, chrome (on desktop 1), rhythmbox (on desktop 10 (0)) and quassel on the scratchpad (desktop -).
Finally simply 'man i3' to get basic shortcuts to use i3.

* The default terminal can be defined in whatever you set in the TERMINAL env. Otherwise it'll default to something basic depending on what you have installed. So you can do something like:
echo 'export TERMINAL="gnome-terminal"' > ~/.bashrc


Multiple Monitors
==================
If you have multiple desktops you can use xrandr to configure then you can add the xrandr command to your ~/.i3/config file:
   exec_always <xrandr command>

Although an easier way, if you have a complicated setup is to use arander, when your done hit 'save' and it'll create a .sh file which the xrandr command inside, use that command inside the ~/.i3/config file.

Font Awesome
==============
The Font Awesome font is a special font that renders popular icons as fonts, this allows us to make the i3 bars nicer. The easiest way to use it to copy and paste the icon you want from the cheatsheet here: http://fontawesome.io/cheatsheet/

GTK Font and themes
====================
If you want to change your font (I like to use hack) or your GTK theme, then use lxappearance command.
EOF

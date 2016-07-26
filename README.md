# My i3 Setup

To setup i3 just run the setup.sh script. But note this script assumes your runnig kororaproject 24+ only becuase it packages playerctl and i3blocks, which I use to rice i3 a little. If you aren't running Korora or a fedora then you need to hack the package install line in the setup.

If your distro doesn't package i3blocks or playerctl then see below for instuctions on how to build them from source.

## Packages
The setup will install:
  * i3 - The i3 window manager
  * i3status - Status bar. Though now that I use i3blocks this can probably be removed.
  * i3lock - Screen lock
  * i3blocks - New status bar
  * dmenu - Menu system
  * thunar - File browser
  * pactl - To support some multimedia keys.
  * playerctl - For the player mulitmedia keys.
  * feh - To set up background
  * arandr - I use to setup muliple monitor configurations.
  * fontawesome-fonts - Gives some icons as a font.
  * Hack font
  * fontconfig
  * lxappearance - To configure you gtk theme etc. (I prefer Arc-Darker with the Hack font).

## Commands/Shortcuts

Here are some command/shortcuts to get you started:
  * This i3 configuration is configured to use the super key as your mod key.
  * The application menu is mapped to super+d but also to super+p for older wmii users.
  * Start a terminal[1] with super+enter
  * You can lock your screen with super+shift+enter
  * You can modify what is shown in the top bar by editing ~/.i3/i3blocks.conf and then press super+shift+r to appy the changes to the WM.
  * At startup some applications will launch, chrome (on desktop 1), rhythmbox (on desktop 10 (0)) and quassel on the scratchpad (desktop -).
  * Finally simply 'man i3' to get basic shortcuts to use i3 or read the i3 config file (~/.i3/config).

[1] The default terminal can be defined in whatever you set in the TERMINAL env. Otherwise it'll default to something basic depending on what you have installed. So you can do something like:
echo 'export TERMINAL="gnome-terminal"' > ~/.bashrc

## Multiple Monitors

If you have multiple desktops you can use xrandr to configure then you can add the xrandr command to your ~/.i3/config file:

   exec_always \<xrandr command\>

Although an easier way, if you have a complicated setup is to use arander, when your done hit 'save' and it'll create a .sh file which the xrandr command inside, use that command inside the ~/.i3/config file.

## Font Awesome

The Font Awesome font is a special font that renders popular icons as fonts, this allows us to make the i3 bars nicer. The easiest way to use it to copy and paste the icon you want from the cheatsheet here: http://fontawesome.io/cheatsheet/

## GTK Font and themes

If you want to change your font (I like to use hack) or your GTK theme, then use lxappearance command.

## Installing playerctl and/or i3blocks from source

### playerctl
Playerctl on korora 24+ is packaged so:

  dnf install playerctl

From Source:

  git clone https://github.com/acrisci/playerctl
  cd playerctl
  sudo dnf install gtk-doc gobject-introspection gobject-introspection-devel glib2-devel
  ./autogen.sh
  make
  sudo make install

NOTE: 'sudo make uninstall' will uninstall.

# i3blocks
I3blocks on korora 24+ is packaged so:

  dnf install i3blocks

From Source:

  git clone git://github.com/vivien/i3blocks
  cd i3blocks
  make clean all
  sudo make install

NOTE: 'sudo make uninstall' will uninstall.

#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Run Applications as Root (Hyprland)

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Applications'
mesg='Run Applications as Root'

if [[ "$theme" == *'type-1'* ]]; then
  list_col='1'
  list_row='5'
  win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
  list_col='1'
  list_row='5'
  win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
  list_col='1'
  list_row='5'
  win_width='520px'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='5'
  list_row='1'
  win_width='670px'
fi

# Options
layout=$(grep 'USE_ICON' ${theme} | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  option_1=" Alacritty"
  option_2=" Thunar"
  option_3=" Geany"
  option_4=" Ranger"
  option_5=" Vim"
else
  option_1=""
  option_2=""
  option_3=""
  option_4=""
  option_5=""
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "window {width: $win_width;}" \
    -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command as Root with Wayland variables
run_cmd() {
  app="$1"

  # Ensure root has access to Wayland session
  export WAYLAND_DISPLAY="$WAYLAND_DISPLAY"
  export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR"
  export DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"

  # Run app with sudo
  sudo env "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
    "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
    "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" \
    $app
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd "alacritty"
  ;;
$option_2)
  run_cmd "thunar"
  ;;
$option_3)
  run_cmd "geany"
  ;;
$option_4)
  run_cmd "alacritty -e ranger"
  ;;
$option_5)
  run_cmd "alacritty -e vim"
  ;;
esac

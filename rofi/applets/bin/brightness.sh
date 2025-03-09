#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x) [Modified by ChatGPT]
## Github  : @adi1090x
#
## Applets : Brightness (Using brightnessctl with Min/Max options)

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Get Brightness Info
current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
backlight=$((current_brightness * 100 / max_brightness))

if [[ $backlight -ge 0 ]] && [[ $backlight -le 29 ]]; then
  level="Low"
elif [[ $backlight -ge 30 ]] && [[ $backlight -le 49 ]]; then
  level="Optimal"
elif [[ $backlight -ge 50 ]] && [[ $backlight -le 69 ]]; then
  level="High"
elif [[ $backlight -ge 70 ]] && [[ $backlight -le 100 ]]; then
  level="Peak"
fi

# Theme Elements
prompt="${backlight}%"
mesg="Brightness Level: $level"

if [[ "$theme" == *'type-1'* ]]; then
  list_col='1'
  list_row='6'
  win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
  list_col='1'
  list_row='6'
  win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
  list_col='1'
  list_row='6'
  win_width='425px'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='6'
  list_row='1'
  win_width='650px'
fi

# Options
layout=$(grep 'USE_ICON' "${theme}" | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  option_1=" Increase"
  option_2=" Optimal (25%)"
  option_3=" Decrease"
  option_4=" Settings"
  option_5=" Max Brightness"
  option_6=" Min Brightness"
else
  option_1=""
  option_2=""
  option_3=""
  option_4=""
  option_5=""
  option_6=""
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "window {width: $win_width;}" \
    -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
  case "$1" in
  --opt1) brightnessctl set +5% ;;
  --opt2) brightnessctl set 25% ;;
  --opt3) brightnessctl set 5%- ;;
  --opt4) xfce4-power-manager-settings ;;
  --opt5) brightnessctl set 100% ;; # Max brightness
  --opt6) brightnessctl set 1% ;;   # Min brightness
  esac
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1) run_cmd --opt1 ;;
$option_2) run_cmd --opt2 ;;
$option_3) run_cmd --opt3 ;;
$option_4) run_cmd --opt4 ;;
$option_5) run_cmd --opt5 ;; # Max Brightness
$option_6) run_cmd --opt6 ;; # Min Brightness
esac

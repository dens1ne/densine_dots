#!/bin/bash

DIR=$HOME/Изображения/wallpaper/
WALLPAPERS=($(ls ${DIR}))

theme="$HOME/.config/rofi/launchers/type-1/style-4.rasi"

if [[ $(pidof linux-wallpaper) ]]; then
    pkill linux-wallpaper
fi

rofi_cmd() {
    rofi -sep ' ' -dmenu -mesg "Choose wallpaper" -theme $theme
}

run_rofi() {
    echo -e "${WALLPAPERS[@]} Kill Kill&linux-we " | rofi_cmd
}

selected=$(run_rofi)

case ${selected} in
    "Kill")
        pkill swww-daemon
        ;;
    "Kill&linux-we")
        swww clear 24273A
        swww-daemon
        ${HOME}/.config/wallpaper-switcher/linux-we.sh
        ;;
    *)
        swww img ${DIR}/${selected} --transition-fps 60 --transition-type left --transition-duration 3
        ;;
esac
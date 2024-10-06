#!/bin/bash

theme="$HOME/.config/rofi/launchers/type-1/style-4.rasi"

rofi_cmd() {
    rofi -sep ';' -dmenu -theme $theme -mesg "Choose wallpaper manager"
}

run_rofi() {
    echo -e "swww;Wallpaper engine" | rofi_cmd
}

if [[ $(pidof linux-wallpaperengine) ]]; then
    ${HOME}/.config/wallpaper-switcher/linux-we.sh
elif [[ $(pidof swww-daemon) ]]; then
    ${HOME}/.config/wallpaper-switcher/swww-we.sh
else
    selected=$(run_rofi)
    case ${selected} in
        "swww")
            ${HOME}/.config/wallpaper-switcher/swww-we.sh
            ;;
        "linux-wallpaper")
            ${HOME}/.config/wallpaper-switcher/linux-we.sh
            ;;
    esac
fi
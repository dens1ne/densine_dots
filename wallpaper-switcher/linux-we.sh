#!/bin/bash

display="eDP-1"
DIR="$HOME/.config/wallpaper-switcher"
WALLPAPERS="$(python3 ${DIR}/we_helper.py --list)"
theme="$HOME/.config/rofi/launchers/type-1/style-4.rasi"
$kill = "Kill"
$kill_we_swww = "Kill and start swww"

# if [[ $(pidof swww-daemon )]]; then
#     pkill swww-daemon
# fi

rofi_cmd() {
    rofi -sep ';' -dmenu -mesg "Choose wallpaper" -theme $theme
}

run_rofi() {
    echo -e "${WALLPAPERS};Kill;Kill and start swww;" | rofi_cmd
}

echo "wallpapers"

selected=$(run_rofi)

case ${selected} in
    $kill)
        notify-send "Killing linux-wallpaper"
        pkill linux-wallpaper
        ;;
    $kill_we_swww)
        pkill linux-wallpaper
        swww-daemon
        ${HOME}/.config/wallpaper-switcher/swww-we.sh
        ;;
    *)
        id=$(python3 ${DIR}/we_helper.py --id_by_name "${selected}")
        linux-wallpaperengine --screen-root ${display} ${id}
        ;;
esac

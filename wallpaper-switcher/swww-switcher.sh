#!/bin/bash

DIR=$HOME/Изображения/wallpaper/
PICS=($(ls ${DIR}))

echo ${#PICS[@]}

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

if [[ $(pidof linux-wallpaper) ]]; then
  pkill linux-wallpaper
  pkill linux-we-switcher.sh
fi

swww query || swww-daemon

#change-wallpaper using swww
swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type left --transition-duration 3

#!/bin/bash

echo "linux-wallpaperengine started"
# 3104057965 1403849247
PICS=(2799877694 2927802976 2932157836 2927802976 2103392042 1996672640)

swww clear 11143A


while :
do
    RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
    echo ${RANDOMPICS}
    linux-wallpaperengine --screen-root eDP-1 ${RANDOMPICS}
    kill -INT linux-wallpaper
done
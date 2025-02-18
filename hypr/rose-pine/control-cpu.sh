#!/bin/bash

for fish_pid in $fish_instances; do
    cpulimit -e /usr/bin/fish -b -l=50 
done

for zellij_pid in $fish_instances; do
    cpulimit -e /usr/bin/zellij -b -l=50
done

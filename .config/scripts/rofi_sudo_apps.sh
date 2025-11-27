#!/usr/bin/env bash

apps="/bin/gnome-discs"

chosen=$(echo "$apps" | rofi -dmenu -p "Root App:")

[ -z "$chosen" ] && exit 0

pkexec $chosen

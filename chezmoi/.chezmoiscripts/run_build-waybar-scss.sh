#!/usr/bin/env bash

cd $XDG_CONFIG_HOME/waybar
sass --style=compressed --no-source-map style.scss style.css

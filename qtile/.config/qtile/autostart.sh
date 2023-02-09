#!/bin/sh

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

run nitrogen --restore &
picom --config $HOME/.config/qtile/picom.conf &


#!/bin/bash
# demotype - type content of file into window
#
# Copyright 2014, Nicola Chiapolini, nicola.chiapolini@physik.uzh.ch
# License: GNU General Public License version 3,
#          or (at your option) any later version.

printHelp() {
    echo "demotype - type content of file into window"
    echo ""
    echo "usage: demotype.sh [-e <char>] file"
    echo "  -e  exclude lines staring with char"
    echo "      (default: #)"
    exit 0
}

comment="#"
while getopts ":e:h" Option
do
    case $Option in
        e ) comment=${OPTARG:0:1};;
        h ) printHelp;;
        * ) printHelp;;
    esac
done
shift $(($OPTIND - 1))


ownid=$(xdotool getactivewindow)

echo "select traget window"
winid=$(xwininfo | grep -E 'Window id' | cut -d " " -f 4)
echo "own window:    $ownid"
echo "traget window: $winid"
echo "------------------------"
echo -e "\n"

while read line 
do
    echo "$line"
    if [ "${line:0:1}" != "$comment" ]
    then
        xdotool windowactivate --sync $winid type "$line"
        xdotool windowactivate --sync $ownid >& /dev/null
        read -n 1 -rs key </dev/tty
        xdotool windowactivate --sync $winid key KP_Enter
        xdotool windowactivate --sync $ownid >& /dev/null
    else
        read -n 1 -rs key </dev/tty
    fi
done < $1


#!/usr/bin/env bash
: '
METADATA="$(playerctl metadata --format "{{ title }} ({{ artist }})" 2> /dev/null 2>&1) |"

if [[ $METADATA == "No player could handle this command" ]]

then
    echo "플레이어 없음 |"
else
    # "awk -v len=..." adds ellipsis
    echo $METADATA | awk -v len=40 "{ if (length($0) > len) print substr($0, 1, len-5) "... |"; else print; }"
fi
'

DATA=`playerctl metadata --format "{{ title }} ({{ artist }})" 2> /dev/null 2>&1`

if [[ $DATA == "No players found" || $DATA == "No player could handle this command" ]]
then
    echo "No player found |"
else
    ELLIPSIS=`echo $DATA 2> /dev/null | awk -v len=30 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'`
    echo "$ELLIPSIS |"
    wait
fi


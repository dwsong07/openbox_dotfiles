#!/bin/env bash
STATUS=$(playerctl -a status 2> /dev/null 2>&1)

if [[ $STATUS == *"Playing"* ]]; then
    echo ""
else
    echo "契"
fi

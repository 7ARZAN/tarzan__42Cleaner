#!/bin/bash

python -m pip install requests

if [ ! -d "$HOME/.logtime" ]; then
    mkdir $HOME/.logtime
fi

if [ ! -f "$HOME/.logtime/main.py" ]; then
    cp  main.py $HOME/.logtime/main.py
fi

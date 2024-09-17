#!/bin/bash

python3 -m venv myenv > /dev/null
source myenv/bin/activate > /dev/null
pip install requests > /dev/null


if [ ! -d "$HOME/.logtime" ]; then
    mkdir $HOME/.logtime
fi

if [ ! -f "$HOME/.logtime/main.py" ]; then
    cp  main.py $HOME/.logtime/main.py
fi

deactivate

rm -rf myenv

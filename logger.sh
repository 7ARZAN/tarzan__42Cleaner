python3 -m venv myenv > /dev/null
source myenv/bin/activate > /dev/null
pip install requests > /dev/null


if [ ! -d "$HOME/.logtime" ]; then
    mkdir $HOME/.logtime
fi

cp  main.py $HOME/.logtime/main.py

echo "alias logtime='python $HOME/.logtime/main.py'" >> $HOME/.zshrc

deactivate > /dev/null

#!/bin/bash

if [ ! -d ~/Desktop/Games ]; then
        mkdir ~/Desktop/Games
fi

echo "Remove Broken Symlink..."
find ~/Desktop/Games -type l ! -exec test -e {} \; -exec rm -v {} \;

IFS=$'\n'
for i in `ls /home/deck/.local/share/Steam/steamapps/compatdata`
do
        GAME_NAME=`cat /home/deck/.local/share/Steam/steamapps/appmanifest_$i.acf | grep name | cut -d'"' -f4`
        echo "Creating Symlink for $GAME_NAME"
        ln -s /home/deck/.local/share/Steam/steamapps/compatdata/$i/pfx ~/Desktop/Games/"$GAME_NAME"
done

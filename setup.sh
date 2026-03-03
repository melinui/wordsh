#!/usr/bin/bash

echo "Initializing wordsh setup..."

# Check if words.txt file already exists in current directory
if [ -e words.txt ] ; then
    echo "File with words already exists. You are good to go!"
else
    echo "Fetching words from the web..."
    curl -s 'https://gist.githubusercontent.com/daemondevin/df09befaf533c380743bc2c378863f0c/raw/5-letter-words.txt' > words.txt
fi

echo "Setup is done. You can start playing!"
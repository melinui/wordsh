#!/usr/bin/bash

echo "----------------------------------------------------";
echo " __      __                .___     .__     ";
echo "/  \\    /  \\___________  __| _/_____|  |__  ";
echo "\\   \\/\\/   /  _ \\_  __ \\/ __ |/  ___/  |  \\ ";
echo " \\        (  <_> )  | \\/ /_/ |\\___ \\|   Y  \\";
echo "  \\__/\\  / \\____/|__|  \\____ /____  >___|  /";
echo "       \\/                   \\/    \\/     \\/ ";
echo "----------------------------------------------------";
echo ; echo
echo "------------ GAME RULES ------------"
echo "You enter a 5-letter word"
echo "|-| means letter does not exist" 
echo "|x| means right letter wrong place" 
echo "|o| means right letter right place" 
echo "------------------------------------"
echo; echo

# Pick a random word from words.txt
word=$(shuf -n 1 words.txt)
len=`expr length "$word"`

echo "Give your guess bellow:"
read guess

# Check length of guess
while [ "$(expr length $guess)" -ne 5 ]; do
    echo "Guess must be exactly 5 letters!"
    echo -n "Try again: "
    read guess
done

LIMIT=6 # num of tries
try=1   # start from 1st try of course

while [ "$try" -le "$LIMIT" ]; do
    # print the letter in boxes type format
    echo "-----------"
    echo "|$(expr substr "$guess" 1 1)|$(expr substr "$guess" 2 1)|$(expr substr "$guess" 3 1)|$(expr substr "$guess" 4 1)|$(expr substr "$guess" 5 1)|"
    echo -n "|"
    for i in 1 2 3 4 5; do
        # get chars of each word
        charw=`expr substr "$word" "$i" 1`
        charg=`expr substr "$guess" "$i" 1`
        
        if [ "$word" = "$guess" ]; then # word found
            echo "o|o|o|o|o|"
            echo "-----------"
            echo "You won! You found the hidden word!"
            exit 0
        elif [ "$charw" = "$charg" ]; then # char was found in the right place
            echo -n "o|"
        elif [ "$(expr index "$word" "$charg")" -ne 0 ]; then # char was found in word
            echo -n  "x|"
        else # char does not exist in word
            echo -n "-|"
        fi
    done
    echo ; echo "-----------"
    
    # ask for another guess, unless out of tries
    if [ "$(($LIMIT - $try))" -ne 0 ]; then
        echo "Try another word:  -$(($LIMIT - $try)) tries left-"
        read guess
    fi

    # Check length of guess
    while [ "$(expr length $guess)" -ne 5 ] && [ "$(($LIMIT - $try))" -ne 0 ]; do
        echo "Guess must be exactly 5 letters!"
        echo -n "Try again: "
        read guess
    done
    try=$(($try + 1))
done
echo
echo "You lost! Out of tries!"
echo "Hidden word was $word"
exit 1
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

for nt in 1 2 3 4 5 6; do
    echo "-----------"
    echo "|$(expr substr "$guess" 1 1)|$(expr substr "$guess" 2 1)|$(expr substr "$guess" 3 1)|$(expr substr "$guess" 4 1)|$(expr substr "$guess" 5 1)|"
    echo -n "|"
    for i in 1 2 3 4 5; do
        # get chars
        charw=`expr substr "$word" "$i" 1`
        charg=`expr substr "$guess" "$i" 1`
        
        if [ "$word" = "$guess" ]; then
            echo "o|o|o|o|o|"
            echo "-----------"
            echo "You won! You found the hidden word!"
            exit 0
        elif [ "$charw" = "$charg" ]; then
            echo -n "o|"
        elif [ "$(expr index "$word" "$charg")" -ne 0 ]; then
            echo -n  "x|"
        else
            echo -n "-|"
        fi
    done
    echo ; echo "-----------"
    echo "Try another word:"
    read guess
    # Check length of guess
    while [ "$(expr length $guess)" -ne 5 ]; do
        echo "Guess must be exactly 5 letters!"
        echo -n "Try again: "
        read guess
    done
done
echo
echo "You lost! Out of tries!"
echo "Hidden word was $word"
exit 1
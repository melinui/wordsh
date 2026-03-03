#!/usr/bin/bash

# Pick a random word from words.txt
word=$(shuf -n 1 words.txt)

echo "The hidden word is $word"
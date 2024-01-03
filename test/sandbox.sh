#!/bin/zsh

string="Apple M2 Pro."

if [[ "$string" == *"Apple"* ]]; then
    echo "Substring found."
else
    echo "Substring not found."
fi

if [[ -n "Hello" && "${string}" == *"Apple"* ]]; then
    echo "not supported"
else
    echo ""Supported
fi

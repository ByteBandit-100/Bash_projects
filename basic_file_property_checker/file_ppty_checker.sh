#!/bin/bash

#program on test operators 

read -p "Full name of file to search: " item

if [[ -e "$item" ]]; then
    user=$(whoami)

    echo ">> $item exists."
    echo "------DETAILS------"

    if [[ -f "$item" ]]; then
        echo "Type : file"
    elif [[ -d "$item" ]]; then
        echo "Type : directory"
    else
        echo "Type : other"
    fi

    [[ -r "$item" ]] && echo "$item is readable. ($user)"
    [[ ! -r "$item" ]] && echo "$item is not readable. ($user)"

    [[ -w "$item" ]] && echo "$item is writable. ($user)"
    [[ ! -w "$item" ]] && echo "$item is not writable. ($user)"

    [[ -x "$item" ]] && echo "$item is executable. ($user)"
    [[ ! -x "$item" ]] && echo "$item is not executable. ($user)"
    
    size=`stat -c %s $item`
    echo "Size : $size bytes."
else
    echo ">> $item does not exist."
fi

#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Must include file pattern to match" 1>&2;
    exit 1;
else
    findPattern=$1;
fi

if [ -z "$2" ]; then
    echo "Must include directory to read from" 1>&2;
    exit 1;
else
    directory=$2;
fi

# Find files in directory
array=(`find $directory -name $findPattern`);
numDocs=${#array[@]};

if [ $numDocs -eq 0 ]; then
    echo "Directory is empty" 1>&2;
    exit 1;
fi

# Randomly select a file.
index=$(($RANDOM % numDocs));  #$RANDOM is only 16-bit number; might want a better random.
echo ${array[index]}
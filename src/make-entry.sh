#!/usr/bin/env bash

# Check args
if [ -z "$1" ]; then
    echo "Must include output directory" 1>&2;
    exit 1;
else
    directory=$1;
fi

if [ -z "$2" ]; then
    echo "Must include entry subject" 1>&2;
    exit 1;
else
    subject=$2;
fi

# create the file name
stamp=$(date "+%Y-%m-%d");
dashedSubject=${subject// /-} # TODO: handle any characters we don't want in file paths
filename="${stamp}_${dashedSubject}.md";
filepath="${directory}/${filename}";

# prep and open file
# TODO: consider adding front matter
echo "writing to $filepath";
printf "# ${stamp} ${subject}\n\n" > "$filepath";
# subl "${filepath}:3";  #we open on line 3; if this is a new file, that will be the last line.
code ${directory} -g ${filepath}:3:0
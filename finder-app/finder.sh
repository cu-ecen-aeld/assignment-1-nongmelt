#!/bin/bash
# Exits with return value 1 error and print statements
# if any of the parameters above were not specified

if [ "$#" -ne 2 ]; then
    echo "Error: arguments filesdir, or searchstr are missing"
    exit 1
fi

# Exits with return value 1 error and print statements
# if filesdir does not represent a directory on the filesystem

if [ ! -d "$1" ]; then
    echo "Error: filesdir is not directory, or not found"
    exit 1
fi

num_files=$(find "$1" -type f | wc -l)
matches=$(grep -r "$2" "$1" | wc -l)
echo "The number of files are ${num_files} and the number of matching lines are ${matches}"

#! /bin/bash

# Accepts the following arguments:
# the first argument is a full path to a file (including filename)
# on the filesystem, referred to below as writefile;
# the second argument is a text string which will be written within this file,
# referred to below as writestr

# Exits with value 1 error and
# print statements if any of the arguments
# above were not specified
if [ "$#" -ne 2 ]; then
    echo "Error: arguments writefile and writestr are missing"
    exit 1
fi

# Creates a new file with name and path writefile with content writestr,
# overwriting any existing file and creating the path if it doesn’t exist.
# Exits with value 1 and error print statement if the file could not be created.
dir_name=$(dirname "$1")

if ! mkdir -p "$dir_name"; then
    echo "Error: Failed to create directory: $dir_name" >&2
    exit 1
fi

if ! touch "$1"; then
    echo "Error: Failed to create file: $2" >&2
    exit 1
fi

echo "$2" >"$1"

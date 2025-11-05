#!/bin/sh
# Script: writer.sh
# Author: Nambirajan

# Exit with error if incorrect arguments
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the given file path
writedir=$(dirname "$writefile")

# Create the directory path if it doesn’t exist
mkdir -p "$writedir"

# Check if the directory creation was successful
if [ ! -d "$writedir" ]; then
    echo "Error: Could not create directory '$writedir'."
    exit 1
fi

# Write the given string to the file (overwrite mode)
echo "$writestr" > "$writefile"

# Check if writing was successful
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file '$writefile'."
    exit 1
fi

exit 0


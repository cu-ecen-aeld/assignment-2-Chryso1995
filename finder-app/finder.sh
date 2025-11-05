#!/bin/sh
# Script: finder.sh
# Author: Nambirajan

# Exit with error if incorrect arguments
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Count number of files (recursively)
file_count=$(find "$filesdir" -type f | wc -l)

# Count number of lines matching the search string
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print output in the required format
echo "The number of files are ${file_count} and the number of matching lines are ${match_count}"

exit 0


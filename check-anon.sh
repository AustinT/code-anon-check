#!/bin/bash

# Directory to scan
DIR_TO_SCAN="$1"

# Patterns to search for
PATTERNS=(
    "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" # Email addresses
    "http[s]?://[a-zA-Z0-9./?=_&:-]+" # URLs
    "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" # IP addresses
    "ajt212"  # my Cambridge identifier
    "cam.ac.uk"
    "Austin"
    "Tripp"
)

# Loop through patterns and search in files
for pattern in "${PATTERNS[@]}"; do
    echo "Searching for pattern: $pattern"
    find "$DIR_TO_SCAN" -type f  -exec grep -HnE "$pattern" {} +
done


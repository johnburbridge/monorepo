#!/bin/bash

# Exit on error
set -e

# Check if ktlint is installed globally
if command -v ktlint &> /dev/null; then
  KTLINT="ktlint"
else
  # Check if we have a local installation
  if [ -f "./bin/ktlint" ]; then
    KTLINT="./bin/ktlint"
  else
    # Try to install ktlint locally
    echo "ktlint not found. Attempting to install locally..."
    ./setup_ktlint.sh
    
    if [ -f "./bin/ktlint" ]; then
      KTLINT="./bin/ktlint"
    else
      echo "Error: Failed to install ktlint."
      exit 1
    fi
  fi
fi

# Check all Kotlin files in the repository
echo "Checking Kotlin files..."
$KTLINT "**/*.kt" --reporter=plain

if [ $? -eq 0 ]; then
  echo "All Kotlin files are properly formatted!"
else
  echo "Some Kotlin files need formatting. Run ./ktlint_format.sh to fix them."
  exit 1
fi

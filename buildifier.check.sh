#!/bin/bash

# Exit on error
set -e

# Check if buildifier is installed globally
if command -v buildifier &> /dev/null; then
  BUILDIFIER="buildifier"
else
  # Check if we have a local installation
  if [ -f "./bin/buildifier" ]; then
    BUILDIFIER="./bin/buildifier"
  else
    # Try to install buildifier locally
    echo "Buildifier not found. Attempting to install locally..."
    ./setup_buildifier.sh
    
    if [ -f "./bin/buildifier" ]; then
      BUILDIFIER="./bin/buildifier"
    else
      echo "Error: Failed to install buildifier."
      exit 1
    fi
  fi
fi

# Check formatting of all Bazel files in the repository
echo "Checking Bazel file formatting..."
$BUILDIFIER -mode=check -lint=warn -r .

echo "All Bazel files are properly formatted!"

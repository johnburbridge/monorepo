#!/bin/bash

# Exit on error
set -e

# Check if buildifier is installed
if ! command -v buildifier &> /dev/null; then
  echo "Error: buildifier is not installed."
  echo "Please install it with one of the following commands:"
  echo "  go install github.com/bazelbuild/buildtools/buildifier@latest"
  echo "  brew install buildifier"
  exit 1
fi

# Check formatting of all Bazel files in the repository
echo "Checking Bazel file formatting..."
buildifier -mode=check -lint=warn -r .

echo "All Bazel files are properly formatted!"

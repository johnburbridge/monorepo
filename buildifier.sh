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

# Format all Bazel files in the repository
echo "Formatting Bazel files..."
buildifier -r -lint=fix .

echo "Done! All Bazel files have been formatted."

#!/bin/bash

# Exit on error
set -e

# Create the virtual environment if it doesn't exist
if [ ! -d "lint_venv" ]; then
  echo "Creating virtual environment with linting tools..."
  ./setup_lint_venv.sh
fi

# Path to black in the virtual environment
BLACK="./lint_venv/bin/black"

# Check if black is available in the virtual environment
if [ ! -f "$BLACK" ]; then
  echo "Error: black not found in the virtual environment."
  echo "Please run: ./setup_lint_venv.sh"
  exit 1
fi

# Run black in check mode on all Python files in the repository, excluding bazel-* directories
echo "Checking Python code formatting with black..."
$BLACK --check $(find . -name "*.py" -not -path "./bazel-*/*" -not -path "./lint_venv/*")

echo "Black check completed successfully!"

#!/bin/bash

# Exit on error
set -e

# Create the virtual environment if it doesn't exist
if [ ! -d "lint_venv" ]; then
  echo "Creating virtual environment with linting tools..."
  ./setup_lint_venv.sh
fi

# Path to pylint in the virtual environment
PYLINT="./lint_venv/bin/pylint"

# Check if pylint is available in the virtual environment
if [ ! -f "$PYLINT" ]; then
  echo "Error: pylint not found in the virtual environment."
  echo "Please run: ./setup_lint_venv.sh"
  exit 1
fi

# Run pylint on all Python files in the repository, excluding bazel-* directories
echo "Running pylint on Python files..."
$PYLINT $(find . -name "*.py" -not -path "./bazel-*/*" -not -path "./lint_venv/*")

echo "Pylint completed successfully!"

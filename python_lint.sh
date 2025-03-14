#!/bin/bash

# Exit on error
set -e

# Create the virtual environment if it doesn't exist
if [ ! -d "lint_venv" ]; then
  echo "Creating virtual environment with linting tools..."
  ./setup_lint_venv.sh
fi

# Paths to linting tools in the virtual environment
PYLINT="./lint_venv/bin/pylint"
BLACK="./lint_venv/bin/black"

# Check if tools are available in the virtual environment
if [ ! -f "$PYLINT" ]; then
  echo "Error: pylint not found in the virtual environment."
  echo "Please run: ./setup_lint_venv.sh"
  exit 1
fi

if [ ! -f "$BLACK" ]; then
  echo "Error: black not found in the virtual environment."
  echo "Please run: ./setup_lint_venv.sh"
  exit 1
fi

# Find Python files to lint, excluding bazel-* and lint_venv directories
PYTHON_FILES=$(find . -name "*.py" -not -path "./bazel-*/*" -not -path "./lint_venv/*")

# Run black in check mode
echo "Checking Python code formatting with black..."
$BLACK --check $PYTHON_FILES

# Run pylint
echo "Running pylint on Python files..."
$PYLINT $PYTHON_FILES

echo "Python linting completed successfully!"

#!/bin/bash

# Exit on error
set -e

# Define the virtual environment directory
VENV_DIR="lint_venv"

# Create the virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
  echo "Creating virtual environment at $VENV_DIR..."
  python3 -m venv "$VENV_DIR"
fi

# Activate the virtual environment
if [ -f "$VENV_DIR/bin/activate" ]; then
  echo "Activating virtual environment..."
  source "$VENV_DIR/bin/activate"
else
  echo "Error: Virtual environment activation script not found."
  exit 1
fi

# Install required packages
echo "Installing linting tools..."
pip install -r third_party/requirements.txt

echo "Virtual environment setup complete!"
echo "Linting tools (pylint, black) are now available in $VENV_DIR/bin/"
echo ""
echo "To activate the virtual environment, run:"
echo "  source $VENV_DIR/bin/activate"
echo ""
echo "Or use the linting scripts directly:"
echo "  ./python_lint.sh"
echo "  ./pylint.sh"
echo "  ./black_check.sh"

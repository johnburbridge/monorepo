#!/bin/bash

# Exit on error
set -e

# Define ktlint version
KTLINT_VERSION="0.48.2"
KTLINT_DIR="./bin"
KTLINT_PATH="${KTLINT_DIR}/ktlint"

# Create bin directory if it doesn't exist
mkdir -p "${KTLINT_DIR}"

# Check if ktlint is installed globally
if command -v ktlint &> /dev/null; then
  echo "Using globally installed ktlint"
  KTLINT="ktlint"
else
  # Check if we have a local installation
  if [ -f "${KTLINT_PATH}" ]; then
    echo "Using local ktlint installation at ${KTLINT_PATH}"
    KTLINT="${KTLINT_PATH}"
  else
    # Download and install ktlint locally
    echo "Downloading ktlint ${KTLINT_VERSION}..."
    curl -sSLO "https://github.com/pinterest/ktlint/releases/download/${KTLINT_VERSION}/ktlint"
    chmod +x ktlint
    mv ktlint "${KTLINT_PATH}"
    echo "Installed ktlint to ${KTLINT_PATH}"
    KTLINT="${KTLINT_PATH}"
  fi
fi

echo "ktlint setup complete!"
echo "To use ktlint, run: ${KTLINT} \"**/*.kt\" [--format]"

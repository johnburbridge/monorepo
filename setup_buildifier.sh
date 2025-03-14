#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
  command -v "$1" &> /dev/null
}

# Check if buildifier is already installed
if command_exists buildifier; then
  echo "buildifier is already installed."
  exit 0
fi

# Determine the OS
OS="$(uname -s)"
ARCH="$(uname -m)"

# Set the download URL based on OS and architecture
if [ "$OS" = "Linux" ]; then
  if [ "$ARCH" = "x86_64" ]; then
    URL="https://github.com/bazelbuild/buildtools/releases/download/v6.4.0/buildifier-linux-amd64"
  elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    URL="https://github.com/bazelbuild/buildtools/releases/download/v6.4.0/buildifier-linux-arm64"
  else
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi
elif [ "$OS" = "Darwin" ]; then
  if [ "$ARCH" = "x86_64" ]; then
    URL="https://github.com/bazelbuild/buildtools/releases/download/v6.4.0/buildifier-darwin-amd64"
  elif [ "$ARCH" = "arm64" ]; then
    URL="https://github.com/bazelbuild/buildtools/releases/download/v6.4.0/buildifier-darwin-arm64"
  else
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# Create a bin directory if it doesn't exist
mkdir -p bin

# Download buildifier
echo "Downloading buildifier from $URL..."
curl -L -o bin/buildifier "$URL"

# Make it executable
chmod +x bin/buildifier

echo "buildifier has been installed to $(pwd)/bin/buildifier"
echo "Add this directory to your PATH to use buildifier directly:"
echo "  export PATH=\"\$PATH:$(pwd)/bin\""

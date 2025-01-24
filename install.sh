#!/bin/bash

# Check if NDK directory exists
NDK_BASE_DIR=~/Library/Android/sdk/ndk
if [[ ! -d $NDK_BASE_DIR ]]; then
    echo "Error: NDK directory not found at $NDK_BASE_DIR"
    echo "Please install the NDK via Android Studio or manually."
    exit 1
fi

# Create installation directory
mkdir -p ~/.ndkctl/bin ~/.ndkctl/lib

# Copy files
cp bin/ndkctl ~/.ndkctl/bin/
cp lib/ndkctl.sh ~/.ndkctl/lib/

# Add to PATH
if [[ ":$PATH:" != *":$HOME/.ndkctl/bin:"* ]]; then
    echo 'export PATH="$HOME/.ndkctl/bin:$PATH"' >> ~/.zshrc
    echo 'source "$HOME/.ndkctl/lib/ndkctl.sh"' >> ~/.zshrc
    echo "Added ndkctl to PATH. Please restart your shell or run 'source ~/.zshrc'."
else
    echo "ndkctl is already in PATH."
fi
#!/bin/bash

# NDK configuration
export NDK_BASE_DIR=~/Library/Android/sdk/ndk  # NDK installation directory
export NDK_CURRENT_LINK=$NDK_BASE_DIR/ndk-current  # Symlink path

# Check if NDK directory exists
if [[ ! -d $NDK_BASE_DIR ]]; then
    echo "Error: NDK directory not found at $NDK_BASE_DIR"
    echo "Please install the NDK via Android Studio or manually."
    exit 1
fi

# Initialize NDK environment variables
if [[ -L $NDK_CURRENT_LINK ]]; then
    export ANDROID_NDK_HOME=$NDK_CURRENT_LINK
    export PATH=$ANDROID_NDK_HOME:$PATH
fi

# Set NDK version
function set-ndk() {
    if [[ -d $NDK_BASE_DIR/$1 ]]; then
        ln -sfn $NDK_BASE_DIR/$1 $NDK_CURRENT_LINK
        export ANDROID_NDK_HOME=$NDK_CURRENT_LINK
        export PATH=$ANDROID_NDK_HOME:$PATH
        echo "NDK version set to $1"
    else
        echo "Error: NDK version $1 not found in $NDK_BASE_DIR!"
    fi
}

# List all NDK versions
function list-ndk() {
    echo "Available NDK versions:"
    current_ndk=$(readlink $NDK_CURRENT_LINK)
    if [[ -z $current_ndk ]]; then
        echo "No NDK version is currently set."
    else
        current_ndk=$(basename $current_ndk)
    fi

    for ndk in $(ls $NDK_BASE_DIR); do
        # Only process directories and exclude symlinks
        if [[ -d $NDK_BASE_DIR/$ndk && ! -L $NDK_BASE_DIR/$ndk ]]; then
            if [[ "$ndk" == "$current_ndk" ]]; then
                echo " * $ndk (current)"
            else
                echo "   $ndk"
            fi
        fi
    done
}

# Check if NDK symlink exists
if [[ ! -L $NDK_CURRENT_LINK ]]; then
    echo "Warning: NDK symlink not found. Run 'ndkctl set <version>' to set it."
fi
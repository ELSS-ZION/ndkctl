# NDK Control Tool (`ndkctl`)

A simple command-line tool to manage multiple NDK versions on macOS.

## Prerequisites

-  **NDK Installation**:  
  The NDK must be installed via Android Studio or manually at `}/Library/Android/sdk/ndk`.  
  If the NDK is not installed, you can install it via Android Studio:
  1. Open Android Studio.
  2. Go to `Tools` -> `SDK Manager`.
  3. Select the `SDK Tools` tab.
  4. Check `NDK (Side by side)` and click `Apply`.

-  **Shell**:  
  This tool is designed for `zsh` or `bash`. Ensure your shell is properly configured.

## Installation

### Option 1: Manual Installation

1. Download the latest release from the [Releases page](https://github.com/yourusername/ndkctl/releases).
2. Extract the archive:
   bash
   tar -xzvf ndkctl-1.0.0.tar.gz
   
3. Run the installation script:
   bash
   cd ndkctl
   ./install.sh
   
4. Restart your shell or run:
   bash
   source ~/.zrcr
   
### Option 2: Install via Homebrew

If you have Homebrew installed, you can install `ndkctl` directly:
```bash
brew install yourusername/your-tap-repo/ndkctl
```

## Usage

### List Available NDK Versions

To list all installed NDK versions, run:
```bash
ndkctl list
```

Example output:
```
Available NDK versions:
   20.1.5948944
 * 25.1.8937393 (current)
   28.0.12916984
```

### Set the Current NDK Version

To set the current NDK version, run:
```bash
ndkctl set <version>
```

Example:
```bash
ndkctl set 25.1.8937393
```

Output:
```
NDK version set to 25.1.8937393
```

### Verify the Current NDK Version

To verify the current NDK version, run:
```bash
ndk-build --version
```

Example output:
```
GNU Make 4.3
...
```

## Uninstallation

To uninstall `ndkctl`, follow these steps:

1. Remove the installation directory:
   bash
   rm -rf ~/.ndkctl
   
2. Remove the PATH modification from your shell configuration file (~/.zshrc or ~/.bashrc):
   bash
   sed -i '' '/ndkctl/d' ~/.zshrc
   
## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Inspired by tools like `nvm` and `asdf`.
- Thanks to the Android and Homebrew communities for their excellent tools and documentation.

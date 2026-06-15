#!/usr/bin/env bash

# Copy all the commands below, including the final blank line, and
# paste them into a Debian Linux terminal command prompt.
# Expect the commands to take several minutes to complete,
# depending on your system and internet connection.

set -u

LOG_DIR="$HOME/Desktop"
LOG_FILE="$LOG_DIR/it140_setup_log.txt"

mkdir -p "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Installing and updating user-level course IDE components..."

# Make sure user-level command folder exists and is active in this terminal.
mkdir -p "$HOME/.local/bin" "$HOME/.local/opt"
export PATH="$HOME/.local/bin:$PATH"

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.profile" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"
fi

# Check for basic tools needed by this setup script.
for command_name in curl tar gzip uname sed grep; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
        echo "ERROR: Required command not found: $command_name"
        echo "This script installs tools at the user level, so it cannot install missing system dependencies."
        echo "Please install $command_name using your Debian package manager or contact tech support."
        exit 1
    fi
done

# Git does not have a simple official user-level installer for Debian.
# Use the system Git if it is already available.
if ! command -v git >/dev/null 2>&1; then
    echo "ERROR: Git is not installed."
    echo "Please install Git with your Debian package manager or contact tech support."
    echo "Typical Debian command: sudo apt update && sudo apt install -y git"
    exit 1
fi

# Install Python 3.12 at the user level using uv.
echo "Installing Python 3.12..."
if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

uv python install 3.12

PYTHON312="$(uv python find 3.12)"
ln -sf "$PYTHON312" "$HOME/.local/bin/python3.12"
ln -sf "$PYTHON312" "$HOME/.local/bin/python"

python -m ensurepip --upgrade
python -m pip install --upgrade pip pytest

# Install GitHub CLI at the user level.
echo "Installing GitHub CLI..."
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64)
        GH_ARCH="amd64"
        ;;
    aarch64|arm64)
        GH_ARCH="arm64"
        ;;
    *)
        echo "ERROR: Unsupported CPU architecture for GitHub CLI: $ARCH"
        exit 1
        ;;
esac

GH_LATEST_URL="$(curl -Ls -o /dev/null -w '%{url_effective}' https://github.com/cli/cli/releases/latest)"
GH_VERSION="${GH_LATEST_URL##*/v}"
GH_TAR="gh_${GH_VERSION}_linux_${GH_ARCH}.tar.gz"

curl -L "https://github.com/cli/cli/releases/download/v${GH_VERSION}/${GH_TAR}" -o "/tmp/${GH_TAR}"
rm -rf "$HOME/.local/opt/gh"
mkdir -p "$HOME/.local/opt/gh"
tar -xzf "/tmp/${GH_TAR}" -C "$HOME/.local/opt/gh" --strip-components=1
ln -sf "$HOME/.local/opt/gh/bin/gh" "$HOME/.local/bin/gh"

# Install VS Code at the user level.
echo "Installing Visual Studio Code..."
case "$ARCH" in
    x86_64)
        VSCODE_PLATFORM="linux-x64"
        ;;
    aarch64|arm64)
        VSCODE_PLATFORM="linux-arm64"
        ;;
    *)
        echo "ERROR: Unsupported CPU architecture for VS Code: $ARCH"
        exit 1
        ;;
esac

curl -L "https://update.code.visualstudio.com/latest/${VSCODE_PLATFORM}/stable" -o /tmp/vscode.tar.gz
rm -rf "$HOME/.local/opt/vscode"
mkdir -p "$HOME/.local/opt/vscode"
tar -xzf /tmp/vscode.tar.gz -C "$HOME/.local/opt/vscode" --strip-components=1
ln -sf "$HOME/.local/opt/vscode/bin/code" "$HOME/.local/bin/code"

# Configure course IDE components.
echo "Configuring course IDE components..."
git config --global init.defaultBranch main
git config --global core.editor "code --wait"

# Install VS Code extensions.
echo "Installing code editor extensions..."
export NODE_NO_WARNINGS=1

code --install-extension ms-python.python --force
code --install-extension charliermarsh.ruff --force
code --install-extension hediet.vscode-drawio --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension i2p-hub.i2p-pseudo --force
code --install-extension cweijan.vscode-office --force

unset NODE_NO_WARNINGS

echo "Checking installed versions..."
git --version
gh --version
python --version
python -m pip --version
pytest --version
code --version

echo "===== Course IDE installation complete. ====="
echo "Before continuing, review the messages above."
echo "Look for words like Error, Failed, Exception, Access denied, or not found."
echo "Some errors may appear in red text, but text color can vary."
echo "If you do not see an error message, continue to the next step."
echo "If you see an error, see the Troubleshooting section of the IDE Guide."
echo "A setup log was saved to your Desktop as: it140_setup_log.txt."
echo "Close and reopen your terminal before continuing so PATH changes fully apply."

#!/usr/bin/env bash
#
# IT 140 Codio Virtual Desktop provisioning script
#
# Audience: SNHU Codio administrators
# Purpose: Provision a fresh Codio Virtual Desktop with the supported
#          IT 140 course development environment and desktop configuration.
#
# Run this script as the standard Codio desktop user. The script invokes sudo
# only for system-level package and repository changes. User-specific settings,
# VS Code extensions, desktop launchers, and logs are created for the account
# that runs the script.

set -Eeuo pipefail

LOG_DIR="$HOME/it140/logs"
LOG_FILE="$LOG_DIR/it140_setup_log.txt"

mkdir -p "$LOG_DIR"
exec > >(tee "$LOG_FILE") 2>&1

trap 'status=$?; echo "ERROR: Codio provisioning stopped at line $LINENO (exit $status). Review $LOG_FILE." >&2; exit "$status"' ERR

echo "Updating Ubuntu and installing repository prerequisites..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    curl \
    gpg

echo "Configuring vendor package repositories..."
sudo install -d -m 0755 /etc/apt/keyrings /etc/apt/sources.list.d

# Configure the official GitHub CLI APT repository.
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
sudo chmod 0644 /etc/apt/keyrings/githubcli-archive-keyring.gpg
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\n' \
    "$(dpkg --print-architecture)" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

# Configure the official Microsoft Visual Studio Code APT repository.
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
sudo chmod 0644 /usr/share/keyrings/microsoft.gpg
sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<EOF_VSCODE_REPO
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF_VSCODE_REPO

echo "Updating Ubuntu and installing the Codio course IDE..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get full-upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    direnv \
    git \
    gh \
    tree \
    python3 \
    python3-pip \
    python3-venv \
    code

echo "Configuring command-line tools..."
python3 -m pip install \
    --user \
    --upgrade \
    --break-system-packages \
    pytest \
    pytest-cov \
    ruff

USER_BIN="$(python3 -m site --user-base)/bin"
export PATH="$USER_BIN:$PATH"

# Persist the user-local executable path for future login sessions.
if ! grep -Fqs '$HOME/.local/bin' "$HOME/.profile"; then
    printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$HOME/.profile"
fi

# Apply course-standard Git defaults for the Codio user account.
git config --global init.defaultBranch main
git config --global core.editor "code --wait"

echo "Installing required VS Code extensions..."
for extension in \
    ms-python.python \
    charliermarsh.ruff \
    hediet.vscode-drawio \
    streetsidesoftware.code-spell-checker \
    i2p-hub.i2p-pseudo \
    cweijan.vscode-office
do
    echo "  Installing $extension"
    NODE_NO_WARNINGS=1 code --install-extension "$extension" --force
done

echo "Customizing the Codio course IDE desktop..."
DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || true)"
DESKTOP_DIR="${DESKTOP_DIR:-$HOME/Desktop}"
mkdir -p "$DESKTOP_DIR"

# Hide Xfce's built-in File System and Home desktop icons. Course-specific
# launchers are created below to reduce ambiguity for students.
for property in \
    /desktop-icons/file-icons/show-filesystem \
    /desktop-icons/file-icons/show-home
do
    xfconf-query \
        --channel xfce4-desktop \
        --property "$property" \
        --set false 2>/dev/null \
    || xfconf-query \
        --channel xfce4-desktop \
        --property "$property" \
        --create \
        --type bool \
        --set false
done

echo "Creating trusted course desktop icons..."

# Create an IT 140 folder launcher owned by the Codio user.
cat > "$DESKTOP_DIR/it140.desktop" <<EOF_IT140_LAUNCHER
[Desktop Entry]
Version=1.0
Type=Application
Name=it140
Comment=Open the IT 140 course directory
Exec=exo-open --launch FileManager "$HOME/it140"
Icon=folder
Terminal=false
StartupNotify=true
EOF_IT140_LAUNCHER

# Copy the system VS Code launcher to the user's desktop so it appears as a
# regular desktop icon rather than a symbolic link.
install -m 0755 \
    /usr/share/applications/code.desktop \
    "$DESKTOP_DIR/visual-studio-code.desktop"

chmod 0755 \
    "$DESKTOP_DIR/it140.desktop" \
    "$DESKTOP_DIR/visual-studio-code.desktop"

# Register the final launcher contents as trusted by Xfce. This must occur
# after all launcher content and permission changes are complete.
for launcher in \
    "$DESKTOP_DIR/it140.desktop" \
    "$DESKTOP_DIR/visual-studio-code.desktop"
do
    launcher_checksum="$(sha256sum "$launcher" | awk '{print $1}')"

    gio set \
        --type=string \
        "$launcher" \
        metadata::xfce-exe-checksum \
        "$launcher_checksum"
done

xfdesktop --reload 2>/dev/null || true

echo "Making VS Code the default editor for course file types..."
for mime_type in \
    text/plain \
    text/markdown \
    text/x-python \
    text/x-shellscript
do
    xdg-mime default code.desktop "$mime_type"
done

echo "Removing unneeded packages and cleaning package caches..."
sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

trap - ERR
echo "===== Codio course IDE provisioning completed successfully. ====="
echo "Setup log: $LOG_FILE"

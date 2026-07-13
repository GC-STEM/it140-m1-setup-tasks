<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Setup on Codio Virtual Desktop (CVD)

This folder is for Codio administrators. It is not for faculty or students. The instructions in this folder are for setting up the IT 140 development environment on the master Codio Virtual Desktop (CVD).

## 1. Open a Terminal Window

The next phase in setting up the course IDE on the master CVD is to open a **Terminal** window. You can do this by following these steps:

1. Press the **Super** key on your keyboard. The **Super** key is usually the Windows key or Command key, depending on your keyboard.

2. In the search box, start typing ***Terminal***. Select the **Terminal** app from the results when it appears.

<img src="./assets/11_search_for_terminal.png" alt="Search for Terminal">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="./assets/12_terminal_window.png" alt="Terminal Window">

**⚠️ IMPORTANT**. Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the Troubleshooting section of this guide for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 2. Copy and Paste Commands

1. Copy the entire code block below to your clipboard, including the final blank line.

```bash
bash <<'IT140_SETUP'
set -Eeuo pipefail

LOG_DIR="$HOME/it140/logs"
LOG_FILE="$LOG_DIR/it140_setup_log.txt"
mkdir -p "$LOG_DIR"
exec > >(tee "$LOG_FILE") 2>&1
trap 'status=$?; echo "ERROR: Codio provisioning stopped at line $LINENO (exit $status). Review $LOG_FILE." >&2; exit "$status"' ERR

echo "Updating Ubuntu and installing repository prerequisites..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl gpg

echo "Configuring vendor package repositories..."
sudo install -d -m 0755 /etc/apt/keyrings /etc/apt/sources.list.d

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
sudo chmod 0644 /etc/apt/keyrings/githubcli-archive-keyring.gpg
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\n' \
    "$(dpkg --print-architecture)" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
sudo chmod 0644 /usr/share/keyrings/microsoft.gpg
sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

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
if ! grep -Fqs '$HOME/.local/bin' "$HOME/.profile"; then
    printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$HOME/.profile"
fi

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

# Hide the default File System and Home desktop icons.
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

# Create a user-owned IT 140 folder launcher.
cat > "$DESKTOP_DIR/it140.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=it140
Comment=Open the IT 140 course directory
Exec=exo-open --launch FileManager "$HOME/it140"
Icon=folder
Terminal=false
StartupNotify=true
EOF

# Copy the VS Code launcher so it appears as a regular desktop icon.
install -m 0755 \
    /usr/share/applications/code.desktop \
    "$DESKTOP_DIR/visual-studio-code.desktop"

chmod 0755 \
    "$DESKTOP_DIR/it140.desktop" \
    "$DESKTOP_DIR/visual-studio-code.desktop"

# Register each launcher's current contents as trusted by Xfce.
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
IT140_SETUP

```

2. Paste the clipboard contents into the **Terminal** window at the command prompt.

3. Press **Enter** if the commands do not start automatically.

4. If prompted for your Linux password, type your password and press **Enter**. Your password may not appear on the screen while you type, which is normal.

5. Expect the commands to take 15–45 minutes, depending on your system and Internet speed.

6. If the script says the `code` command was not found, close Terminal, open a new Terminal window, and copy and paste the commands below:

```bash
code --install-extension ms-python.python --force
code --install-extension charliermarsh.ruff --force
code --install-extension hediet.vscode-drawio --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension i2p-hub.i2p-pseudo --force
code --install-extension cweijan.vscode-office --force

```

**⚠️ IMPORTANT**. Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the **Troubleshooting** section of this repository for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 3. Configure Local Course IDE

Follow the instructions in the [Codio README.md](../codio/README.md) file to configure your local course IDE. The procedures are the same for both Codio Virtual Desktop (CVD) and your local desktop, regardless of your operating system (OS) platform.

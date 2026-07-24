<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Local Setup on macOS

This document provides instructions for optionally setting up an IT 140 development environment, also called the course IDE, on modern Mac operating systems (macOS). It covers the installation of necessary software and tools needed to complete all course activities.

## 1. Back Up Your Mac

Before installing software, it is best practice to back up your Mac using **Time Machine** if you already have Time Machine configured. That way, you can recover your files and settings if something goes wrong during setup.

1. On your keyboard, hold down the **Command** (⌘) key and press the **Space** key to open **Spotlight** search.

2. In the search box, start typing ***Time Machine***. Select **Time Machine Settings** from the results when it appears.
<img src="./assets/11_search_for_time_machine.png" alt="Search for Time Machine">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="./assets/12_time_machine_settings.png" alt="Time Machine Settings">

3. If Time Machine is already configured, select **Back Up Now**.

4. If Time Machine is not configured, you may skip this step and continue. Time Machine usually requires an external drive or network backup location.

## 2. Open a Terminal Window

The next phase in setting up the course IDE on your local macOS machine is to open a **Terminal** window. You can do this by following these steps:

1. Hold down the **Command** (⌘) key on your keyboard and press the **Space** key to open **Spotlight** search.

2. In the search box, start typing ***Terminal***. Select the **Terminal** app from the results when it appears.
<img src="./assets/21_search_for_terminal.png" alt="Search for Terminal">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="./assets/22_terminal_window.png" alt="Terminal Window">

**⚠️ IMPORTANT**. Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the Troubleshooting section of this guide for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 3. Copy and Paste Commands

1. Copy the entire code block below to your clipboard, including the final blank line.

```bash
set -Eeuo pipefail
COURSE_DIR="$HOME/it140"
VENV_DIR="$COURSE_DIR/.venv"
LOG_DIR="$HOME/Desktop"
LOG_FILE="$LOG_DIR/it140_setup_log.txt"
mkdir -p "$LOG_DIR"
mkdir -p "$COURSE_DIR"
exec > >(tee "$LOG_FILE") 2>&1
trap 'status=$?; echo "ERROR: Setup failed near line $LINENO with exit status $status."; exit "$status"' ERR
echo "===== IT 140 Course IDE Setup ====="
echo "Started: $(date)"
echo
echo "Checking computer architecture and macOS version..."
echo "Architecture: $(uname -m)"
echo "macOS version: $(sw_vers -productVersion)"
echo
echo "Installing and updating system dependencies..."
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew was not found."
    echo "The Homebrew installer may request your macOS password."
    echo
    /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [[ -x "/opt/homebrew/bin/brew" ]]; then
    BREW_BIN="/opt/homebrew/bin/brew"
    BREW_INIT='eval "$(/opt/homebrew/bin/brew shellenv)"'
elif [[ -x "/usr/local/bin/brew" ]]; then
    BREW_BIN="/usr/local/bin/brew"
    BREW_INIT='eval "$(/usr/local/bin/brew shellenv)"'
else
    echo "ERROR: Homebrew was not found after installation."
    exit 1
fi
eval "$("$BREW_BIN" shellenv)"
touch "$HOME/.zprofile"
if ! grep -Fqx "$BREW_INIT" "$HOME/.zprofile"; then
    printf '\n%s\n' "$BREW_INIT" >> "$HOME/.zprofile"
fi
brew update
echo
echo "Installing course IDE components..."
brew install git gh python@3.12
brew install --cask visual-studio-code
hash -r
echo
echo "Creating the IT 140 Python 3.12 environment..."
python3.12 -m venv "$VENV_DIR"
"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install pytest pytest-cov ruff
echo
echo "Configuring Git..."
git config --global init.defaultBranch main
git config --global core.autocrlf input
git config --global push.autoSetupRemote true
git config --global core.editor "code --wait"
echo
echo "Installing Visual Studio Code extensions..."
EXTENSIONS=(
    "ms-python.python"
    "charliermarsh.ruff"
    "hediet.vscode-drawio"
    "i2p-hub.i2p-pseudo"
    "streetsidesoftware.code-spell-checker"
    "cweijan.vscode-office"
)
if ! command -v code >/dev/null 2>&1; then
    echo "ERROR: The 'code' command was not found."
    echo
    echo "Open Visual Studio Code."
    echo "Press Command+Shift+P."
    echo "Run: Shell Command: Install 'code' command in PATH"
    echo "Then reopen Terminal and run this script again."
    exit 1
fi
for extension in "${EXTENSIONS[@]}"; do
    echo "Installing extension: $extension"
    code --install-extension "$extension"
done
echo
echo "Verifying installed software..."
echo
brew --version | head -n 1
git --version
gh --version | head -n 1
python3.12 --version
"$VENV_DIR/bin/python" -m pip --version
"$VENV_DIR/bin/python" -m pytest --version
"$VENV_DIR/bin/ruff" --version
code --version | head -n 1
echo
echo "Verifying Visual Studio Code extensions..."
INSTALLED_EXTENSIONS="$(code --list-extensions)"
for extension in "${EXTENSIONS[@]}"; do
    if grep -Fqix "$extension" <<< "$INSTALLED_EXTENSIONS"; then
        echo "Installed: $extension"
    else
        echo "ERROR: Extension was not found after installation: $extension"
        exit 1
    fi
done
echo
echo "===== Course IDE installation complete. ====="
echo
echo "Python environment:"
echo "  $VENV_DIR"
echo
echo "To activate it manually, run:"
echo "  source \"$VENV_DIR/bin/activate\""
echo
echo "Before continuing, review the messages above."
echo "Look for words such as ERROR, Failed, Exception, Permission denied,"
echo "or command not found."
echo
echo "A setup log was saved to:"
echo "  $LOG_FILE"
echo
echo "Completed: $(date)"

```

2. Paste the clipboard contents into the **Terminal** window at the command prompt.

3. Press **Return** if the commands do not start automatically.

4. If prompted for your Mac password, type your password and press **Return**. Your password may not appear on the screen while you type, which is normal.

5. Expect the commands to take 15-45 minutes, depending on your system and Internet speed.

6. If the script says the `code` command was not found, complete these steps:

   1. Open **Visual Studio Code**.
   2. Press **Command** (⌘) + **Shift** + **P**.
   3. Type ***shell command***.
   4. Select **Shell Command: Install 'code' command in PATH**.
   5. Close Terminal.
   6. Open a new Terminal window.
   7. Copy and paste the commands below:

```bash
code --install-extension ms-python.python --force
code --install-extension charliermarsh.ruff --force
code --install-extension hediet.vscode-drawio --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension i2p-hub.i2p-pseudo --force
code --install-extension cweijan.vscode-office --force

```

**⚠️ IMPORTANT**. Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the **Troubleshooting** section of this repository for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 4. Configure Local Course IDE

Follow the instructions in the [Codio README.md](../codio/README.md) file to configure your local course IDE. The procedures are the same for both Codio Virtual Desktop (CVD) and your local desktop, regardless of your operating system (OS) platform.

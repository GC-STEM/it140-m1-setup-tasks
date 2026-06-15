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
exec > >(tee "$HOME/Desktop/it140_setup_log.txt") 2>&1
echo "Installing and updating system dependencies..."
if ! command -v brew >/dev/null 2>&1; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -x "/opt/homebrew/bin/brew" ]; then
eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
eval "$(/usr/local/bin/brew shellenv)"
fi
brew update
echo "Installing course IDE components..."
brew install git
brew install gh
brew install python@3.12
brew install --cask visual-studio-code
echo "Configuring course IDE components..."
python3.12 -m pip install --upgrade pip pytest pytest-cov ruff
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
echo "Installing code editor extensions..."
if ! command -v code >/dev/null 2>&1; then
echo "The 'code' command was not found."
echo "Open VS Code, press Command+Shift+P, type: shell command"
echo "Select: Shell Command: Install 'code' command in PATH"
echo "Then close Terminal, open a new Terminal window, and run the extension commands listed below."
else
code --install-extension ms-python.python --force
code --install-extension charliermarsh.ruff --force
code --install-extension hediet.vscode-drawio --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension i2p-hub.i2p-pseudo --force
code --install-extension cweijan.vscode-office --force
fi
echo "===== Course IDE installation complete. ====="
echo "Before continuing, review the messages above."
echo "Look for words like Error, Failed, Exception, Permission denied, or command not found."
echo "Some errors may appear in red text, but text color can vary."
echo "If you do not see an error message, continue to the next step."
echo "If you see an error, see the Troubleshooting section of the setup repo."
echo "A setup log was saved to your Desktop as: it140_setup_log.txt."

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

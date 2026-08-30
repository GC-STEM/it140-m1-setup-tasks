<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Local Setup on Linux

This document provides instructions for optionally setting up an IT 140 development environment, also called the course IDE, on Debian-based Linux operating systems, such as Debian, Ubuntu, Linux Mint, Pop!_OS, and Raspberry Pi OS. It covers the installation of necessary software and tools needed to complete all course activities.

## Activity Metadata

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Local Setup | Linux
- **Activity Type**: Optional, non-graded, no submission
- **Activity Purpose**: Prepare the IT 140 development environment for completing course assignments on your local Linux computer.
- **Activity Description**: This activity provides instructions for installing and configuring the IT 140 development environment (course IDE) on your local Linux computer. The course IDE is a pre-configured development environment that includes all the tools, libraries, and settings needed to complete course assignments. Installing the course IDE locally allows you to work on assignments without relying on an internet connection or a remote server.
- **Artifact Version**: 1.0.2
- **Artifact Date-Time Group**: 2026-08-30-12-56
- **Development Status**: Pilot — Active Development

## 1. Open a Terminal Window

The next phase in setting up the course IDE on your local Linux machine is to open a **Terminal** window. You can do this by following these steps:

1. Press the **Super** key on your keyboard. The **Super** key is usually the Windows key or Command key, depending on your keyboard.

2. In the search box, start typing ***Terminal***. Select the **Terminal** app from the results when it appears.

    **⚠️ IMPORTANT**. Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the Troubleshooting section of this guide for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 2. Install the Course IDE on Your Local Linux Machine

1. Copy the entire code block below to your clipboard, including the final blank line.

    ```bash
    mkdir -p "$HOME/Desktop"
    exec > >(tee "$HOME/Desktop/it140_setup_log.txt") 2>&1
    echo "Installing and updating system dependencies..."
    sudo apt update
    sudo apt install -y curl wget gpg ca-certificates apt-transport-https software-properties-common
    echo "Adding package repositories..."
    sudo mkdir -p -m 755 /etc/apt/keyrings
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null
    sudo chmod go+r /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
    sudo apt update
    echo "Installing course IDE components..."
    sudo apt install -y git gh python3 python3-pip python3-venv code
    echo "Configuring course IDE components..."
    python3 -m pip install --user --upgrade --break-system-packages pip pytest pytest-cov ruff || python3 -m pip install --user --upgrade pip pytest pytest-cov ruff
    mkdir -p "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
    if ! grep -qs 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.profile"; then echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"; fi
    git config --global init.defaultBranch main
    git config --global core.editor "code --wait"
    echo "Installing code editor extensions..."
    code --install-extension ms-python.python --force
    code --install-extension charliermarsh.ruff --force
    code --install-extension hediet.vscode-drawio --force
    code --install-extension streetsidesoftware.code-spell-checker --force
    code --install-extension i2p-hub.i2p-pseudo --force
    code --install-extension cweijan.vscode-office --force
    echo "===== Course IDE installation complete. ====="
    echo "Before continuing, review the messages above."
    echo "Look for words like Error, Failed, Exception, Permission denied, or command not found."
    echo "Some errors may appear in red text, but text color can vary."
    echo "If you do not see an error message, continue to the next step."
    echo "If you see an error, see the Troubleshooting section of the setup repo."
    echo "A setup log was saved to your Desktop as: it140_setup_log.txt."

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

Continue with the [Manual Local Setup Instructions](../README.md#manual-local-setup-instructions) to complete the remaining local configuration steps, including your Git identity, GitHub CLI authentication, opening your `Repos` folder in VS Code, and the final ready check. You can skip software-installation steps that you already completed above.<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

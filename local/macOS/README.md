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

   > [!IMPORTANT]
   > Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the Troubleshooting section of this guide for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 3. Install the Course IDE on macOS

1. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below.

   ```bash
   /bin/bash -c "$(cat <<'IT140_SETUP'
   set -Eeuo pipefail
   COURSE_DIR="$HOME/it140"
   VENV_DIR="$COURSE_DIR/.venv"
   LOG_DIR="$HOME/Desktop"
   LOG_FILE="$LOG_DIR/it140_setup_log.txt"
   mkdir -p "$LOG_DIR" "$COURSE_DIR"
   exec > >(tee "$LOG_FILE") 2>&1
   handle_error() {
      local status="$1"
      local failed_command="$2"
      trap - ERR
      printf '\n============================================================\n'
      printf 'IT 140 setup stopped before it finished.\n'
      printf '============================================================\n'
      printf '\nThe command that reported the problem was:\n'
      printf '  %s\n' "$failed_command"
      printf '\nDo not worry—your computer has not been reset or erased.\n'
      printf 'Review the messages immediately above this notice.\n'
      printf '\nA setup log was saved to:\n'
      printf '  %s\n' "$LOG_FILE"
      printf '\nUse the Troubleshooting section of the setup activity for help.\n'
      exit "$status"
   }
   trap 'handle_error "$?" "$BASH_COMMAND"' ERR
   show_step() {
      printf '\n------------------------------------------------------------\n'
      printf 'Step %s of 7: %s\n' "$1" "$2"
      printf '%s\n' '------------------------------------------------------------'
   }
   printf '============================================================\n'
   printf 'IT 140 Course IDE Setup for macOS\n'
   printf '============================================================\n'
   printf '\nThis command set installs and configures the software used in\n'
   printf 'IT 140. Some steps may take several minutes.\n'
   printf '\nSetup started: %s\n' "$(date)"
   printf 'Setup log: %s\n' "$LOG_FILE"
   show_step 1 "Checking your Mac"
   printf 'Computer architecture: %s\n' "$(uname -m)"
   printf 'macOS version: %s\n' "$(sw_vers -productVersion)"
   show_step 2 "Preparing Homebrew"
   if ! command -v brew >/dev/null 2>&1; then
      printf 'Homebrew is not installed. Its installer will open now.\n'
      printf '\nYou may be asked for your Mac login password.\n'
      printf 'When you type the password, Terminal will not display dots,\n'
      printf 'asterisks, or other characters. This is normal.\n'
      printf '\nFollow the instructions displayed by the Homebrew installer.\n'
      printf 'The installation may take several minutes.\n'
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   else
      printf 'Homebrew is already installed.\n'
   fi
   if [[ -x "/opt/homebrew/bin/brew" ]]; then
      BREW_BIN="/opt/homebrew/bin/brew"
   elif [[ -x "/usr/local/bin/brew" ]]; then
      BREW_BIN="/usr/local/bin/brew"
   else
      printf 'ERROR: Homebrew could not be found after installation.\n'
      exit 1
   fi
   eval "$("$BREW_BIN" shellenv)"
   BREW_INIT="eval \"\$($BREW_BIN shellenv)\""
   touch "$HOME/.zprofile"
   if ! grep -Fqx "$BREW_INIT" "$HOME/.zprofile"; then
      printf '\n%s\n' "$BREW_INIT" >> "$HOME/.zprofile"
      printf 'Homebrew was added to your Terminal configuration.\n'
   else
      printf 'Homebrew is already in your Terminal configuration.\n'
   fi
   printf 'Checking for current Homebrew software information...\n'
   brew update
   show_step 3 "Installing the course software"
   printf 'Installing Git, GitHub CLI, and Python 3.12...\n'
   brew install git gh python@3.12
   printf '\nInstalling Visual Studio Code...\n'
   brew install --cask visual-studio-code
   hash -r
   show_step 4 "Creating the course Python environment"
   if [[ -x "$VENV_DIR/bin/python" ]]; then
      printf 'An IT 140 Python environment already exists.\n'
      printf 'Its course packages will be checked and updated.\n'
   else
      printf 'Creating an isolated Python environment for IT 140...\n'
      python3.12 -m venv "$VENV_DIR"
   fi
   printf 'Installing the Python testing and code-quality tools...\n'
   "$VENV_DIR/bin/python" -m pip install --upgrade pip pytest pytest-cov ruff
   show_step 5 "Configuring Git"
   git config --global init.defaultBranch main
   git config --global core.autocrlf input
   git config --global push.autoSetupRemote true
   if command -v code >/dev/null 2>&1; then
      CODE_BIN="$(command -v code)"
   elif [[ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]]; then
      CODE_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
   else
      printf 'ERROR: Visual Studio Code was installed, but its command-line tool could not be found.\n'
      exit 1
   fi
   git config --global core.editor "\"$CODE_BIN\" --wait"
   printf 'Git was configured with course-friendly default settings.\n'
   show_step 6 "Installing Visual Studio Code extensions"
   EXTENSIONS=(
      "Python language support|ms-python.python"
      "Ruff code linter and formatter|charliermarsh.ruff"
      "Draw.io diagram support|hediet.vscode-drawio"
      "I2P pseudocode support|i2p-hub.i2p-pseudo"
      "Code Spell Checker|streetsidesoftware.code-spell-checker"
      "Office and PDF file viewers|cweijan.vscode-office"
   )
   for extension_entry in "${EXTENSIONS[@]}"; do
      extension_name="${extension_entry%%|*}"
      extension_id="${extension_entry#*|}"
      printf '\nInstalling: %s\n' "$extension_name"
      "$CODE_BIN" --install-extension "$extension_id"
   done
   show_step 7 "Verifying the installation"
   printf '\nInstalled software versions:\n\n'
   brew --version | sed -n '1p'
   git --version
   gh --version | sed -n '1p'
   python3.12 --version
   "$VENV_DIR/bin/python" -m pip --version
   "$VENV_DIR/bin/python" -m pytest --version
   "$VENV_DIR/bin/ruff" --version
   "$CODE_BIN" --version | sed -n '1p'
   printf '\nChecking Visual Studio Code extensions:\n\n'
   INSTALLED_EXTENSIONS="$("$CODE_BIN" --list-extensions)"
   for extension_entry in "${EXTENSIONS[@]}"; do
      extension_name="${extension_entry%%|*}"
      extension_id="${extension_entry#*|}"
      if grep -Fqix -- "$extension_id" <<< "$INSTALLED_EXTENSIONS"; then
         printf 'Installed: %s\n' "$extension_name"
      else
         printf 'ERROR: The following extension was not found: %s\n' "$extension_name"
         exit 1
      fi
   done
   printf '\n============================================================\n'
   printf 'IT 140 course IDE setup completed successfully.\n'
   printf '============================================================\n'
   printf '\nNo installation errors were detected.\n'
   printf '\nYour IT 140 course folder is:\n'
   printf '  %s\n' "$COURSE_DIR"
   printf '\nYour Python 3.12 environment is:\n'
   printf '  %s\n' "$VENV_DIR"
   printf '\nThe setup log was saved to:\n'
   printf '  %s\n' "$LOG_FILE"
   printf '\nGitHub CLI is installed, but this setup does not sign you in\n'
   printf 'to GitHub. Complete the GitHub sign-in step when instructed.\n'
   printf '\nSetup completed: %s\n' "$(date)"
   IT140_SETUP
   )"
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

> [!IMPORTANT]
> Do NOT proceed with the next phase of the installation until you successfully complete this step. Refer to the **Troubleshooting** section of this repository for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 4. Configure Local Course IDE

Follow the instructions in the [Codio README.md](../codio/README.md) file to configure your local course IDE. The procedures are the same for both Codio Virtual Desktop (CVD) and your local desktop, regardless of your operating system (OS) platform.

# Copy all the commands below, including the final blank line, and paste them into a macOS Terminal command prompt. Expect the commands to take 15 to 45 minutes to complete, depending on your system and internet connection.


LOG_FILE="$HOME/Desktop/it140_setup_log.txt"
exec > >(tee -a "$LOG_FILE") 2>&1
echo "Installing and updating system dependencies..."
if ! command -v brew >/dev/null 2>&1; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; elif [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
brew update
echo "Installing course IDE components..."
brew install git gh python@3.12
brew install --cask visual-studio-code
echo "Updating the terminal environment..."
if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; elif [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
echo "Configuring course IDE components..."
python3.12 -m ensurepip --upgrade
python3.12 -m pip install --upgrade pip pytest
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
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
python3.12 --version
python3.12 -m pip --version
pytest --version
code --version
echo "===== Course IDE installation complete. ====="
echo "Before continuing, review the messages above."
echo "Look for words like Error, Failed, Exception, Access denied, or not found."
echo "Some errors may appear in red text, but text color can vary."
echo "If you do not see an error message, continue to the next step."
echo "If you see an error, see the Troubleshooting section of the IDE Guide."
echo "A setup log was saved to your Desktop as: it140_setup_log.txt."
<# Copy all the commands below, including the final blank line, and
paste them into an 'Administrator: Windows PowerShell' terminal command
prompt. Expect the commands to take 15 to 45 minutes to complete,
depending on your system and . #>

Start-Transcript -Path "$env:USERPROFILE\Desktop\it140_setup_log.txt" -Force
# Installing and updating system dependencies...
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Repair-WinGetPackageManager -AllUsers
winget source update
# Installing course IDE components...
winget install --id Git.Git -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
winget install --id GitHub.cli -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
winget install --id Python.Python.3.12 -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
winget install --id Microsoft.VisualStudioCode -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
# Updating the terminal environment...
[System.Environment]::GetEnvironmentVariables('Machine').GetEnumerator() | ForEach-Object { Set-Item -Path "Env:\$($_.Key)" -Value $_.Value }; [System.Environment]::GetEnvironmentVariables('User').GetEnumerator() | ForEach-Object { Set-Item -Path "Env:\$($_.Key)" -Value $_.Value }; $env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')
# Configuring course IDE components...
python.exe -m pip install --upgrade pip pytest
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
# Installing code editor extensions...
$env:NODE_NO_WARNINGS = "1"
code --install-extension ms-python.python --force
code --install-extension charliermarsh.ruff --force
code --install-extension hediet.vscode-drawio --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension i2p-hub.i2p-pseudo --force
code --install-extension cweijan.vscode-office --force
Remove-Item Env:NODE_NO_WARNINGS -ErrorAction SilentlyContinue
# ===== Course IDE installation complete. =====
# Before continuing, review the messages above.
# Look for words like Error, Failed, Exception, Access denied, or not recognized.
# Some errors may appear in red text, but text color can vary.
# If you do not see an error message, continue to the next step.
# If you see an error, see the Troubleshooting section of the IDE Guide.
# A setup log was saved to your Desktop as: it140_setup_log.txt.
# Detailed WinGet logs are available if tech support needs them; run: winget --logs.
Stop-Transcript

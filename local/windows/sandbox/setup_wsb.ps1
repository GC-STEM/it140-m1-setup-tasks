# Copy and paste the following commands into a Windows Sandbox PowerShell: Administrator terminal to install the IT140 course IDE. The commands took 30 minutes to complete on test machine.

Start-Transcript -Path "$env:USERPROFILE\Desktop\it140_setup.log" -Force
try {
$ErrorActionPreference = 'Stop'
$TempDir = Join-Path $env:TEMP 'winget-install'
$DependenciesZip = Join-Path $TempDir 'DesktopAppInstaller_Dependencies.zip'
$WingetBundle = Join-Path $TempDir 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
$DependenciesDir = Join-Path $TempDir 'Dependencies'
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
Write-Host "Downloading WinGet dependencies and installer..."
if (!(Test-Path $DependenciesZip)) {
curl.exe --location --fail --show-error --retry 10 --retry-delay 5 --retry-all-errors --continue-at - --output "$DependenciesZip.part" 'https://github.com/microsoft/winget-cli/releases/latest/download/DesktopAppInstaller_Dependencies.zip'
if ($LASTEXITCODE -ne 0) { throw "WinGet dependencies download failed with curl exit code $LASTEXITCODE." }
Move-Item "$DependenciesZip.part" $DependenciesZip -Force
}
if (!(Test-Path $WingetBundle)) {
curl.exe --location --fail --show-error --retry 10 --retry-delay 5 --retry-all-errors --continue-at - --output "$WingetBundle.part" 'https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
if ($LASTEXITCODE -ne 0) { throw "WinGet download failed with curl exit code $LASTEXITCODE." }
Move-Item "$WingetBundle.part" $WingetBundle -Force
}
if (Test-Path $DependenciesDir) { Remove-Item $DependenciesDir -Recurse -Force }
Write-Host "Installing WinGet dependencies and installer..."
Expand-Archive -Path $DependenciesZip -DestinationPath $DependenciesDir -Force
Get-ChildItem -Path $DependenciesDir -Recurse -File | Where-Object { $_.Extension -in '.appx','.msix' -and $_.FullName -match '(?i)x64' } | ForEach-Object { Add-AppxPackage -Path $_.FullName }
Add-AppxPackage -Path $WingetBundle
winget source update --disable-interactivity
Write-Host "Installing IT140 course IDE dependencies..."
if ($LASTEXITCODE -ne 0) { throw "WinGet source update failed with exit code $LASTEXITCODE." }
winget install --id Git.Git -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements
if ($LASTEXITCODE -ne 0) { throw "Git installation failed with exit code $LASTEXITCODE." }
winget install --id GitHub.cli -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements
if ($LASTEXITCODE -ne 0) { throw "GitHub CLI installation failed with exit code $LASTEXITCODE." }
winget install --id Python.Python.3.12 -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements
if ($LASTEXITCODE -ne 0) { throw "Python installation failed with exit code $LASTEXITCODE." }
winget install --id Microsoft.VisualStudioCode -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements
if ($LASTEXITCODE -ne 0) { throw "Visual Studio Code installation failed with exit code $LASTEXITCODE." }
$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')
Write-Host "Installing Python packages..."
py.exe -3.12 -m pip install --upgrade pip pytest pytest-cov ruff
if ($LASTEXITCODE -ne 0) { throw "Python package installation failed with exit code $LASTEXITCODE." }
Write-Host "Configuring Git..."
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
Write-Host "Installing Visual Studio Code extensions..."
$env:NODE_NO_WARNINGS = '1'
code.cmd --install-extension ms-python.python --force
code.cmd --install-extension charliermarsh.ruff --force
code.cmd --install-extension hediet.vscode-drawio --force
code.cmd --install-extension streetsidesoftware.code-spell-checker --force
code.cmd --install-extension i2p-hub.i2p-pseudo --force
code.cmd --install-extension cweijan.vscode-office --force
Remove-Item Env:NODE_NO_WARNINGS -ErrorAction SilentlyContinue
Write-Host "IT140 course IDE installation completed successfully."
winget --version
git --version
gh --version
py.exe -3.12 --version
code.cmd --version
}
finally {
Stop-Transcript -ErrorAction SilentlyContinue
}

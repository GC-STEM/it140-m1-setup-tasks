# Launch IT 140 Full IDE Windows Sandbox from the current repo folder.

$repoPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$templatePath = Join-Path $repoPath "it140_ide_template.wsb"
$generatedPath = Join-Path $repoPath "it140_ide_generated.wsb"

$template = Get-Content $templatePath -Raw
$wsb = $template.Replace("{{REPO_PATH}}", $repoPath)

Set-Content -Path $generatedPath -Value $wsb -Encoding UTF8

Start-Process $generatedPath
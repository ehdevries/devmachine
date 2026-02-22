### Set-ExecutionPolicy Bypass -Scope Process -Force; .\install-windows-essentials.ps1

Write-Output ""
Write-Output "Installing Git"
Write-Output ""
winget install --id git.git --interactive

Write-Output ""
Write-Output "Installing Nushell"
Write-Output ""
winget install --id nushell.nushell --interactive

Write-Output ""
Write-Output "Setting environment variables"
Write-Output ""
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "true", 1)
[Environment]::SetEnvironmentVariable("YAZI_FILE_ONE", "C:\Program Files\Git\usr\bin\file.exe", 1)

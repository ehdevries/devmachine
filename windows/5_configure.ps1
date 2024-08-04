### Set-ExecutionPolicy Bypass -Scope Process -Force; .\5_configure.ps1

# Locations of my configuration files and scripts - change as needed
$configDir = "$home\source\devconfig\config"
$scriptDir = "$home\source\devconfig\scripts"

Write-Output ""
Write-Output "Restoring configuration files"
Write-Output ""
Copy-Item -Path $configDir\.gitconfig                             -Destination $home                             -PassThru | Split-Path -Leaf
Copy-Item -Path $configDir\.wezterm.lua                           -Destination $home                             -PassThru | Split-Path -Leaf
Copy-Item -Path $configDir\.wslconfig                             -Destination $home                             -PassThru | Split-Path -Leaf
Copy-Item -Path $configDir\lfrc                                   -Destination $home\AppData\Local\lf            -PassThru | Split-Path -Leaf
Copy-Item -Path $configDir\smtp4dev\appsettings.json              -Destination $env:APPDATA\smtp4dev             -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\AzureDataStudio\*.json | Copy-Item -Destination $env:APPDATA\azuredatastudio\User -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\Helix\*.toml           | Copy-Item -Destination $env:APPDATA\helix                -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\Nushell\*.nu           | Copy-Item -Destination $env:APPDATA\nushell              -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\PowerShell\*.ps1       | Copy-Item -Destination $home\Documents\PowerShell        -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\PowerShell\*.ps1       | Copy-Item -Destination $home\Documents\WindowsPowerShell -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\VSCode\*.json          | Copy-Item -Destination $env:APPDATA\Code\User            -PassThru | Split-Path -Leaf

Write-Output ""
Write-Output "Restoring scripts"
Write-Output ""
if (!(Test-Path -Path "$home\.scripts")) {
  New-Item -Path $home -Name ".scripts" -ItemType "directory"
}
Get-ChildItem -Path $scriptDir | Copy-Item -Destination "$home\.scripts" -PassThru | Split-Path -Leaf

Write-Output ""
Write-Output "Adding posh-git to all console hosts"
Add-PoshGitToProfile -AllHosts

Write-Output ""
Write-Output "Adding Windows-specific Git configuration"
git config --global core.autocrlf true
git config --global core.whitespace cr-at-eol

Write-Output ""
Write-Output "All done!"

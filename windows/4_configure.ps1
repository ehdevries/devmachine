### Set-ExecutionPolicy Bypass -Scope Process -Force; .\4_configure.ps1

$configDir = "$home\source\devconfig\config"  # Location of my configuration files - change as needed

Write-Output ""
Write-Output "Restoring the following configuration files:"
Write-Output ""
Copy-Item -Path "$configDir\.gitconfig"     -Destination $home            -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\starship.toml"  -Destination "$home\.config"  -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\Vim\.gvimrc"    -Destination "$home\_gvimrc"  -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\Vim\.vimrc"     -Destination "$home\_vimrc"   -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\AzureDataStudio\*.json  | Copy-Item -Destination "$env:APPDATA\azuredatastudio\User" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\Nushell\*.toml          | Copy-Item -Destination "$env:APPDATA\nushell\nu\config"    -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\VSCode\*.json           | Copy-Item -Destination "$env:APPDATA\Code\User"            -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\WindowsPowerShell\*.ps1 | Copy-Item -Destination "$home\Documents\WindowsPowerShell" -PassThru | Split-Path -Leaf

Write-Output ""
Write-Output "Adding posh-git to all console hosts"
Add-PoshGitToProfile -AllHosts

Write-Output ""
Write-Output "Adding Windows-specific Git configuration"
git config --global core.autocrlf true
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -nosession"

Write-Output ""
Write-Output "All done!"

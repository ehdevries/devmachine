### Restore configuration files and install extensions
### This script does not require an administrative shell

# Location of my configuration files
$configDir = "$home\Source\devconfig\config"

# Install VS Code extensions
Write-Output ""
Write-Output "Installing VS Code extensions"
code --install-extension Angular.ng-template
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.editorconfig
code --install-extension eg2.tslint
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.angular-essentials
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension PKief.material-icon-theme

# Copy config files to their normal directories
Write-Output ""
Write-Output "Restoring the following configuration files"
Copy-Item -Path "$configDir\.gitconfig" -Destination $home -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\.hyper.js" -Destination $home -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\servers.rdg" -Destination $home -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\SqlOps\*.json | Copy-Item -Destination "$env:APPDATA\azuredatastudio\User" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\VSCode\*.json | Copy-Item -Destination "$env:APPDATA\Code\User" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\WindowsPowerShell\*.ps1 | Copy-Item -Destination "$home\Documents\WindowsPowerShell" -PassThru | Split-Path -Leaf

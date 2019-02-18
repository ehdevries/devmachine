### Restore configuration files and install extensions & tools
### This script does not require an administrative shell

Write-Output ""
Write-Output "Installing VS Code extensions"
code --install-extension Angular.ng-template
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension glen-84.sass-lint
code --install-extension johnpapa.angular-essentials
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension nrwl.angular-console
code --install-extension PKief.material-icon-theme
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy

Write-Output ""
Write-Output "Installing npm global tools"
npm install -g @angular/cli
npm install -g sass-lint
npm install -g typescript

$configDir = "$home\Source\devconfig\config"  # Location of my configuration files - change as needed
Write-Output ""
Write-Output "Restoring the following configuration files"
Copy-Item -Path "$configDir\.gitconfig"  -Destination $home -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\servers.rdg" -Destination $home -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\.hyper.js"   -Destination "$env:APPDATA\Hyper" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\AzureDataStudio\*.json  | Copy-Item -Destination "$env:APPDATA\azuredatastudio\User" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\VSCode\*.json           | Copy-Item -Destination "$env:APPDATA\Code\User"            -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\WindowsPowerShell\*.ps1 | Copy-Item -Destination "$home\Documents\WindowsPowerShell" -PassThru | Split-Path -Leaf

Write-Output ""
Write-Output "Adding posh-git to all console hosts"
Add-PoshGitToProfile -AllHosts
# pwsh -Command "& {Add-PoshGitToProfile -AllHosts}"

Write-Output ""
Write-Output "Adding Windows-specific Git configuration"
git config --global core.autocrlf true
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -nosession"
git config --global credential.helper manager

Write-Output ""
Write-Output "All done!"

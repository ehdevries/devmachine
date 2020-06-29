### Set-ExecutionPolicy Bypass -Scope Process -Force; .\4_configure.ps1

Write-Output ""
Write-Output "Installing VS Code extensions"

# Common
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension davidanson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension pkief.material-icon-theme
code --install-extension robbowen.synthwave-vscode

# .NET
code --install-extension adrianwilczynski.user-secrets
code --install-extension ms-dotnettools.csharp
code --install-extension ionide.ionide-fsharp

# Web dev
code --install-extension angular.ng-template
code --install-extension burkeholland.simple-react-snippets
code --install-extension eg2.vscode-npm-script
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension glen-84.sass-lint
code --install-extension johnpapa.angular-essentials
code --install-extension nrwl.angular-console

# Windows
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode-remote.vscode-remote-extensionpack

# Other Languages
code --install-extension ms-python.python
code --install-extension rust-lang.rust
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy

Write-Output ""
Write-Output "Installing npm global tools"
npm install -g @angular/cli
npm install -g sass-lint
npm install -g typescript

Write-Output ""
Write-Output "Installing dotnet global tools"
dotnet tool install -g dotnet-ef
dotnet tool install -g fake-cli

$configDir = "$home\source\devconfig\config"  # Location of my configuration files - change as needed
Write-Output ""
Write-Output "Restoring the following configuration files"
Copy-Item -Path "$configDir\.gitconfig"     -Destination $home            -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\starship.toml"  -Destination "$home\.config"  -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\Vim\.gvimrc"    -Destination "$home\_gvimrc"  -PassThru | Split-Path -Leaf
Copy-Item -Path "$configDir\Vim\.vimrc"     -Destination "$home\_vimrc"   -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\AzureDataStudio\*.json  | Copy-Item -Destination "$env:APPDATA\azuredatastudio\User" -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\VSCode\*.json           | Copy-Item -Destination "$env:APPDATA\Code\User"            -PassThru | Split-Path -Leaf
Get-ChildItem -Path $configDir\WindowsPowerShell\*.ps1 | Copy-Item -Destination "$home\Documents\WindowsPowerShell" -PassThru | Split-Path -Leaf

Write-Output ""
Write-Output "Adding posh-git to all console hosts"
Add-PoshGitToProfile -AllHosts

Write-Output ""
Write-Output "Adding Windows-specific Git configuration"
git config --global core.autocrlf true
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -nosession"
git config --global credential.helper manager

Write-Output ""
Write-Output "All done!"

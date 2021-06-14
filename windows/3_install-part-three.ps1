### Set-ExecutionPolicy Bypass -Scope Process -Force; .\3_install-part-three.ps1

Write-Output ""
Write-Output "Installing posh-git for Windows PowerShell"
Write-Output ""
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

Write-Output ""
Write-Output "Installing VS Code extensions"
Write-Output ""

# Common
code --install-extension be5invis.toml
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension davidanson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension pflannery.vscode-versionlens
code --install-extension pkief.material-icon-theme

# Themes
code --install-extension liviuschera.noctis
code --install-extension robbowen.synthwave-vscode

# .NET
code --install-extension adrianwilczynski.user-secrets
code --install-extension ms-dotnettools.csharp
code --install-extension ionide.ionide-fsharp

# Web dev
code --install-extension angular.ng-template
code --install-extension burkeholland.simple-react-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension eg2.vscode-npm-script
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension johnpapa.angular-essentials
code --install-extension nrwl.angular-console

# Docker
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers

# Windows
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode-remote.remote-wsl

# Other Languages
code --install-extension ms-python.python
code --install-extension rust-lang.rust
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy
code --install-extension thenuprojectcontributors.vscode-nushell-lang

Write-Output ""
Write-Output "Installing npm global tools"
Write-Output ""
npm install -g @angular/cli
npm install -g typescript

Write-Output ""
Write-Output "Installing dotnet global tools"
Write-Output ""
dotnet tool install -g dotnet-ef

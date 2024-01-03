### Set-ExecutionPolicy Bypass -Scope Process -Force; .\3_install-part-three.ps1

Write-Output ""
Write-Output "Installing VS Code extensions"
Write-Output ""

# Common
code --install-extension be5invis.toml
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

# Docs
code --install-extension bierner.markdown-mermaid
code --install-extension davidanson.vscode-markdownlint
code --install-extension marp-team.marp-vscode
code --install-extension ms-dotnettools.dotnet-interactive-vscode

# .NET
code --install-extension adrianwilczynski.user-secrets
code --install-extension ms-dotnettools.csharp
code --install-extension ionide.ionide-fsharp

# Web dev
code --install-extension angular.ng-template
code --install-extension burkeholland.simple-react-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension meganrogge.template-string-converter

# Docker & WSL
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-wsl

# Other Languages
code --install-extension ms-python.python
code --install-extension ms-vscode.powershell
code --install-extension rust-lang.rust-analyzer
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy
code --install-extension thenuprojectcontributors.vscode-nushell-lang

Write-Output ""
Write-Output "Installing Azure Data Studio extensions"
Write-Output ""

azuredatastudio --install-extension microsoft.profiler
azuredatastudio --install-extension microsoft.schema-compare
azuredatastudio --install-extension microsoft.sql-database-projects
azuredatastudio --install-extension seanprice.simple-data-scripter
azuredatastudio --install-extension wsrpublishing.poor-sql-formatter

Write-Output ""
Write-Output "Installing npm global tools"
Write-Output ""
npm install -g @angular/cli

Write-Output ""
Write-Output "Installing dotnet global tools"
Write-Output ""
dotnet tool install -g csharp-ls
dotnet tool install -g csharprepl
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-tools-outdated
dotnet tool install -g rnwood.smtp4dev

Write-Output ""
Write-Output "Installing Rust global tools"
Write-Output ""
rustup component add rust-analyzer

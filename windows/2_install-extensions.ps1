### Set-ExecutionPolicy Bypass -Scope Process -Force; .\2_install-extensions.ps1

echo ""
echo "Installing VS Code extensions"
echo ""

# Common
code --install-extension be5invis.toml
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

# .NET
code --install-extension adrianwilczynski.user-secrets
code --install-extension csharpier.csharpier-vscode
code --install-extension ms-dotnettools.csharp
code --install-extension ionide.ionide-fsharp

# Web dev
code --install-extension angular.ng-template
code --install-extension dbaeumer.vscode-eslint
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension meganrogge.template-string-converter

# Docker & WSL
code --install-extension docker.docker
code --install-extension ms-azuretools.vscode-containers
code --install-extension ms-vscode-remote.remote-wsl

# Other Languages
code --install-extension ms-mssql.mssql
code --install-extension ms-vscode.powershell
code --install-extension rust-lang.rust-analyzer
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy
code --install-extension thenuprojectcontributors.vscode-nushell-lang

echo ""
echo "Installing Azure Data Studio extensions"
echo ""

azuredatastudio --install-extension microsoft.profiler
azuredatastudio --install-extension microsoft.schema-compare
azuredatastudio --install-extension microsoft.sql-database-projects
azuredatastudio --install-extension seanprice.simple-data-scripter
azuredatastudio --install-extension wsrpublishing.poor-sql-formatter

echo ""
echo "Installing npm global tools"
echo ""
npm install -g @angular/cli
npm install -g @angular/language-server
npm install -g typescript
npm install -g typescript-language-server
npm install -g vscode-langservers-extracted

echo ""
echo "Installing dotnet global tools"
echo ""
dotnet tool install -g csharpier
dotnet tool install -g csharp-ls
dotnet tool install -g csharprepl
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-tools-outdated
dotnet tool install -g rnwood.smtp4dev
dotnet tool install -g roslyn-language-server --prerelease

echo ""
echo "Trusting dotnet dev certificate"
echo ""
dotnet dev-certs https --trust

echo ""
echo "Installing Rust global tools"
echo ""
rustup component add rust-analyzer

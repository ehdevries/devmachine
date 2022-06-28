# before you run this script, make it executable: chmod +x full-ubuntu-3_configure.sh

# Step 3: configure installed software

cd

echo
echo "Installing VS Code extensions"
echo

# Common
code --install-extension be5invis.toml
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
code --install-extension nrwl.angular-console

# Docker
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers

# Other Languages
code --install-extension ms-python.python
code --install-extension rust-lang.rust-analyzer
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy
code --install-extension thenuprojectcontributors.vscode-nushell-lang

echo
echo "Installing npm global tools"
echo
npm install -g @angular/cli

echo
echo "Installing dotnet global tools"
echo
dotnet tool install -g dotnet-ef
dotnet tool install -g Rnwood.Smtp4dev

echo

# Locations of my configuration files and scripts - change as needed
configDir="source/devconfig/config"
scriptDir="source/devconfig/scripts"

if [ -d  ~/$configDir ]
then
  echo "Restoring configuration files"
  cp ~/$configDir/.gitconfig ~
  cp ~/$configDir/Nushell/config.nu ~/.config/nushell
  cp ~/$configDir/Vim/.gvimrc ~
  cp ~/$configDir/Vim/.vimrc ~
  cp ~/$configDir/VSCode/keybindings.json ~/$configDir/VSCode/settings.json ~/.config/Code/User
else
  echo "Configuration files not found in $configDir"
fi

echo

if [ -d ~/$scriptDir ]
then
  echo "Restoring scripts"
  cp -r ~/$scriptDir/. ~/.scripts
else
  echo "Scripts not found in $scriptDir"
fi

echo
echo "Adding Linux-specific Git configuration"
git config --global core.editor "vim"

echo
echo "All done!"

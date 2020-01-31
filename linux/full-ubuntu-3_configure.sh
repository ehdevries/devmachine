# before you run this script, make it executable: chmod +x full-ubuntu-3_configure.sh

# Step 3: configure installed software

cd

echo
echo "Installing VS Code extensions"

# Common
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension davidanson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.code-runner
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension pkief.material-icon-theme
code --install-extension robbowen.synthwave-vscode

# .NET
code --install-extension ionide.ionide-fsharp
code --install-extension ms-vscode.csharp
code --install-extension paolodellepiane.fantomas-fmt

# Web dev
code --install-extension angular.ng-template
code --install-extension auchenberg.vscode-browser-preview
code --install-extension burkeholland.simple-react-snippets
code --install-extension eg2.vscode-npm-script
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension glen-84.sass-lint
code --install-extension johnpapa.angular-essentials
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension nrwl.angular-console

# Linux
code --install-extension ms-python.python
code --install-extension sfodje.perlcritic
code --install-extension sfodje.perltidy

echo
echo "Installing npm global tools"
npm install -g @angular/cli
npm install -g sass-lint
npm install -g typescript

echo
echo "Installing dotnet global tools"
dotnet tool install -g fake-cli
dotnet tool install -g fantomas-tool

echo
configDir="source/devconfig/config"  # Location of my configuration files - change as needed
if [ -d  ~/$configDir ]
then
  echo "Restoring configuration files"
  cp ~/$configDir/.gitconfig ~
  cp ~/$configDir/starship.toml ~/.config
  cp ~/$configDir/Vim/.gvimrc ~
  cp ~/$configDir/Vim/.vimrc ~
  cp ~/$configDir/VSCode/keybindings.json ~/$configDir/VSCode/settings.json ~/.config/Code/User
else
  echo "Configuration files not found in $configDir"
  echo "If they're somewhere else, edit this script and try again"
fi

echo
echo "Adding Linux-specific Git configuration"
git config --global core.editor "vim"

echo
echo "All done!"

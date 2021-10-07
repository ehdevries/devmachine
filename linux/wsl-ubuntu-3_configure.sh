# before you run this script, make it executable: chmod +x wsl-ubuntu-3_configure.sh

# Step 3: configure installed software

cd

echo
echo "Installing npm global tools"
echo
npm install -g @angular/cli
npm install -g typescript

echo
configDir="source/devconfig/config"  # Location of my configuration files - change as needed
if [ -d  ~/$configDir ]
then
  echo "Restoring configuration files"
  cp ~/$configDir/.gitconfig ~
  cp ~/$configDir/starship.toml ~/.config
  cp ~/$configDir/Nushell/config.toml ~/.config/nu
  cp ~/$configDir/Vim/.gvimrc ~
  cp ~/$configDir/Vim/.vimrc ~
else
  echo "Configuration files not found in $configDir"
  echo "If they're somewhere else, edit this script and try again"
fi

echo
echo "Adding Linux-specific Git configuration"
git config --global core.editor "vim"

echo
echo "All done!"

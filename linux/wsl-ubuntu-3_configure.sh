# before you run this script, make it executable: chmod +x wsl-ubuntu-3_configure.sh

# Step 3: configure installed software

cd

echo
echo "Installing npm global tools"
echo
npm install -g @angular/cli
npm install -g typescript

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

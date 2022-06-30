### before you run this script, make it executable: chmod +x 5_configure-part-one.sh

# Locations of my configuration files and scripts - change as needed
configDir="source/devconfig/config"
scriptDir="source/devconfig/scripts"

echo

if [ -d  ~/$configDir ]
then
  echo "Restoring configuration files"
  cp ~/$configDir/.gitconfig ~
  cp ~/$configDir/Nushell/config.nu ~/$configDir/Nushell/env.nu ~/.config/nushell
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
echo "Downloading panache-git"
echo
git clone git@github.com:ehdevries/panache-git.git ~/.panache-git

echo
echo "Adding Linux-specific Git configuration"
git config --global core.editor "vim"

echo
echo "creating bash aliases"
echo "alias cls=clear
alias check='sudo apt update && apt list --upgradable'
alias ucheck='do-release-upgrade -c'
alias uv='echo \$(lsb_release -ds) \$(lsb_release -cs)'" >> ~/.bash_aliases

echo
echo "All done!"

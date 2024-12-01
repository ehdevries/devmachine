### Before you run this script, make it executable: chmod +x 4_configure-part-one.sh

# Locations of my configuration files and scripts - change as needed
configDir="source/machine/devconfig/config"
scriptDir="source/machine/devconfig/scripts"

echo

if [ -d  ~/$configDir ]
then
  echo "Restoring configuration files"
  cp ~/$configDir/.bash_aliases ~
  cp ~/$configDir/.gitconfig ~
  cp ~/$configDir/.wezterm.lua ~
  cp ~/$configDir/yazi.toml ~/.config/yazi/yazi.toml
  cp ~/$configDir/Helix/config.toml ~/$configDir/Helix/languages.toml ~/.config/helix
  cp ~/$configDir/Nushell/config.nu ~/$configDir/Nushell/env.nu ~/.config/nushell
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
echo "All done!"

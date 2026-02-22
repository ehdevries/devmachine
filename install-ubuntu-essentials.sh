### Before you run this script, make it executable: chmod +x install-ubuntu-essentials.sh

echo
echo "Adding Git package repository"
echo
sudo add-apt-repository ppa:git-core/ppa

echo
echo "Updating all existing packages"
echo
sudo apt update && sudo apt upgrade

echo
echo "Installing essential packages"
echo
sudo apt install build-essential curl file git procps unzip

echo
echo "Installing Homebrew"
echo
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

echo
echo "Installing Nushell"
echo
brew install nushell

echo
echo "Installing Volta"
echo
curl https://get.volta.sh | bash

echo
echo "Setting environment variables"
echo
echo '
# Set Helix as the default editor
export EDITOR="hx"
export VISUAL="hx"

# Opt out of dotnet CLI telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=true
' >> ~/.profile

echo
echo "Do you want to install Flatpak? [y/n]"
read installFlatpak
if [ "$installFlatpak" == "y" ]
then
  echo "Installing Flatpak"
  echo
  sudo apt install flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  echo
  echo "Please reboot before using Flatpak"
else
  echo "Skipping Flatpak installation"
fi

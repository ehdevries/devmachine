### Before you run this script, make it executable: chmod +x 1_install-part-one.sh

echo
echo "Adding package repositories"
echo
sudo add-apt-repository ppa:dotnet/backports
sudo add-apt-repository ppa:git-core/ppa

echo
echo "Updating all packages"
echo
sudo apt update && sudo apt upgrade

echo
echo "Installing apt packages"
echo
sudo apt install build-essential
sudo apt install curl
sudo apt install dotnet-sdk-8.0
sudo apt install dotnet-sdk-9.0
sudo apt install file
sudo apt install git
sudo apt install hyfetch
sudo apt install unzip

echo
echo "Installing Homebrew"
echo
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

echo
echo "Installing software with Homebrew"
echo
brew install bat
brew install carapace
brew install difftastic
brew install helix
brew tap hougesen/homebrew-tap
brew install hougesen/tap/kdlfmt
brew install lazygit
brew install nushell
brew install slides
brew install yazi
brew install zellij
brew install zola

echo
echo "Downloading panache-git"
echo
git clone https://github.com/ehdevries/panache-git.git ~/.panache-git

echo
echo "Installing Rust using rustup"
echo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo
echo "Installing Volta"
echo
curl https://get.volta.sh | bash

echo
echo "Installing Deno"
echo
curl -fsSL https://deno.land/install.sh | sh

echo
echo "Setting Helix as the default editor"
echo
echo '
# set Helix as the default editor
export EDITOR="hx"' >> ~/.profile

source ~/.bashrc
source ~/.profile

echo
echo "Almost done."
echo "Close and reopen your shell, then invoke this command to install Node.js:"
echo "volta install node"
echo

### Before you run this script, make it executable: chmod +x 1_install-part-one.sh

echo
echo "Adding package repository for Git stable channel"
echo
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
sudo apt install file
sudo apt install git
sudo apt install hyfetch

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
brew install difftastic
brew install helix
brew install lazygit
brew install lf
brew install nushell
brew tap rsteube/homebrew-tap
brew install rsteube/tap/carapace
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
echo "Installing Node Version Manager"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

echo
echo "Installing Deno"
echo
curl -fsSL https://deno.land/install.sh | sh
echo '
# add deno to path
export DENO_INSTALL="/home/ed/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"' >> ~/.bashrc

echo
echo "Setting Helix as the default editor"
echo
echo '
# set Helix as the default editor
export EDITOR="/home/linuxbrew/.linuxbrew/bin/hx"' >> ~/.profile

source ~/.bashrc
source ~/.profile

echo
echo "Almost done."
echo "Close and reopen your shell, then invoke this command to install Node.js:"
echo "nvm install --lts"
echo

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
sudo apt install neofetch
sudo apt install vim

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
brew install nushell
brew tap rsteube/homebrew-tap
brew install rsteube/tap/carapace
brew install zola

echo
echo "Installing bash-git-prompt"
echo
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
echo "
# configure and run bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line_Minimalist
source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc

echo
echo "Installing Rust using rustup"
echo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo
echo "Installing Node Version Manager"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

source ~/.bashrc
source ~/.profile

echo
echo "Almost done."
echo "Close and reopen your shell, then invoke this command to install Node.js:"
echo "nvm install --lts"
echo

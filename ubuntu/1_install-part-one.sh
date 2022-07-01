### before you run this script, make it executable: chmod +x 1_install-part-one.sh

echo
echo "adding package repository for Git stable channel"
echo
sudo add-apt-repository ppa:git-core/ppa

echo
echo "updating all packages"
echo
sudo apt update && sudo apt upgrade

echo
echo "installing apt packages"
echo
sudo apt install bat
sudo apt install build-essential
sudo apt install curl
sudo apt install file
sudo apt install git
sudo apt install neofetch
sudo apt install vim

echo
echo "fixing naming collision with a different bat package"
echo
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo
echo "installing Node.js LTS using Node Version Manager"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts

echo
echo "installing Rust using rustup"
echo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo
echo "installing bash-git-prompt"
echo
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
echo "
# configure and run bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line_Minimalist
source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc

echo
echo "installing Homebrew"
echo
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

source ~/.bashrc
source ~/.profile

### before you run this script, make it executable: chmod +x 1_install-part-one.sh

# add package source for Git stable channel
sudo add-apt-repository ppa:git-core/ppa

# update all packages
sudo apt update && sudo apt upgrade

# install apt packages
sudo apt install bat
sudo apt install git
sudo apt install neofetch
sudo apt install vim

# fix naming collision with a different bat package
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install Node.js LTS using Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts

# install rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
echo "
# configure and run bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line_Minimalist
source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc

source ~/.bashrc
